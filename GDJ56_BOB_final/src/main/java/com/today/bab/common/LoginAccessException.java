package com.today.bab.common;

public class LoginAccessException extends RuntimeException{
	
	public LoginAccessException(String msg) {
		super(msg);
		//나중에 특정 페이지로 가는 거 구현하기
	}
}
