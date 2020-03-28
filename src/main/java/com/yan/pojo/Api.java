package com.yan.pojo;

public class Api {
    private Integer apiid;

    private String sname;

    private String url;

    private String returndataformat;

    private String returndata;

    private String requestmode;

    private String exestateobj;

    private String apitypetag;

    public Integer getApiid() {
        return apiid;
    }

    public void setApiid(Integer apiid) {
        this.apiid = apiid;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname == null ? null : sname.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getReturndataformat() {
        return returndataformat;
    }

    public void setReturndataformat(String returndataformat) {
        this.returndataformat = returndataformat == null ? null : returndataformat.trim();
    }

    public String getReturndata() {
        return returndata;
    }

    public void setReturndata(String returndata) {
        this.returndata = returndata == null ? null : returndata.trim();
    }

    public String getRequestmode() {
        return requestmode;
    }

    public void setRequestmode(String requestmode) {
        this.requestmode = requestmode == null ? null : requestmode.trim();
    }

    public String getExestateobj() {
        return exestateobj;
    }

    public void setExestateobj(String exestateobj) {
        this.exestateobj = exestateobj == null ? null : exestateobj.trim();
    }

    public String getApitypetag() {
        return apitypetag;
    }

    public void setApitypetag(String apitypetag) {
        this.apitypetag = apitypetag == null ? null : apitypetag.trim();
    }
}