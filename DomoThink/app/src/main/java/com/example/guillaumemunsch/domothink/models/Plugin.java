package com.example.guillaumemunsch.domothink.models;

import android.os.Parcel;
import android.os.Parcelable;

import java.io.Serializable;
import java.util.List;

/**
 * Created by guillaumemunsch on 21/12/15.
 */

@SuppressWarnings("serial")
public class Plugin implements Serializable {
    private int idPlugin;
    private int icon;
    private String name;
    private String description;
    private String repository;
    private float rate;
    private boolean status;

    public int getIdPlugin() {
        return idPlugin;
    }

    public void setIdPlugin(int idPlugin) {
        this.idPlugin = idPlugin;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRepository() {
        return repository;
    }

    public void setRepository(String repository) {
        this.repository = repository;
    }

    public float getRate() {
        return rate;
    }

    public void setRate(float rate) {
        this.rate = rate;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getIcon() {
        return icon;
    }

    public void setIcon(int icon) {
        this.icon = icon;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Plugin(int idPlugin, String name, String repository, float rate, boolean status) {
        this.idPlugin = idPlugin;
        this.name = name;
        this.repository = repository;
        this.rate = rate;
        this.status = status;
    }
}