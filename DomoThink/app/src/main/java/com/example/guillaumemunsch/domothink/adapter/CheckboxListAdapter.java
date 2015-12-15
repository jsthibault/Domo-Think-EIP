package com.example.guillaumemunsch.domothink.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.CheckBox;
import android.widget.TextView;
import android.widget.Toast;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.activities.SearchObjectsActivity;

import java.util.ArrayList;
import java.util.Arrays;

/**
 * Created by guillaumemunsch on 03/12/15.
 */
public class CheckboxListAdapter extends BaseAdapter {
    Context context;
    ArrayList<String> objs = null;
    ArrayList<Boolean> states = null;
    private static LayoutInflater inflater=null;
    public CheckboxListAdapter(SearchObjectsActivity mainActivity, String[] mObjs, Boolean[] mStates) {
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
        CheckBox ch;
    }
    @Override
    public View getView(final int position, View convertView, ViewGroup parent) {
        // TODO Auto-generated method stub
        final Holder holder=new Holder();
        View rowView;
        rowView = inflater.inflate(R.layout.list_item_checkbox, null);
        holder.tv=(TextView) rowView.findViewById(R.id.checkboxObjectName);
        holder.ch=(CheckBox) rowView.findViewById(R.id.checkboxId);
        holder.tv.setText(objs.get(position));
        holder.ch.setChecked(states.get(position));
        return rowView;
    }

    public void remove(int position){
        objs.remove(position);
        states.remove(position);
    }
}
