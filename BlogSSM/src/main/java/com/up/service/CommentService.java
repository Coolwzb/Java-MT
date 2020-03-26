package com.up.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.up.dao.CommentMapper;
import com.up.entity.Blog;
import com.up.entity.Comment;
import com.up.entity.CommentExample;
import com.up.entity.CommentExample.Criteria;

@Service
public class CommentService {
	
	@Autowired
	CommentMapper commentMapper;
	
	/**
	 * 添加
	 */
	public int commentInsert(Comment comment) {
		return commentMapper.insert(comment);
	}
	
	
	/**
	 * 根据ID删除文章
	 */
	public int commentDeleteById(int id) {
		return commentMapper.deleteByPrimaryKey(id);
	}
	
	/**
	 * 批量删除 情况一:checkbox只选中一个 情况二:checkbox选中多个
	 */
	public int commentDeleteByCheckbox(List<Integer> list) {
		CommentExample commentExample = new CommentExample();
		Criteria criteria = commentExample.createCriteria();
		criteria.andIdIn(list);

		return commentMapper.deleteByExample(commentExample);
	}
	
	/**
	 * 根据ID查询文章
	 */
	public Comment commentSelectById(int id) {
		return commentMapper.selectByPrimaryKey(id);
	}

	/**
	 * 查询博客文章
	 */
	public Object articleSelect(Comment comment) {
		return commentMapper.selectByPrimaryKey(comment);
	}
	
	
	/**
	 * 分页查询
	 */
	public List<Comment> commentSelect() {
		return commentMapper.selectByExample(new CommentExample());
	}



}
