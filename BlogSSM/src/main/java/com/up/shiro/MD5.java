package com.up.shiro;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

import com.up.entity.Blogger;

public class MD5 {
	
	public static String getMD5(Blogger blogger){
		//密码通过MD5盐值加密1024次
		String hashAlgorithmName = "MD5";
		Object credentials = blogger.getPassword();
		Object salt = ByteSource.Util.bytes(blogger.getName());
		int hasIterations = 1024;
		
		Object password_md5 = new SimpleHash(hashAlgorithmName,credentials,salt,hasIterations);
		return password_md5.toString();
	}

}
