package com.yc.util;

public class ResultData {
	private String msg;
	private Integer flag;
	private Object data;
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Integer getFlag() {
		return flag;
	}
	public void setFlag(Integer flag) {
		this.flag = flag;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	@Override
	public String toString() {
		return "ResultData [msg=" + msg + ", flag=" + flag + ", data=" + data
				+ "]";
	}
}
