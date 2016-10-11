package com.example.guillaumemunsch.domothink.adapter;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.RatingBar;
import android.widget.TextView;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.activities.PluginDetailActivity;

import java.util.List;

import com.example.guillaumemunsch.domothink.models.Plugin;

/**
 * Created by guillaumemunsch on 03/12/15.
 */
public class PluginAdapter extends BaseAdapter {
    List<Plugin> mPlugins = null;
    Context context;

    private static LayoutInflater inflater=null;
    public PluginAdapter(Activity mainActivity, List<Plugin> plugins) {
        context = mainActivity;
        mPlugins = plugins;
        inflater = ( LayoutInflater )context.
                getSystemService(Context.LAYOUT_INFLATER_SERVICE);
    }

    public void update(List<Plugin> plugins){
        mPlugins = plugins;
        notifyDataSetChanged();
    }

    @Override
    public int getCount() {
        // TODO Auto-generated method stub
        return mPlugins.size();
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
//        holder.i.setImageResource((mPlugins.get(position)).getIcon());
        holder.n.setText((mPlugins.get(position)).getName());
//        holder.d.setText((mPlugins.get(position)).getDescription());
        holder.r.setRating((mPlugins.get(position)).getRate());
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
