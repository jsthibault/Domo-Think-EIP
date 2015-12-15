package com.example.guillaumemunsch.domothink.adapter;

import android.content.Context;
import android.support.v7.app.AppCompatActivity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.example.guillaumemunsch.domothink.R;

import java.util.ArrayList;
import java.util.Arrays;

/**
 * Created by guillaumemunsch on 03/12/15.
 */
public class EditAdapter extends BaseAdapter {
    Context context;
    ArrayList<String> objs = null;
    private static LayoutInflater inflater=null;
    public EditAdapter(AppCompatActivity mainActivity, String[] mObjs) {
        objs = new ArrayList<String>(Arrays.asList(mObjs));
        context = mainActivity;
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
        ImageView e;
    }
    @Override
    public View getView(final int position, View convertView, ViewGroup parent) {
        // TODO Auto-generated method stub
        final Holder holder=new Holder();
        View rowView;
        rowView = inflater.inflate(R.layout.list_item_edit, null);
        holder.tv = (TextView) rowView.findViewById(R.id.editDeleteObjectName);
        holder.e = (ImageView) rowView.findViewById(R.id.editElement);
        holder.tv.setText(objs.get(position));
        holder.e.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // TODO Auto-generated method stub
                Toast.makeText(context, "Edit coming soon", Toast.LENGTH_LONG).show();
            }
        });
        return rowView;
    }

    public void remove(int position){
        objs.remove(position);
    }
}
