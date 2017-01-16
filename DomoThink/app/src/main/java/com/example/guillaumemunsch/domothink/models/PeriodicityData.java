package com.example.guillaumemunsch.domothink.models;

import java.io.Serializable;

/**
 * Created by guillaumemunsch on 15/01/2017.
 */

public class PeriodicityData implements Serializable {
    private int day = 0;
    private String hour = "00:00";

    public PeriodicityData() {}

    public PeriodicityData(int day, String hour) {
        this.day = day;
        this.hour = hour;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    public String getHour() {
        return hour;
    }

    public void setHour(String hour) {
        this.hour = hour;
    }
}
