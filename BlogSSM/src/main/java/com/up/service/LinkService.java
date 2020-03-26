package com.up.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.up.dao.LinkMapper;
import com.up.entity.LinkExample;
import com.up.entity.Link;

@Service
public class LinkService {

	@Autowired
	LinkMapper linkMapper;
	
	/**
	 * 添加
	 */
	public int linkInsert(Link link) {
		return linkMapper.insert(link);
	}
	
	
	/**
	 * 根据ID删除类别
	 */
	public int linkDeleteById(int id) {
		return linkMapper.deleteByPrimaryKey(id);
	}

	/**
	 * 修改类别信息
	 */
	public int linkUpdate(Link link) {
		return linkMapper.updateByPrimaryKeySelective(link);
	}

	/**
	 * 根据ID查询类别
	 */
	public Link linkSelectById(int id) {
		return linkMapper.selectByPrimaryKey(id);
	}

	/**
	 * 分页查询
	 */
	public List<Link> linkSelect() {
		return linkMapper.selectByExample(new LinkExample());
	}

	
}
