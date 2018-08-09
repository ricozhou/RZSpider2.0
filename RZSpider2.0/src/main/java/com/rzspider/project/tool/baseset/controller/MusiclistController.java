package com.rzspider.project.tool.baseset.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.tomcat.util.http.fileupload.FileUploadBase.FileSizeLimitExceededException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.rzspider.project.tool.baseset.domain.Baseset;
import com.rzspider.project.tool.baseset.domain.Musiclist;
import com.rzspider.project.tool.baseset.service.IBasesetService;
import com.rzspider.project.tool.baseset.service.IMusiclistService;
import com.itextpdf.text.log.SysoCounter;
import com.rzspider.common.constant.FileExtensionConstant;
import com.rzspider.common.constant.FileMessageConstant;
import com.rzspider.common.constant.project.ToolConstant;
import com.rzspider.common.utils.FileUploadUtils;
import com.rzspider.framework.config.FilePathConfig;
import com.rzspider.framework.web.controller.BaseController;
import com.rzspider.framework.web.page.TableDataInfo;
import com.rzspider.framework.web.domain.Message;

/**
 * 歌曲 信息操作处理
 * 
 * @author ricozhou
 * @date 2018-06-28
 */
@Controller
@RequestMapping("/tool/baseset/detailedit/musiclist")
public class MusiclistController extends BaseController {
	private String prefix = "tool/baseset/detailedit/musiclist";

	@Autowired
	private IMusiclistService musiclistService;
	@Autowired
	private IBasesetService basesetService;

	/**
	 * 查询歌曲列表
	 */
	@GetMapping("/list")
	@ResponseBody
	public TableDataInfo list(Musiclist musiclist) {
		startPage();
		List<Musiclist> list = musiclistService.selectMusiclistList(musiclist);
		return getDataTable(list);
	}

	/**
	 * 新增歌曲
	 */
	@GetMapping("/add/{basesetId}")
	public String add(@PathVariable("basesetId") Integer basesetId, Model model) {
		if (basesetService.selectBasesetById(basesetId) == null) {
			return prefix + "/error";
		}
		model.addAttribute("basesetId", basesetId);
		return prefix + "/add";
	}

	/**
	 * 音乐其它设置
	 */
	@GetMapping("/otherSet/{basesetId}")
	public String otherSet(@PathVariable("basesetId") Integer basesetId, Model model) {
		// 查询设置
		Baseset baseset = basesetService.selectBasesetById(basesetId);
		model.addAttribute("baseset", baseset);
		return prefix + "/otherSet";
	}

	/**
	 * 保存其它设置
	 */
	@PostMapping("/otherSet")
	@ResponseBody
	public Message otherSet(Baseset baseset) {
		if (basesetService.updateMusicOtherSet(baseset) > 0) {
			return Message.success();
		}
		return Message.error(ToolConstant.TOOL_SAVE_FAILED);
	}
	
	/**
	 * 批量新增歌曲
	 */
	@GetMapping("/batchAdd/{basesetId}")
	public String batchAdd(@PathVariable("basesetId") Integer basesetId, Model model) {
		if (basesetService.selectBasesetById(basesetId) == null) {
			return prefix + "/error";
		}
		model.addAttribute("basesetId", basesetId);
		return prefix + "/batchAdd";
	}

	/**
	 * 修改歌曲
	 */
	@GetMapping("/edit/{musicId}")
	public String edit(@PathVariable("musicId") Integer musicId, Model model) {
		Musiclist musiclist = musiclistService.selectMusiclistById(musicId);
		if (musiclist == null || musiclist.getBasesetId() == null) {
			return prefix + "/error";
		}
		model.addAttribute("musiclist", musiclist);
		return prefix + "/edit";
	}

	/**
	 * 保存歌曲
	 */
	@PostMapping("/save")
	@ResponseBody
	public Message save(Musiclist musiclist) {
		if (musiclistService.saveMusiclist(musiclist) > 0) {
			return Message.success();
		}
		return Message.error(ToolConstant.TOOL_SAVE_FAILED);
	}

	/**
	 * 批量保存歌曲
	 */
	@PostMapping("/batchSave")
	@ResponseBody
	public Message batchSave(Musiclist musiclist) {
		if (musiclistService.batchSaveMusiclist(musiclist) > 0) {
			return Message.success();
		}
		return Message.error(ToolConstant.TOOL_SAVE_FAILED);
	}

	/**
	 * 删除歌曲
	 */
	@PostMapping("/remove/{musicId}")
	@ResponseBody
	public Message remove(@PathVariable("musicId") Integer musicId) {
		if (musiclistService.deleteMusiclistById(musicId) > 0) {
			return Message.success();
		}
		return Message.error(ToolConstant.TOOL_BASESET_MESSAGE_NO_EXIST);
	}

	/**
	 * 批量删除歌曲
	 */
	@PostMapping("/batchRemove")
	@ResponseBody
	public Message remove(@RequestParam("ids[]") Integer[] musicIds) {
		int rows = musiclistService.batchDeleteMusiclist(musicIds);
		if (rows > 0) {
			return Message.success();
		}
		return Message.error(ToolConstant.TOOL_BASESET_MESSAGE_NO_EXIST);
	}

	/**
	 * 上传文件,音乐MP3,封面图片
	 */
	@ResponseBody
	@PostMapping("/uploadMusicFile/{flag}")
	public Message uploadMusicFile(@PathVariable("flag") Integer flag, @RequestParam("file") MultipartFile file,
			HttpServletRequest request) {
		// 原始名字
		String fileName = file.getOriginalFilename();
		if (flag == 0) {
			if (!fileName.endsWith(FileExtensionConstant.FILE_EXTENSION_POINT_FILE_MP3)
					&& !fileName.endsWith(FileExtensionConstant.FILE_EXTENSION_POINT_FILE_WAV)
					&& !fileName.endsWith(FileExtensionConstant.FILE_EXTENSION_POINT_FILE_MIDI)
					&& !fileName.endsWith(FileExtensionConstant.FILE_EXTENSION_POINT_FILE_WMA)) {
				return Message.error(FileMessageConstant.FILE_MESSAGE_FORMAT_INCORRENT);
			}
		} else if (flag == 1) {
			if (!fileName.endsWith(FileExtensionConstant.FILE_EXTENSION_POINT_IMAGE_JPG)
					&& !fileName.endsWith(FileExtensionConstant.FILE_EXTENSION_POINT_IMAGE_PNG)
					&& !fileName.endsWith(FileExtensionConstant.FILE_EXTENSION_POINT_IMAGE_JPEG)
					&& !fileName.endsWith(FileExtensionConstant.FILE_EXTENSION_POINT_IMAGE_GIF)) {
				return Message.error(FileMessageConstant.FILE_MESSAGE_FORMAT_INCORRENT);
			}
		}

		// 重命名
		fileName = FileUploadUtils.renameToUUID(fileName);
		// 先上传
		try {
			FileUploadUtils.uploadFile(file.getBytes(), FilePathConfig.getUploadPath(), fileName);
			// 返回文件名
			return Message.success(fileName);
		} catch (Exception e) {
			return Message.error(FileMessageConstant.FILE_MESSAGE_FILE_UPLOAD_FAILED);
		}
	}

}
