package com.yan.pojo;

public class Service {
    private String sname;

    private String provider;

    private String providerurl;

    private String remark;

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname == null ? null : sname.trim();
    }

    public String getProvider() {
        return provider;
    }

    public void setProvider(String provider) {
        this.provider = provider == null ? null : provider.trim();
    }

    public String getProviderurl() {
        return providerurl;
    }

    public void setProviderurl(String providerurl) {
        this.providerurl = providerurl == null ? null : providerurl.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}