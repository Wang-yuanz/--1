package com.yan.pojo;

public class ExceptionKey {
    private Integer apiid;

    private String excname;

    public Integer getApiid() {
        return apiid;
    }

    public void setApiid(Integer apiid) {
        this.apiid = apiid;
    }

    public String getExcname() {
        return excname;
    }

    public void setExcname(String excname) {
        this.excname = excname == null ? null : excname.trim();
    }
}