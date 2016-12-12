package com.example.guillaumemunsch.domothink.models;

import java.io.Serializable;

/**
 * Created by guillaumemunsch on 07/05/16.
 */

@SuppressWarnings("serial")

public class Directive implements Serializable {
    private int idDirective;
    private String name;
    private String description;
    private int creatorId;
    private int deviceId;
    private int actionId;

    public Directive(){};

    public Directive(int id, String name, String description, int creatorId, int deviceId, int actionId, Periodicity periodicity) {
        this.idDirective = id;
        this.name = name;
        this.description = description;
        this.creatorId = creatorId;
        this.deviceId = deviceId;
        this.actionId = actionId;
        this.periodicity = periodicity;
    }

    public int getCreatorId() { return creatorId; }

    public void setCreatorId(int creatorId) {
        this.creatorId = creatorId;
    }

    public int getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(int deviceId) {
        this.deviceId = deviceId;
    }

    public int getActionId() {
        return actionId;
    }

    public void setActionId(int actionId) {
        this.actionId = actionId;
    }

    private Periodicity periodicity;

    public int getId() {
        return idDirective;
    }

    public void setId(int id) {
        this.idDirective = id;
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

    public Periodicity getPeriodicity() {
        return periodicity;
    }

    public void setPeriodicity(Periodicity periodicity) {
        this.periodicity = periodicity;
    }
}
