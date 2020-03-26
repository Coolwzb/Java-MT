package com.up.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.up.entity.BlogType;
import com.up.entity.Msg;
import com.up.service.BlogTypeService;

@Controller
@RequestMapping("/admin")
public class BlogTypeController {

	@Autowired
	BlogTypeService blogTypeService;
	
	/**
	 * 添加
	 */
	@ResponseBody
	@RequestMapping("blogtypeInsert")
	public Msg blogtypeInsert(BlogType blogType) {
		int num = blogTypeService.blogtypeInsert(blogType);
		return Msg.success();
	}
	
	
	/**
	 * 根据ID删除类别
	 */
	@ResponseBody
	@RequestMapping("blogtypeDeleteById")
	public Msg blogtypeDeleteById(int id) {
		int num = blogTypeService.blogtypeDeleteById(id);
		return Msg.success();
	}

	/**
	 * 修改类别信息
	 */
	@ResponseBody
	@RequestMapping("blogtypeUpdate")
	public Msg blogtypeUpdate(BlogType blogType) {
		blogTypeService.blogTypeUpdate(blogType);
		return Msg.success();
	}

	/**
	 * 根据ID查询类别
	 */
	@ResponseBody
	@RequestMapping("blogtypeSelectById")
	public Msg blogtypeSelectById(int id) {
		BlogType blogType = blogTypeService.blogtypeSelectById(id);
		return Msg.success().add("blogType", blogType);
	}

	/**
	 * 分页查询
	 */
	@ResponseBody
	@RequestMapping("blogtypeSelect")
	public Msg blogtypeSelect(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		PageHelper.startPage(pn, 4);
		List<BlogType> list = blogTypeService.blogtypeSelect();
		PageInfo<BlogType> pageInfo = new PageInfo<BlogType>(list, 1);
		return Msg.success().add("pageInfo", pageInfo);
	}

}
