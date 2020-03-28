package com.yan.pojo;

public class ApiWithBLOBs extends Api {
    private String requestexample;

    private String remark;

    public String getRequestexample() {
        return requestexample;
    }

    public void setRequestexample(String requestexample) {
        this.requestexample = requestexample == null ? null : requestexample.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}