package com.zhisolution.pojo;

public class User {

	private String status;
	private String timestamp;
	private UserData data;
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}
	public UserData getData() {
		return data;
	}
	public void setData(UserData data) {
		this.data = data;
	}
	
	@Override
	public String toString() {
		return "User [status=" + status + ", timestamp=" + timestamp
				+ ", data=" + data + "]";
	}
	
	
}
