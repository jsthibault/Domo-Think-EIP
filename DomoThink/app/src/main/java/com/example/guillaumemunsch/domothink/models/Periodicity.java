package com.example.guillaumemunsch.domothink.models;

import android.text.format.Time;

import java.io.Serializable;

/**
 * Created by guillaumemunsch on 07/05/16.
 */

@SuppressWarnings("serial")
public class Periodicity implements Serializable{
    private int type;
    private String name;
    private int day;
    private int hour;
    private int minute;

    public Periodicity(){};

    public Periodicity(int type, String name, int day, int hour, int minute) {
        this.type = type;
        this.name = name;
        this.day = day;
        this.hour = hour;
        this.minute = minute;
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

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    public int getHour() {
        return hour;
    }

    public void setHour(int hour) {
        this.hour = hour;
    }

    public int getMinute() {
        return minute;
    }

    public void setMinute(int minute) {
        this.minute = minute;
    }
}
