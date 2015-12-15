package com.example.guillaumemunsch.domothink.adapter;

import android.content.Context;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.RatingBar;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.activities.ConnectedObjectsActivity;
import com.example.guillaumemunsch.domothink.activities.PluginDetailActivity;
import com.example.guillaumemunsch.domothink.activities.StoreActivity;

/**
 * Created by guillaumemunsch on 03/12/15.
 */
public class PluginAdapter extends BaseAdapter {
    int[] icons;
    String [] names;
    String[] descs;
    float[] rates;
    Context context;
    boolean [] states;
    private static LayoutInflater inflater=null;
    public PluginAdapter(AppCompatActivity mainActivity, int[] mIcons, String[] mNames, String[] mDescs, float[] mRates) {
        context = mainActivity;
        icons = mIcons;
        names = mNames;
        descs = mDescs;
        rates = mRates;
        inflater = ( LayoutInflater )context.
                getSystemService(Context.LAYOUT_INFLATER_SERVICE);
    }
    @Override
    public int getCount() {
        // TODO Auto-generated method stub
        return names.length;
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
        ImageView i;
        TextView n;
        TextView d;
        RatingBar r;
    }
    @Override
    public View getView(final int position, View convertView, ViewGroup parent) {
        // TODO Auto-generated method stub
        final Holder holder=new Holder();
        View rowView;
        rowView = inflater.inflate(R.layout.list_item_plugin, null);
        holder.i=(ImageView) rowView.findViewById(R.id.pluginIcon);
        holder.n=(TextView) rowView.findViewById(R.id.pluginName);
        holder.d=(TextView) rowView.findViewById(R.id.pluginDescription);
        holder.r=(RatingBar) rowView.findViewById(R.id.pluginRate);
        holder.i.setImageResource(icons[position]);
        holder.n.setText(names[position]);
        holder.d.setText(descs[position]);
        holder.r.setRating(rates[position]);
        rowView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // TODO Auto-generated method stub
                context.startActivity(new Intent(context, PluginDetailActivity.class));
            }
        });
        return rowView;
    }
}
