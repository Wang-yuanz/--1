package com.yan.pojo;

import java.util.Date;

public class Feedback {
    private Integer fbid;

    private String fbcontent;

    private Date fbtime;

    private String fbuname;

    private Integer userid;

    public Integer getFbid() {
        return fbid;
    }

    public void setFbid(Integer fbid) {
        this.fbid = fbid;
    }

    public String getFbcontent() {
        return fbcontent;
    }

    public void setFbcontent(String fbcontent) {
        this.fbcontent = fbcontent == null ? null : fbcontent.trim();
    }

    public Date getFbtime() {
        return fbtime;
    }

    public void setFbtime(Date fbtime) {
        this.fbtime = fbtime;
    }

    public String getFbuname() {
        return fbuname;
    }

    public void setFbuname(String fbuname) {
        this.fbuname = fbuname == null ? null : fbuname.trim();
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

	public Feedback() {
		super();
	}

	public Feedback(Integer fbid, String fbcontent, Date fbtime, String fbuname, Integer userid) {
		super();
		this.fbid = fbid;
		this.fbcontent = fbcontent;
		this.fbtime = fbtime;
		this.fbuname = fbuname;
		this.userid = userid;
	}

	@Override
	public String toString() {
		return "Feedback [fbid=" + fbid + ", fbcontent=" + fbcontent + ", fbtime=" + fbtime + ", fbuname=" + fbuname + ", userid=" + userid + "]";
	}
    
    
}