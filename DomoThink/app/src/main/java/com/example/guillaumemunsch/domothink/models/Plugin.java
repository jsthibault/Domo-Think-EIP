package com.example.guillaumemunsch.domothink.models;

import android.os.Parcel;
import android.os.Parcelable;

import java.io.Serializable;

/**
 * Created by guillaumemunsch on 21/12/15.
 */

@SuppressWarnings("serial")
public class Plugin implements Serializable {
    private int id;
    private int icon;
    private String name;
    private String description;
    private float rate;
    private boolean activate;

    public int getId() { return id; }

    public void setId(int id) { this.id = id; }

    public boolean isActivate() { return activate; }

    public void setActivate(boolean activate) { this.activate = activate; }

    public int getIcon() {
        return icon;
    }

    public void setIcon(int icon) {
        this.icon = icon;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getRate() {
        return rate;
    }

    public void setRate(float rate) {
        this.rate = rate;
    }

    public Plugin(int id, int icon, String name, String description, float rate) {

        this.id = id;
        this.icon = icon;
        this.name = name;
        this.description = description;
        this.rate = rate;
    }
}