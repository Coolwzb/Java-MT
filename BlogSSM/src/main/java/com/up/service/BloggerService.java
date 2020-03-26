package com.up.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.up.dao.BloggerMapper;
import com.up.entity.Blogger;
import com.up.entity.BloggerExample;
import com.up.entity.BloggerExample.Criteria;

@Service
public class BloggerService {

	@Autowired
	BloggerMapper bloggerMapper;

	/**
	 * 登录
	 */
	public long bloggerSelectByLogin(Blogger blogger) {
		BloggerExample bloggerExample = new BloggerExample();
		Criteria criteria = bloggerExample.createCriteria();
		criteria.andNameEqualTo(blogger.getName());
		criteria.andPasswordEqualTo(blogger.getPassword());

		return bloggerMapper.countByExample(bloggerExample);
	}

	/**
	 * 添加
	 */
	public int bloggerInsert(Blogger blogger) {
		return bloggerMapper.insert(blogger);
	}

	/**
	 * 根据ID删除博主
	 */
	public int bloggerDeleteById(int id) {
		return bloggerMapper.deleteByPrimaryKey(id);
	}

	/**
	 * 批量删除 情况一:checkbox只选中一个 情况二:checkbox选中多个
	 */
	public int bloggerDeleteByCheckbox(List<Integer> list) {
		BloggerExample bloggerExample = new BloggerExample();
		Criteria criteria = bloggerExample.createCriteria();
		criteria.andIdIn(list);

		return bloggerMapper.deleteByExample(bloggerExample);
	}

	/**
	 * 根据ID查询博主
	 */
	public Blogger bloggerSelectById(int id) {
		return bloggerMapper.selectByPrimaryKey(id);
	}

	/**
	 * 查询用户名是否已经被占用
	 */
	public boolean bloggerSelectByName(String name) {
		BloggerExample bloggerExample = new BloggerExample();
		Criteria criteria = bloggerExample.createCriteria();
		criteria.andNameEqualTo(name);

		long count = bloggerMapper.countByExample(bloggerExample);
		return count == 0;
	}

	/**
	 * 分页查询
	 */
	public List<Blogger> bloggerSelect() {
		return bloggerMapper.selectByExample(new BloggerExample());
	}

	/**
	 * 修改博主信息
	 */
	public int bloggerUpdate(Blogger blogger) {
		return bloggerMapper.updateByPrimaryKeySelective(blogger);
	}
	
	
	
}
