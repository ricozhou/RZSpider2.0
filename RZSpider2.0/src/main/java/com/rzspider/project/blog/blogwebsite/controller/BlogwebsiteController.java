package com.rzspider.project.blog.blogwebsite.controller;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.rzspider.common.utils.DateUtils;
import com.rzspider.framework.web.controller.BaseController;
import com.rzspider.framework.web.page.TableDataInfo;
import com.rzspider.project.blog.blogcontent.domain.Blogcontent;
import com.rzspider.project.blog.blogwebsite.service.IBlogwebsiteService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 博客网站 信息操作处理
 * 
 * @author ricozhou
 * @date 2018-06-12
 */
@Controller
@RequestMapping("/rzblog")
public class BlogwebsiteController extends BaseController{
	@Autowired
	private IBlogwebsiteService blogwebsiteService;

	//到主界面
	@GetMapping()
	public String blog() {
		return "blog/index/main";
	}
	
	/**
	 * 查询文章内容列表
	 *获取文章列表用于展示 blog/open/list?type=article&limit=10&offset=
	 */
	@GetMapping("/open/list")
	@ResponseBody
	public TableDataInfo opentList(Blogcontent blogcontent)
	{
		startPage();
        List<Blogcontent> list = blogwebsiteService.selectBlogcontentList(blogcontent);
		return getDataTable(list);
	}
	
	/**
	 *根据id查询，反馈到单独页面
	 */
	@GetMapping("/open/post/{cid}")
	String post(@PathVariable("cid") Long cid, Model model) {
		//根据id查询
		Blogcontent blogcontent = blogwebsiteService.selectBlogcontentById(cid);
		model.addAttribute("blogcontent", blogcontent);
		model.addAttribute("gtmModified", DateUtils.format(blogcontent.getGtmModified()));
		return "blog/index/post";
	}
//	@GetMapping("/open/page/{categories}")
//	String about(@PathVariable("categories") String categories, Model model) {
//		Map<String, Object> map = new HashMap<>(16);
//		map.put("categories", categories);
//		ContentDO bContentDO =null;
//		if(bContentService.list(map).size()>0){
//			 bContentDO = bContentService.list(map).get(0);
//		}
//		model.addAttribute("bContent", bContentDO);
//		return "blog/index/post";
//	}
}
