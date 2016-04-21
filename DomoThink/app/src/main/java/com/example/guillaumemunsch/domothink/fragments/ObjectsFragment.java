package com.example.guillaumemunsch.domothink.fragments;

import android.app.Fragment;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.activities.ConnectedObjectsActivity;
import com.example.guillaumemunsch.domothink.activities.SearchObjectsActivity;
import com.example.guillaumemunsch.domothink.adapter.SwitchListAdapter;
import com.example.guillaumemunsch.domothink.http.GetDevices;
import com.example.guillaumemunsch.domothink.listeners.SwipeDismissListViewTouchListener;
import com.example.guillaumemunsch.domothink.utils.Utils;

import java.util.List;

import io.swagger.client.model.Device;

/**
 * Created by guillaumemunsch on 01/03/16.
 */
public class ObjectsFragment extends Fragment {
    Context context = null;
    View rootView = null;
    boolean listLoaded = false;
    FloatingActionButton search = null;
    ListView list = null;
    List<Device> devices;

    public ObjectsFragment(){}

    public void setList(List<Device> list) {
        devices = list;
        listLoaded = true;
    }

    public void loadContent(){
        List<String> names = Utils.transform(devices, "name");
        list = (ListView)rootView.findViewById(R.id.listView);
        final SwitchListAdapter adapter = new SwitchListAdapter(this.getActivity(),
                (List<String>)(Object)Utils.transform(devices, "name"),
                (List<Boolean>)(Object)Utils.transform(devices, "activate"));
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
        rootView = inflater.inflate(R.layout.fragment_objects, container, false);

        try { new GetDevices(this).execute(); }
        catch (Exception ex) { Log.d("Error: ", ex.getMessage()); }

        search = (FloatingActionButton)rootView.findViewById(R.id.searchObjectsButton);
        search.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(getActivity(), SearchObjectsActivity.class));
            }
        });
        return rootView;
    }
}