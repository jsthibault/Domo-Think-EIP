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

/**
 * Created by guillaumemunsch on 03/12/15.
 */
public class CheckboxListAdapter extends BaseAdapter {
    String [] objs;
    Context context;
    boolean [] states;
    private static LayoutInflater inflater=null;
    public CheckboxListAdapter(SearchObjectsActivity mainActivity, String[] mObjs, boolean[] mStates) {
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
        holder.tv.setText(objs[position]);
        holder.ch.setChecked(states[position]);
        rowView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // TODO Auto-generated method stub
                Toast.makeText(context, "You Clicked " + objs[position], Toast.LENGTH_LONG).show();
                holder.ch.setChecked(!holder.ch.isChecked());
            }
        });
        return rowView;
    }
}
