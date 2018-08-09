package com.rzspider.project.common.file.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.rzspider.common.constant.FileExtensionConstant;
import com.rzspider.common.constant.FileMessageConstant;
import com.rzspider.common.constant.FileOtherConstant;
import com.rzspider.common.utils.FileUploadUtils;
import com.rzspider.framework.config.FilePathConfig;
import com.rzspider.framework.web.domain.Message;
import com.rzspider.project.common.file.FileType;
import com.rzspider.project.common.file.domain.FileDao;
import com.rzspider.project.common.file.service.IFileService;

/**
 * 文件操作
 * 
 * @author ricozhou
 * @date 2018-05-28
 */
@Controller
@RequestMapping("/common/file")
public class FileController {
	private String prefix = "/common/file";
	@Autowired
	private IFileService fileService;

	/**
	 * 文本编辑上传图片
	 */
	@ResponseBody
	@PostMapping("/uploadimg")
	public Message uploadimg(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
		String fileName = file.getOriginalFilename();
		if (!fileName.endsWith(FileExtensionConstant.FILE_EXTENSION_POINT_IMAGE_JPG)
				&& !fileName.endsWith(FileExtensionConstant.FILE_EXTENSION_POINT_IMAGE_PNG)
				&& !fileName.endsWith(FileExtensionConstant.FILE_EXTENSION_POINT_IMAGE_GIF)
				&& !fileName.endsWith(FileExtensionConstant.FILE_EXTENSION_POINT_IMAGE_JPEG)) {
			return Message.error(FileMessageConstant.FILE_MESSAGE_FORMAT_INCORRENT);
		}
		// 重命名
		fileName = FileUploadUtils.renameToUUID(fileName);
		FileDao sysFile = new FileDao(FileType.fileType(fileName), FileOtherConstant.FILE_JUMP_PATH_PREFIX + fileName,
				new Date());
		// 先上传
		try {
			FileUploadUtils.uploadFile(file.getBytes(), FilePathConfig.getUploadPath(), fileName);
		} catch (Exception e) {
			return Message.error(FileMessageConstant.FILE_MESSAGE_FILE_UPLOAD_FAILED);
		}

		if (fileService.save(sysFile) > 0) {
			return Message.success(sysFile.getUrl());
		}
		return Message.error();
	}
}
