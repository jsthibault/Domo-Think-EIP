package com.example.guillaumemunsch.domothink.adapter;

import android.content.Context;
import android.support.v7.app.AppCompatActivity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.activities.ConnectedObjectsActivity;

import java.util.ArrayList;
import java.util.Arrays;

/**
 * Created by guillaumemunsch on 03/12/15.
 */
public class SwitchListAdapter extends BaseAdapter {
    ArrayList<String> objs;
    ArrayList<Boolean> states;
    Context context;
    private static LayoutInflater inflater=null;
    public SwitchListAdapter(AppCompatActivity mainActivity, String[] mObjs, Boolean[] mStates) {
        objs = new ArrayList<String>(Arrays.asList(mObjs));
        context = mainActivity;
        states = new ArrayList<Boolean>(Arrays.asList(mStates));
        inflater = ( LayoutInflater )context.
                getSystemService(Context.LAYOUT_INFLATER_SERVICE);
    }
    @Override
    public int getCount() {
        // TODO Auto-generated method stub
        return objs.size();
    }

    @Override
    public String getItem(int position) {
        // TODO Auto-generated method stub
        return objs.get(position);
    }

    @Override
    public long getItemId(int position) {
        // TODO Auto-generated method stub
        return position;
    }

    public class Holder
    {
        TextView tv;
        Switch sw;
    }
    @Override
    public View getView(final int position, View convertView, ViewGroup parent) {
        // TODO Auto-generated method stub
        final Holder holder=new Holder();
        View rowView;
        rowView = inflater.inflate(R.layout.list_item_switch, null);
        holder.tv=(TextView) rowView.findViewById(R.id.switchObjectName);
        holder.sw=(Switch) rowView.findViewById(R.id.switchId);
        holder.tv.setText(objs.get(position));
        holder.sw.setChecked(states.get(position));
        return rowView;
    }

    public void remove(int position){
        objs.remove(position);
        states.remove(position);
    }

}
