package com.rzspider.project.blog.blogwebsite.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.rzspider.common.utils.StringUtils;
import com.rzspider.project.blog.blogcontent.mapper.BlogcontentMapper;
import com.rzspider.project.blog.blogcontent.domain.Blogcontent;
import com.rzspider.project.blog.blogcontent.service.IBlogcontentService;

/**
 * 文章内容 服务层实现
 * 
 * @author ricozhou
 * @date 2018-06-12
 */
@Service
public class BlogwebsiteServiceImpl implements IBlogwebsiteService 
{
	@Autowired
	private BlogcontentMapper blogcontentMapper;
	
	/**
     * 查询文章内容信息
     * 
     * @param cid 文章内容ID
     * @return 文章内容信息
     */
	 @Override
	public Blogcontent selectBlogcontentById(Long cid)
	{
	    return blogcontentMapper.selectBlogcontentById(cid);
	}
	
	/**
     * 查询文章内容列表
     * 
     * @param blogcontent 文章内容信息
     * @return 文章内容集合
     */
	 @Override
	public List<Blogcontent> selectBlogcontentList(Blogcontent blogcontent)
	{
	    return blogcontentMapper.selectBlogcontentList(blogcontent);
	}
	
    /**
     * 新增文章内容
     * 
     * @param blogcontent 文章内容信息
     * @return 结果
     */
	 @Override
	public int insertBlogcontent(Blogcontent blogcontent)
	{
	    return blogcontentMapper.insertBlogcontent(blogcontent);
	}
	
	/**
     * 修改文章内容
     * 
     * @param blogcontent 文章内容信息
     * @return 结果
     */
	 @Override
	public int updateBlogcontent(Blogcontent blogcontent)
	{
	    return blogcontentMapper.updateBlogcontent(blogcontent);
	}
	
	/**
     * 保存文章内容
     * 
     * @param blogcontent 文章内容信息
     * @return 结果
     */
	 @Override
	public int saveBlogcontent(Blogcontent blogcontent)
	{
	    Long cid = blogcontent.getCid();
		int rows = 0;
		if (StringUtils.isNotNull(cid))
        {
		    rows = blogcontentMapper.updateBlogcontent(blogcontent);
		}
		else
        {
		    rows = blogcontentMapper.insertBlogcontent(blogcontent);
		}
		return rows;
	}
	
	/**
     * 删除文章内容信息
     * 
     * @param cid 文章内容ID
     * @return 结果
     */
	 @Override
	public int deleteBlogcontentById(Long cid)
	{
	    return blogcontentMapper.deleteBlogcontentById(cid);
	}
	
	/**
     * 批量删除文章内容对象
     * 
     * @param cids 需要删除的数据ID
     * @return 结果
     */
	 @Override
	public int batchDeleteBlogcontent(Long[] cids)
	{
		return blogcontentMapper.batchDeleteBlogcontent(cids);
	}
	
}
