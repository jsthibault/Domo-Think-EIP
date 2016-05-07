package com.example.guillaumemunsch.domothink.models;

import java.io.Serializable;

/**
 * Created by guillaumemunsch on 07/05/16.
 */

@SuppressWarnings("serial")
public class Periodicity implements Serializable{
    private int type;
    private String name;
    private String data;

    public Periodicity(int type, String name, String data) {
        this.type = type;
        this.name = name;
        this.data = data;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }
}
