package com.yan.pojo;

public class OutputparamKey {
    private Integer apiid;

    private String pname;

    public Integer getApiid() {
        return apiid;
    }

    public void setApiid(Integer apiid) {
        this.apiid = apiid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname == null ? null : pname.trim();
    }
}