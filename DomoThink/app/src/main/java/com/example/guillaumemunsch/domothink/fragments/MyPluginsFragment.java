package com.example.guillaumemunsch.domothink.fragments;

import android.app.Fragment;
import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.adapter.SwitchListAdapter;
import com.example.guillaumemunsch.domothink.listeners.SwipeDismissListViewTouchListener;
import com.example.guillaumemunsch.domothink.models.Plugin;
import com.example.guillaumemunsch.domothink.utils.Utils;

import java.util.List;

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
                        Utils.confirm(context, "Removing Plugin", "Do you really want to remove this plugin ?");
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


        return rootView;
    }
}
