package com.yan.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 管理员实体类(要和表中的字段对应)
 * @author ziyan.law
 *
 */
@SuppressWarnings("serial")
public class Admin implements Serializable {
	private Integer adminid;//管理员编号
	private String adminuname;//管理员用户名
	private String adminpwd;//密码
	private Integer adminrole;//管理员权限(0:超级管理员  1 :管理员 )
	private String adminphone;//管理员手机号码
	private String  idno;//身份证
	private String  sex;//性别
	private String  addrs;//地址
	private String  pic;//照片
	private String  name;//姓名
	//构建  get  set 方法   这样有助于我们可以在其他的类中获取我们需要的属性
	public Admin() {
		super();
	}
	 
	public String getIdno() {
		return idno;
	}

	public void setIdno(String idno) {
		this.idno = idno;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}


	public String getAddrs() {
		return addrs;
	}
	public void setAddrs(String addrs) {
		this.addrs = addrs;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public Integer getAdminid() {
		return adminid;
	}
	public void setAdminid(Integer adminid) {
		this.adminid = adminid;
	}
	public String getAdminuname() {
		return adminuname;
	}
	public void setAdminuname(String adminuname) {
		this.adminuname = adminuname;
	}
	public String getAdminpwd() {
		return adminpwd;
	}
	public void setAdminpwd(String adminpwd) {
		this.adminpwd = adminpwd;
	}
	public Integer getAdminrole() {
		return adminrole;
	}
	public void setAdminrole(Integer adminrole) {
		this.adminrole = adminrole;
	}
	public String getAdminphone() {
		return adminphone;
	}
	public void setAdminphone(String adminphone) {
		this.adminphone = adminphone;
	}
	 
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Admin [adminid=" + adminid + ", adminuname=" + adminuname + ", adminpwd=" + adminpwd + ", adminrole=" + adminrole + ", adminphone="
				+ adminphone + ", idno=" + idno + ", sex=" + sex + ", addrs=" + addrs + ", pic=" + pic + ", name=" + name + "]";
	}

	public Admin(Integer adminid, String adminuname, String adminpwd, Integer adminrole, String adminphone, String idno, String sex, String addrs,
			String pic, String name) {
		super();
		this.adminid = adminid;
		this.adminuname = adminuname;
		this.adminpwd = adminpwd;
		this.adminrole = adminrole;
		this.adminphone = adminphone;
		this.idno = idno;
		this.sex = sex;
		this.addrs = addrs;
		this.pic = pic;
		this.name = name;
	}
	
}
