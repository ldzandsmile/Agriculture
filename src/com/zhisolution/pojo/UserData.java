package com.zhisolution.pojo;

public class UserData {

	private String token;
	private String refreshToken;
	
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getRefreshToken() {
		return refreshToken;
	}
	public void setRefreshToken(String refreshToken) {
		this.refreshToken = refreshToken;
	}
	
	@Override
	public String toString() {
		return "UserData [token=" + token + ", refreshToken=" + refreshToken
				+ "]";
	}
	
	
}
