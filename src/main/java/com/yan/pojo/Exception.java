package com.yan.pojo;

public class Exception extends ExceptionKey {
    private String excvalue;

    private String excmsg;

    private String exctype;

    public String getExcvalue() {
        return excvalue;
    }

    public void setExcvalue(String excvalue) {
        this.excvalue = excvalue == null ? null : excvalue.trim();
    }

    public String getExcmsg() {
        return excmsg;
    }

    public void setExcmsg(String excmsg) {
        this.excmsg = excmsg == null ? null : excmsg.trim();
    }

    public String getExctype() {
        return exctype;
    }

    public void setExctype(String exctype) {
        this.exctype = exctype == null ? null : exctype.trim();
    }
}