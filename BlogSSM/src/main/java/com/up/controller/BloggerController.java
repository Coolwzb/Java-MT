package com.up.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.up.entity.Blogger;
import com.up.entity.Msg;
import com.up.service.BloggerService;
import com.up.shiro.MD5;

@Controller
@RequestMapping("/admin")
public class BloggerController {

	@Autowired
	BloggerService bloggerService;

	/**
	 * 根据ID删除博主
	 */
	@ResponseBody
	@RequestMapping("bloggerDeleteById")
	public Msg bloggerDeleteById(int id) {
		int num = bloggerService.bloggerDeleteById(id);
		return Msg.success();
	}

	/**
	 * 批量删除 情况一:checkbox只选中一个 情况二:checkbox选中多个
	 */
	@ResponseBody
	@RequestMapping("bloggerDeleteByCheckbox")
	public Msg bloggerDeleteByCheckbox(String ids) {
		if (ids.contains("-")) {
			// 多选
			List<Integer> list = new ArrayList<Integer>();
			String[] str_ids = ids.split("-");
			for (String id : str_ids) {
				list.add(Integer.parseInt(id));
			}

			bloggerService.bloggerDeleteByCheckbox(list);
		} else {
			// 单选
			bloggerService.bloggerDeleteById(Integer.parseInt(ids));
		}

		return Msg.success();
	}

	/**
	 * 添加
	 */
	@ResponseBody
	@RequestMapping("bloggerInsert")
	public Msg bloggerInsert(@Valid Blogger blogger, BindingResult result) {
		if (result.hasErrors()) {
			Map<String, Object> map = new HashMap<String, Object>();

			// 校验失败,应该返回失败,在模态框显示校验失败的错误信息
			List<FieldError> list = result.getFieldErrors();
			for (FieldError fieldError : list) {
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.error().add("map", map);
		} else {

			String password_md5 = MD5.getMD5(blogger);
			blogger.setPassword(password_md5);

			int num = bloggerService.bloggerInsert(blogger);
			return Msg.success();
		}

	}

	/**
	 * 登录
	 */
	@ResponseBody
	@RequestMapping("bloggerSelectByLogin")
	public Msg bloggerSelectByLogin(Blogger blogger) {
		String password = blogger.getPassword();

		String password_md5 = MD5.getMD5(blogger);
		blogger.setPassword(password_md5);

		long num = bloggerService.bloggerSelectByLogin(blogger);
		if (num == 0) {
			return Msg.error().add("msg", "账号密码错误");
		} else {
			// Shiro认证
			Subject currentUser = SecurityUtils.getSubject();
			if (!currentUser.isAuthenticated()) {
				UsernamePasswordToken token = new UsernamePasswordToken(blogger.getName(), password);
				token.setRememberMe(true);
				try {
					currentUser.login(token);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			return Msg.success().add("blogger", blogger);
		}
	}

	/**
	 * 修改博主信息
	 */
	@ResponseBody
	@RequestMapping("bloggerUpdate")
	public Msg bloggerUpdate(@Valid Blogger blogger, BindingResult result) {
		if (result.hasErrors()) {
			Map<String, Object> map = new HashMap<String, Object>();

			// 校验失败,应该返回失败,在模态框显示校验失败的错误信息
			List<FieldError> list = result.getFieldErrors();
			for (FieldError fieldError : list) {
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.error().add("map", map);
		} else {
			bloggerService.bloggerUpdate(blogger);
			return Msg.success();
		}

	}

	/**
	 * 根据ID查询博主
	 */
	@ResponseBody
	@RequestMapping("bloggerSelectById")
	public Msg bloggerSelectById(int id) {
		Blogger blogger = bloggerService.bloggerSelectById(id);
		return Msg.success().add("blogger", blogger);
	}

	/**
	 * 查询用户名是否已经被占用
	 */
	@ResponseBody
	@RequestMapping("bloggerSelectByName")
	public Msg bloggerSelectByName(String name) {
		// Java正则表达式
//		String reg = "(^[a-zA-Z0-9_-]{6,19}$)|(^[\u2E80-\u9FFF]{2,5}$)";
//		if(name.matches(reg)){
//		}else{
//			return Msg.error().add("msg", "用户名必须是2-5位中文或6-19位英文和数字的组合");
//		}

		// 查询数据库进行校验
		boolean b = bloggerService.bloggerSelectByName(name);
		if (b) {
			return Msg.success().add("msg", "用户名可用");
		} else {
			return Msg.error().add("msg", "用户名已被占用");
		}
	}

	/**
	 * 分页查询
	 */
	@ResponseBody
	@RequestMapping("bloggerSelect")
	public Msg bloggerSelect(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		// 指定PageHelper当前页，每页显示长度
		PageHelper.startPage(pn, 6);
		// 查询数据库blogger表所有数据
		List<Blogger> list = bloggerService.bloggerSelect();
		// 绑定PageInfo
		PageInfo<Blogger> pageInfo = new PageInfo<Blogger>(list, 6);

		return Msg.success().add("pageInfo", pageInfo);
	}
	
	
//	@RequestMapping(value="/admin/article",method=RequestMethod.GET)
//	public String article(HttpServletRequest request) {
//		return "admin/article";
//	}
	
	
}
