package com.example.guillaumemunsch.domothink.models;

import java.io.Serializable;

/**
 * Created by guillaumemunsch on 07/05/16.
 */

@SuppressWarnings("serial")
public class Device implements Serializable {
    private int id;
    private String name;
    private String description;
    private boolean activate;
    private boolean added;

    public boolean getAdded() { return added; }

    public void setAdded(boolean added) { this.added = added; }

    public int getId() { return id; }

    public void setId(int id) { this.id = id; }

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

    public boolean isActivate() {
        return activate;
    }

    public void setActivate(boolean activate) {
        this.activate = activate;
    }

    public Device(int id, String name, String description, boolean activate, boolean added) {

        this.id = id;
        this.name = name;
        this.description = description;
        this.activate = activate;
        this.added = added;
    }
}
