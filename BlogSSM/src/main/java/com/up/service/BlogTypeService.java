package com.up.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.up.dao.BlogTypeMapper;
import com.up.entity.BlogType;
import com.up.entity.BlogTypeExample;

@Service
public class BlogTypeService {

	@Autowired
	BlogTypeMapper blogTypeMapper;
	
	/**
	 * 添加
	 */
	public int blogtypeInsert(BlogType blogType) {
		return blogTypeMapper.insert(blogType);
	}
	
	
	/**
	 * 根据ID删除类别
	 */
	public int blogtypeDeleteById(int id) {
		return blogTypeMapper.deleteByPrimaryKey(id);
	}

	/**
	 * 修改类别信息
	 */
	public int blogTypeUpdate(BlogType blogType) {
		return blogTypeMapper.updateByPrimaryKeySelective(blogType);
	}

	/**
	 * 根据ID查询类别
	 */
	public BlogType blogtypeSelectById(int id) {
		return blogTypeMapper.selectByPrimaryKey(id);
	}

	/**
	 * 分页查询
	 */
	public List<BlogType> blogtypeSelect() {
		return blogTypeMapper.selectByExample(new BlogTypeExample());
	}

	

}
