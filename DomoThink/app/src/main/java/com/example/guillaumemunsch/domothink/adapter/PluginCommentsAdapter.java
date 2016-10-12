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
import android.widget.TextView;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.activities.MainActivity;
import com.example.guillaumemunsch.domothink.activities.PluginDetailActivity;

/**
 * Created by guillaumemunsch on 04/12/15.
 */

/*
public class PluginCommentsAdapter extends BaseAdapter {
    int [] icons;
    String [] names;
    String [] comments;
    float [] rates;
    Context context;
    private static LayoutInflater inflater=null;
    public PluginCommentsAdapter(AppCompatActivity mainActivity, int[] mIcons, String[] mNames, String[] mComments, float[] mRates) {
        // TODO Auto-generated constructor stub
        context=mainActivity;
        icons = mIcons;
        names = mNames;
        comments = mComments;
        rates = mRates;
        inflater = ( LayoutInflater )context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
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
        TextView c;
        RatingBar r;
    }
    @Override
    public View getView(final int position, View convertView, ViewGroup parent) {
        // TODO Auto-generated method stub
        Holder holder=new Holder();
        View rowView;

        rowView = inflater.inflate(R.layout.list_item_plugin_comments, null);
//        holder.i=(ImageView) rowView.findViewById(R.id.userIcon);
        holder.n=(TextView) rowView.findViewById(R.id.userName);
        holder.c=(TextView) rowView.findViewById(R.id.userComment);
        holder.r=(RatingBar) rowView.findViewById(R.id.userRate);

//        holder.i.setImageResource(icons[position]);
        holder.n.setText(names[position]);
        holder.c.setText(comments[position]);
        holder.r.setRating(rates[position]);

        return rowView;
    }
}
*/