package com.example.guillaumemunsch.domothink.models;

import java.io.Serializable;

/**
 * Created by guillaumemunsch on 07/05/16.
 */

@SuppressWarnings("serial")
public class Device implements Serializable {
    private int idDevice;
    private String name;
    private String description;
    private String protocole;
    private boolean activate = false;
    private boolean added;

    public boolean getAdded() { return added; }

    public void setAdded(boolean added) { this.added = added; }

    public int getId() { return idDevice; }

    public void setId(int id) { this.idDevice = id; }

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

    public String getProtocole() {
        return protocole;
    }

    public void setProtocole(String protocole) {
        this.protocole = protocole;
    }

    public boolean isActivate() {
        return activate;
    }

    public void setActivate(boolean activate) {
        this.activate = activate;
    }

    public Device(int id, String name, String description, boolean activate, boolean added) {

        this.idDevice = id;
        this.name = name;
        this.description = description;
        this.protocole = protocole;
        this.activate = activate;
        this.added = added;
    }
}
