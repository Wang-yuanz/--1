package com.yan.pojo;

import java.io.Serializable;
import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class UploadPojo  implements Serializable{

	
	private String resid;
	private MultipartFile[] uplodFile;
	private String ubid;
	
	
	
	
	
	public String getResid() {
		return resid;
	}
	public void setResid(String resid) {
		this.resid = resid;
	}
	public MultipartFile[] getUplodFile() {
		return uplodFile;
	}
	public void setUplodFile(MultipartFile[] uplodFile) {
		this.uplodFile = uplodFile;
	}
	 
	 
	public UploadPojo() {
		super();
	}
	public String getUbid() {
		return ubid;
	}
	public void setUbid(String ubid) {
		this.ubid = ubid;
	}
	public UploadPojo(String resid, MultipartFile[] uplodFile, String ubid) {
		super();
		this.resid = resid;
		this.uplodFile = uplodFile;
		this.ubid = ubid;
	}
	@Override
	public String toString() {
		return "UploadPojo [resid=" + resid + ", uplodFile=" + Arrays.toString(uplodFile) + ", ubid=" + ubid + "]";
	}
	
}
