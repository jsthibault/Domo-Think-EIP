package com.example.guillaumemunsch.domothink.models;

import android.os.Parcel;
import android.os.Parcelable;

/**
 * Created by guillaumemunsch on 21/12/15.
 */
public class Plugin implements Parcelable {
    private int mIcon;
    private String mName;
    private String mDescription;
    private float mRate;

    public Plugin(int icon, String name, String description, float rate){
        mIcon = icon;
        mName = name;
        mDescription = description;
        mRate = rate;
    }

    public int getmIcon() {
        return mIcon;
    }

    public void setmIcon(int mIcon) {
        this.mIcon = mIcon;
    }

    public String getmName() {
        return mName;
    }

    public void setmName(String mName) {
        this.mName = mName;
    }

    public String getmDescription() {
        return mDescription;
    }

    public void setmDescription(String mDescription) {
        this.mDescription = mDescription;
    }

    public float getmRate() {
        return mRate;
    }

    public void setmRate(float mRate) {
        this.mRate = mRate;
    }

    protected Plugin(Parcel in) {
        mIcon = in.readInt();
        mName = in.readString();
        mDescription = in.readString();
        mRate = in.readFloat();
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeInt(mIcon);
        dest.writeString(mName);
        dest.writeString(mDescription);
        dest.writeFloat(mRate);
    }

    @SuppressWarnings("unused")
    public static final Parcelable.Creator<Plugin> CREATOR = new Parcelable.Creator<Plugin>() {
        @Override
        public Plugin createFromParcel(Parcel in) {
            return new Plugin(in);
        }

        @Override
        public Plugin[] newArray(int size) {
            return new Plugin[size];
        }
    };
}