package com.example.guillaumemunsch.domothink.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.activities.ConnectedObjectsActivity;

/**
 * Created by guillaumemunsch on 03/12/15.
 */
public class SwitchListAdapter extends BaseAdapter {
    String [] objs;
    Context context;
    boolean [] states;
    private static LayoutInflater inflater=null;
    public SwitchListAdapter(ConnectedObjectsActivity mainActivity, String[] mObjs, boolean[] mStates) {
        objs = mObjs;
        context = mainActivity;
        states = mStates;
        inflater = ( LayoutInflater )context.
                getSystemService(Context.LAYOUT_INFLATER_SERVICE);
    }
    @Override
    public int getCount() {
        // TODO Auto-generated method stub
        return objs.length;
    }

    @Override
    public Object getItem(int position) {
        // TODO Auto-generated method stub
        return position;
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
        holder.tv.setText(objs[position]);
        holder.sw.setChecked(states[position]);
        rowView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // TODO Auto-generated method stub
                Toast.makeText(context, "You Clicked " + objs[position], Toast.LENGTH_LONG).show();
                holder.sw.setChecked(!holder.sw.isChecked());
            }
        });
        return rowView;
    }
}
