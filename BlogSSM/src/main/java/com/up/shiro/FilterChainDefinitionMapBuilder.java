package com.up.shiro;

import java.util.LinkedHashMap;

public class FilterChainDefinitionMapBuilder {

	// 配置哪些页面需要受保护,以及访问这些页面需要的权限
	// anon:可以被匿名访问
	// authc:必须认证(即登录)之后才可以访问的页面
	// logout:登出
	public LinkedHashMap<String, String> builderFilterChainDefinitionMap() {
		LinkedHashMap<String, String> map = new LinkedHashMap<>();
		map.put("/bloggerSelectByLogin", "anon");
		map.put("/logout", "logout");

		// static静态资源
		map.put("/static/**", "anon");
		
		map.put("/admin/main.jsp","anon"); 
		
		return map;
	}
}
