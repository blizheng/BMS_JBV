package com.BMS.vo;

public class Manager {
    private int manager_id;
    private String manaegr_passwd;
    private String manager_name;
    private String manager_privilege;

    public int getManager_id() {
        return manager_id;
    }

    public void setManager_id(int manager_id) {
        this.manager_id = manager_id;
    }

    public String getManaegr_passwd() {
        return manaegr_passwd;
    }

    public void setManaegr_passwd(String manaegr_passwd) {
        this.manaegr_passwd = manaegr_passwd;
    }

    public String getManager_name() {
        return manager_name;
    }

    public void setManager_name(String manager_name) {
        this.manager_name = manager_name;
    }

    public String getManager_privilege() {
        return manager_privilege;
    }

    public void setManager_privilege(String manager_privilege) {
        this.manager_privilege = manager_privilege;
    }
}
