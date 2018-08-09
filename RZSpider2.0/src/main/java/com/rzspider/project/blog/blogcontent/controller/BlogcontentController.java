package com.rzspider.project.blog.blogcontent.controller;

import java.util.Date;
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

import com.rzspider.project.blog.blogcontent.domain.Blogcontent;
import com.rzspider.project.blog.blogcontent.service.IBlogcontentService;
import com.rzspider.project.common.file.FileType;
import com.rzspider.project.common.file.domain.FileDao;
import com.rzspider.project.common.file.service.IFileService;
import com.rzspider.common.utils.FileUploadUtils;
import com.rzspider.framework.config.FilePathConfig;
import com.rzspider.framework.web.controller.BaseController;
import com.rzspider.framework.web.page.TableDataInfo;
import com.rzspider.framework.web.domain.Message;

/**
 * 文章内容 信息操作处理
 * 
 * @author ricozhou
 * @date 2018-06-12
 */
@Controller
@RequestMapping("/blog/blogcontent")
public class BlogcontentController extends BaseController {
	private String prefix = "blog/blogcontent";

	@Autowired
	private IBlogcontentService blogcontentService;
	@Autowired
	private IFileService fileService;

	@GetMapping()
	@RequiresPermissions("blog:blogcontent:view")
	public String blogcontent() {
		return prefix + "/blogcontent";
	}

	/**
	 * 查询文章内容列表
	 */
	@RequiresPermissions("blog:blogcontent:list")
	@GetMapping("/list")
	@ResponseBody
	public TableDataInfo list(Blogcontent blogcontent) {
		startPage();
		List<Blogcontent> list = blogcontentService.selectBlogcontentList(blogcontent);
		return getDataTable(list);
	}

	/**
	 * 新增文章内容
	 */
	@RequiresPermissions("blog:blogcontent:add")
	@GetMapping("/add")
	public String add() {
		return prefix + "/add";
	}

	/**
	 * 修改文章内容
	 */
	@RequiresPermissions("blog:blogcontent:edit")
	@GetMapping("/edit/{cid}")
	public String edit(@PathVariable("cid") Long cid, Model model) {
		Blogcontent blogcontent = blogcontentService.selectBlogcontentById(cid);
		model.addAttribute("blogcontent", blogcontent);
		return prefix + "/edit";
	}

	/**
	 * 保存文章内容
	 */
	@RequiresPermissions("blog:blogcontent:save")
	@PostMapping("/save")
	@ResponseBody
	public Message save(Blogcontent blogcontent) {
		if (blogcontent.getType() == null) {
			blogcontent.setType("article");
		}
		if (blogcontentService.saveBlogcontent(blogcontent) > 0) {
			return Message.success();
		}
		return Message.error();
	}

	/**
	 * 删除文章内容
	 */
	@RequiresPermissions("blog:blogcontent:remove")
	@PostMapping("/remove/{cid}")
	@ResponseBody
	public Message remove(@PathVariable("cid") Long cid) {
		if (blogcontentService.deleteBlogcontentById(cid) > 0) {
			return Message.success();
		}
		return Message.error();
	}

	/**
	 * 批量删除文章内容
	 */
	@RequiresPermissions("blog:blogcontent:batchRemove")
	@PostMapping("/batchRemove")
	@ResponseBody
	public Message remove(@RequestParam("ids[]") Long[] cids) {
		int rows = blogcontentService.batchDeleteBlogcontent(cids);
		if (rows > 0) {
			return Message.success();
		}
		return Message.error();
	}

}
