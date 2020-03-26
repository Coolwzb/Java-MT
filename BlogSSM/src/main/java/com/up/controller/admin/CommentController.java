package com.up.controller.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.up.entity.Blog;
import com.up.entity.Comment;
import com.up.entity.Msg;
import com.up.service.CommentService;

@Controller
@RequestMapping("/admin")
public class CommentController {
	
	@Autowired
	CommentService commentService;
	
	
	/**
	 * 添加
	 */
	@ResponseBody
	@RequestMapping("commentInsert")
	public Msg commentInsert(Comment comment) {
		int num = commentService.commentInsert(comment);
		return Msg.success();
	}
	
	
	
	/**
	 * 根据ID删除文章
	 */
	@ResponseBody
	@RequestMapping("commentDeleteById")
	public Msg commentDeleteById(int id) {
		int num = commentService.commentDeleteById(id);
		return Msg.success();
	}
	
	/**
	 * 批量删除 情况一:checkbox只选中一个 情况二:checkbox选中多个
	 */
	@ResponseBody
	@RequestMapping("commentDeleteByCheckbox")
	public Msg commentDeleteByCheckbox(String ids) {
		if (ids.contains("-")) {
			// 多选
			List<Integer> list = new ArrayList<Integer>();
			String[] str_ids = ids.split("-");
			for (String id : str_ids) {
				list.add(Integer.parseInt(id));
			}

			commentService.commentDeleteByCheckbox(list);
		} else {
			// 单选
			commentService.commentDeleteById(Integer.parseInt(ids));
		}

		return Msg.success();
	}
	
	
	/**
	 * 根据ID查询
	 */
	@ResponseBody
	@RequestMapping("commentSelectById")
	public Msg commentSelectById(int id) {
		Comment comment = commentService.commentSelectById(id);
		return Msg.success().add("comment", comment);
	}
	
	/**
	 * 查看评论内容
	 */
	@ResponseBody
	@RequestMapping("acommentSelect")
	public Msg articleSelect(Comment comment){
		commentService.articleSelect(comment);
		return Msg.success();
	}
	
	
	
	/**
	 * 分页查询
	 */
	@ResponseBody
	@RequestMapping("commentSelect")
	public Msg commentSelect(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		PageHelper.startPage(pn, 4);
		List<Comment> list = commentService.commentSelect();
		PageInfo<Comment> pageInfo = new PageInfo<Comment>(list, 1);
		return Msg.success().add("pageInfo", pageInfo);
	}

}
