package com.up.shiro;

import java.util.HashSet;
import java.util.Set;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

import com.up.entity.Blogger;

public class LoginRealm extends AuthorizingRealm{

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		UsernamePasswordToken upToken = (UsernamePasswordToken)token;
		
		String name = upToken.getUsername();
		char[] password = upToken.getPassword();
		StringBuffer sb = new StringBuffer();
		for(int i=0;i<password.length;i++){
			sb.append(password[i]);
		}
		
		Blogger blogger = new Blogger();
		blogger.setName(name);
		blogger.setPassword(sb.toString());
		String password_md5 = MD5.getMD5(blogger);
		
		
		Object principal = name;
		Object credentials = password_md5;
		ByteSource credentialsSalt = ByteSource.Util.bytes(name);
		String realmName = getName();
		SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(principal,credentials,credentialsSalt,realmName);

		return info;
	}

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		/*
		 * Object principal = principals.getPrimaryPrincipal();
		 * 
		 * Set<String> roles = new HashSet<>(); roles.add(principal.toString());
		 * 
		 * SimpleAuthorizationInfo info = new SimpleAuthorizationInfo(roles);
		 */
		return null;
	}
}


