package com.example.guillaumemunsch.domothink.models;

import java.io.Serializable;

/**
 * Created by guillaumemunsch on 15/01/2017.
 */

public class Version implements Serializable {
    private String version = "";

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public Version(String version) {
        this.version = version;
    }
}
