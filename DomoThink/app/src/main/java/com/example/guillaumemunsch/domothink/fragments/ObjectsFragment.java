package com.example.guillaumemunsch.domothink.fragments;

import android.app.Fragment;
import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.activities.ConnectedObjectsActivity;
import com.example.guillaumemunsch.domothink.activities.SearchObjectsActivity;
import com.example.guillaumemunsch.domothink.adapter.SwitchListAdapter;
import com.example.guillaumemunsch.domothink.listeners.SwipeDismissListViewTouchListener;

/**
 * Created by guillaumemunsch on 01/03/16.
 */
public class ObjectsFragment extends Fragment {
    FloatingActionButton search = null;
    ListView list = null;

    public ObjectsFragment(){}

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        View rootView = inflater.inflate(R.layout.fragment_objects, container, false);

        String[] objs = new String[]{"Television", "Lampe salon", "Lampe chambre bébé", "Radiateur"};
        Boolean[] states = new Boolean[]{true, false, false, true};
        list = (ListView)rootView.findViewById(R.id.listView);
        final SwitchListAdapter adapter = new SwitchListAdapter(this.getActivity(), objs, states);
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
                        for (int position : reverseSortedPositions) {
                            adapter.remove(position);
                        }
                        adapter.notifyDataSetChanged();
                    }
                }));
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