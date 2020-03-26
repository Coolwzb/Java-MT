package com.up.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.up.dao.BlogMapper;
import com.up.entity.Blog;
import com.up.entity.BlogExample;

@Service
public class BlogService {

	@Autowired
	BlogMapper blogMapper;

	/**
	 * 添加
	 */
	public int blogInsert(Blog blog) {
		return blogMapper.insert(blog);
	}
	
	/**
	 * 根据ID删除文章
	 */
	public int blogDeleteById(int id) {
		return blogMapper.deleteByPrimaryKey(id);
	}
	
	
	/**
	 * 根据ID查询文章
	 */
	public Blog blogSelectById(int id) {
		return blogMapper.selectByPrimaryKey(id);
	}

	/**
	 * 查询博客文章
	 */
	public Object articleSelect(Blog blog) {
		return blogMapper.selectByPrimaryKey(blog);
	}

	/**
	 * 分页查询
	 */
	public List<Blog> blogSelect() {
		return blogMapper.selectByExample(new BlogExample());
	}

}
