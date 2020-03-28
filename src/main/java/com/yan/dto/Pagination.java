package com.yan.dto;

import java.io.Serializable;
/**
 * Datatable 插件所需要的两个传参数
 * @author ziyan.law
 *
 */
public class Pagination implements Serializable {

	private static final long serialVersionUID = -3100528640416937396L;
	
	private Integer start ;//起始
	private Integer length;//取多少条记录
	
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getLength() {
		return length;
	}
	public void setLength(Integer length) {
		this.length = length;
	}
	
}
