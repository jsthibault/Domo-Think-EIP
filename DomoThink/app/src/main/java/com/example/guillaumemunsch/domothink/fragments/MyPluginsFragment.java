package com.example.guillaumemunsch.domothink.fragments;

import android.app.Fragment;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.support.v7.app.AlertDialog;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.adapter.SwitchListAdapter;
import com.example.guillaumemunsch.domothink.listeners.SwipeDismissListViewTouchListener;

/**
 * Created by guillaumemunsch on 01/03/16.
 */

public class MyPluginsFragment extends Fragment {
    ListView list = null;

    public MyPluginsFragment(){}

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        View rootView = inflater.inflate(R.layout.fragment_my_plugins, container, false);
        String[] plugins = new String[]{
                "Plugin #1",
                "Plugin #2",
                "Plugin #3",
                "Plugin #4"};
        Boolean[] states = new Boolean[]{
                true,
                true,
                false,
                false
        };
        list = (ListView)rootView.findViewById(R.id.myPluginsList);
/*        final SwitchListAdapter adapter = new SwitchListAdapter(this.getActivity(), plugins, states);
        list.setAdapter(adapter);
        list.setOnTouchListener(new SwipeDismissListViewTouchListener(
                list,
                new SwipeDismissListViewTouchListener.DismissCallbacks() {
                    @Override
                    public boolean canDismiss(int position) {
                        return true;
                    }

                    @Override
                    public void onDismiss(ListView listView, final int[] reverseSortedPositions)
                    {
                    }
                }));*/
        return rootView;
    }
}
