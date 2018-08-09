package com.rzspider.project.blog.blogcontent.mapper;

import com.rzspider.project.blog.blogcontent.domain.Blogcontent;
import java.util.List;	

/**
 * 文章内容 数据层
 * 
 * @author ricozhou
 * @date 2018-06-12
 */
public interface BlogcontentMapper 
{

	/**
     * 查询文章内容信息
     * 
     * @param cid 文章内容ID
     * @return 文章内容信息
     */
	public Blogcontent selectBlogcontentById(Long cid);
	
	/**
     * 查询文章内容列表
     * 
     * @param blogcontent 文章内容信息
     * @return 文章内容集合
     */
	public List<Blogcontent> selectBlogcontentList(Blogcontent blogcontent);
	
	/**
     * 新增文章内容
     * 
     * @param blogcontent 文章内容信息
     * @return 结果
     */
	public int insertBlogcontent(Blogcontent blogcontent);
	
	/**
     * 修改文章内容
     * 
     * @param blogcontent 文章内容信息
     * @return 结果
     */
	public int updateBlogcontent(Blogcontent blogcontent);
	
	/**
     * 删除文章内容
     * 
     * @param cid 文章内容ID
     * @return 结果
     */
	public int deleteBlogcontentById(Long cid);
	
	/**
     * 批量删除文章内容
     * 
     * @param cids 需要删除的数据ID
     * @return 结果
     */
	public int batchDeleteBlogcontent(Long[] cids);
	
}