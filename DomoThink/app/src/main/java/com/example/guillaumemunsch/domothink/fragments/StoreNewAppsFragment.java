package com.example.guillaumemunsch.domothink.fragments;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.adapter.PluginAdapter;
import com.example.guillaumemunsch.domothink.models.Plugin;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by guillaumemunsch on 16/12/15.
 */
public class StoreNewAppsFragment extends BaseFragment {
    ListView list = null;
    Fragment fragment;
    List<Plugin> mPlugins;

    public StoreNewAppsFragment() {
        fragment = this;
        // Required empty public constructor
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Log.d("SUUUUUUUUUUUUUUUUU", "SUUUUUUUUUUUUUUUUU");
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        Log.d("NOOOOOOOOOOOOOOOOO", "NOOOOOOOOOOOOOOOOO");

        // Inflate the layout for this fragment
        View view = inflater.inflate(R.layout.new_apps_fragment, container, false);
        mPlugins = new ArrayList<Plugin>();
        mPlugins.add(new Plugin(R.drawable.mario, "Plugin 1", "Un excellent plugin !", 5f));
        mPlugins.add(new Plugin(R.drawable.mario, "Plugin 2", "Un plugin génial !", 4.8f));
        mPlugins.add(new Plugin(R.drawable.mario, "Plugin 3", "Un super plugin !", 4.5f));
        mPlugins.add(new Plugin(R.drawable.mario, "Plugin 4", "Un très bon plugin !", 2.3f));

        list = (ListView)view.findViewById(R.id.fragmentPluginList);

        list.setAdapter(new PluginAdapter(fragment.getActivity(), mPlugins));

        return view;
    }

    @Override
    public ListView getListView(){
        Log.d("YEEEEEEEEEEEEEEEEEEES", "YEEEEEEEEEEEEEEEEEEES");
        return list;
    }
}