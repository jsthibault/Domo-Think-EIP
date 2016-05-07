package com.example.guillaumemunsch.domothink.models;

import java.io.Serializable;

/**
 * Created by guillaumemunsch on 07/05/16.
 */

@SuppressWarnings("serial")

public class Directive implements Serializable {
    private int id;
    private String name;
    private String description;
    private Periodicity periodicity;

    public Directive(int id, String name, String description, Periodicity periodicity) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.periodicity = periodicity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
