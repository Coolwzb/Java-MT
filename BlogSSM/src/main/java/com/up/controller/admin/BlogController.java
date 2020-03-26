package com.up.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.up.entity.Blog;
import com.up.entity.Msg;
import com.up.service.BlogService;

@Controller
@RequestMapping("/admin")
public class BlogController {
	
	@Autowired
	BlogService blogService;
	
	/**
	 * 添加
	 */
	@ResponseBody
	@RequestMapping("blogInsert")
	public Msg blogInsert(Blog blog) {
		int num = blogService.blogInsert(blog);
		return Msg.success();
	}
	
	/**
	 * 根据ID删除文章
	 */
	@ResponseBody
	@RequestMapping("blogDeleteById")
	public Msg blogDeleteById(int id) {
		int num = blogService.blogDeleteById(id);
		return Msg.success();
	}
	
	
	
	/**
	 * 根据ID查询文章
	 */
	@ResponseBody
	@RequestMapping("blogSelectById")
	public Msg blogSelectById(int id) {
		Blog blog = blogService.blogSelectById(id);
		return Msg.success().add("blog", blog);
	}
	
	/**
	 * 查看博客文章
	 */
	@ResponseBody
	@RequestMapping("articleSelect")
	public Msg articleSelect(Blog blog){
		blogService.articleSelect(blog);
		return Msg.success();
	}
	
	
	
	/**
	 * 分页查询
	 */
	@ResponseBody
	@RequestMapping("blogSelect")
	public Msg blogSelect(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		PageHelper.startPage(pn, 4);
		List<Blog> list = blogService.blogSelect();
		PageInfo<Blog> pageInfo = new PageInfo<Blog>(list, 1);
		return Msg.success().add("pageInfo", pageInfo);
	}

}
