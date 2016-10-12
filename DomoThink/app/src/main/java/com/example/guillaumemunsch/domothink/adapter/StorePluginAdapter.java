package com.example.guillaumemunsch.domothink.adapter;

import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.RatingBar;
import android.widget.TextView;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.models.Plugin;

import java.util.List;

/**
 * Created by guillaumemunsch on 11/10/2016.
 */

public class StorePluginAdapter extends RecyclerView.Adapter<StorePluginAdapter.MyViewHolder> {

    private List<Plugin> pluginList;

    public class MyViewHolder extends RecyclerView.ViewHolder {
        public ImageView icon;
        public TextView name, description, rateText;
        public RatingBar rate;

        public MyViewHolder(View view) {
            super(view);
            icon = (ImageView) view.findViewById(R.id.pluginIcon);
            name = (TextView) view.findViewById(R.id.pluginName);
            description = (TextView) view.findViewById(R.id.pluginDescription);
            rateText = (TextView)view.findViewById(R.id.pluginRateText);
            rate = (RatingBar) view.findViewById(R.id.pluginRate);
        }
    }

    public StorePluginAdapter(List<Plugin> moviesList) {
        this.pluginList = moviesList;
    }

    @Override
    public MyViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.list_item_plugin, parent, false);

        return new MyViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(MyViewHolder holder, int position) {
        Plugin plugin = pluginList.get(position);
        //holder.icon.setImageIcon(plugin.getIcon());
        holder.name.setText(plugin.getName());
        holder.description.setText(plugin.getRepository());
        if (plugin.getRate() == -1f) {
            holder.rateText.setText("No rate");
            holder.rate.setVisibility(View.INVISIBLE);
        }
        else
            holder.rate.setRating(plugin.getRate());
    }

    @Override
    public int getItemCount() {
        return pluginList.size();
    }
}
