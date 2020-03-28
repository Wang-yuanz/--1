package com.yan.pojo;

public class Outputparam extends OutputparamKey {
    private String datetype;

    private String pformat;

    private String parentparam;

    private String isset;

    private String preset;

    public String getDatetype() {
        return datetype;
    }

    public void setDatetype(String datetype) {
        this.datetype = datetype == null ? null : datetype.trim();
    }

    public String getPformat() {
        return pformat;
    }

    public void setPformat(String pformat) {
        this.pformat = pformat == null ? null : pformat.trim();
    }

    public String getParentparam() {
        return parentparam;
    }

    public void setParentparam(String parentparam) {
        this.parentparam = parentparam == null ? null : parentparam.trim();
    }

    public String getIsset() {
        return isset;
    }

    public void setIsset(String isset) {
        this.isset = isset == null ? null : isset.trim();
    }

    public String getPreset() {
        return preset;
    }

    public void setPreset(String preset) {
        this.preset = preset == null ? null : preset.trim();
    }
}