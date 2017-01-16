package com.example.guillaumemunsch.domothink.models;

import java.io.Serializable;

/**
 * Created by guillaumemunsch on 07/05/16.
 */

@SuppressWarnings("serial")

public class Directive implements Serializable {
    private int idDirective;
    private String name;
    private int creatorId;
    private int deviceId;
    private int actionId;
    private int periodicityType;
    private String periodicityData;

    public Directive(){};

    public Directive(int idDirective, String name, int creatorId, int deviceId, int actionId, int periodicityType, String periodicityData) {
        this.idDirective = idDirective;
        this.name = name;
        this.creatorId = creatorId;
        this.deviceId = deviceId;
        this.actionId = actionId;
        this.periodicityType = periodicityType;
        this.periodicityData = periodicityData;
    }

    public int getIdDirective() {
        return idDirective;
    }

    public void setIdDirective(int idDirective) {
        this.idDirective = idDirective;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCreatorId() {
        return creatorId;
    }

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

    public int getPeriodicityType() {
        return periodicityType;
    }

    public void setPeriodicityType(int periodicityType) {
        this.periodicityType = periodicityType;
    }

    public String getPeriodicityData() {
        return periodicityData;
    }

    public void setPeriodicityData(String periodicityData) {
        this.periodicityData = periodicityData;
    }
}
