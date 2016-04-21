package com.example.guillaumemunsch.domothink.fragments;

import android.app.Fragment;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.support.v7.app.AlertDialog;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.adapter.SwitchListAdapter;
import com.example.guillaumemunsch.domothink.http.GetDevices;
import com.example.guillaumemunsch.domothink.http.GetPlugins;
import com.example.guillaumemunsch.domothink.listeners.SwipeDismissListViewTouchListener;
import com.example.guillaumemunsch.domothink.utils.Utils;

import java.util.List;

import io.swagger.client.model.Plugin;

/**
 * Created by guillaumemunsch on 01/03/16.
 */

public class MyPluginsFragment extends Fragment {
    Context context = null;
    View rootView = null;
    boolean listLoaded = false;
    ListView list = null;
    List<Plugin> pluginList = null;

    public MyPluginsFragment(){}

    public void setList(List<Plugin> _list) {
        pluginList = _list;
        listLoaded = true;
    }

    public void loadContent(){
        list = (ListView)rootView.findViewById(R.id.myPluginsList);
        final SwitchListAdapter adapter = new SwitchListAdapter(this.getActivity(),
                (List<String>)(Object)Utils.transform(pluginList, "name"),
                (List<Boolean>)(Object)Utils.transform(pluginList, "activate"));
        list.setAdapter(adapter);
        list.setOnTouchListener(new SwipeDismissListViewTouchListener(
                list,
                new SwipeDismissListViewTouchListener.DismissCallbacks() {
                    @Override
                    public boolean canDismiss(int position) {
                        return true;
                    }

                    @Override
                    public void onDismiss(ListView listView, int[] reverseSortedPositions) {
                        Utils.confirm(context, "Deleting Object", "Do you really wanna delete this object ?");
                        for (int position : reverseSortedPositions) {
                            adapter.remove(position);
                        }
                        adapter.notifyDataSetChanged();
                    }
                }));
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        context = this.getActivity();
        rootView = inflater.inflate(R.layout.fragment_my_plugins, container, false);

        try { new GetPlugins(this).execute(); }
        catch (Exception ex) { Log.d("Error: ", ex.getMessage()); }

        return rootView;
    }
}
