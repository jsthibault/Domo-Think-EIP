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
import com.example.guillaumemunsch.domothink.activities.CreateDirectiveActivity;
import com.example.guillaumemunsch.domothink.activities.DirectivesActivity;
import com.example.guillaumemunsch.domothink.adapter.EditAdapter;
import com.example.guillaumemunsch.domothink.listeners.SwipeDismissListViewTouchListener;

/**
 * Created by guillaumemunsch on 01/03/16.
 */
public class DirectivesFragment extends Fragment {
    FloatingActionButton add = null;
    ListView mList = null;

    public DirectivesFragment(){}

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        View rootView = inflater.inflate(R.layout.fragment_directives, container, false);

        mList = (ListView)rootView.findViewById(R.id.directivesList);
        String[] objs = new String[]{
                "Directive #1",
                "Directive #2",
                "Directive #3",
                "Directive #4"};
        final EditAdapter adapter = new EditAdapter(this.getActivity(), objs);
        mList.setAdapter(adapter);
        mList.setOnTouchListener(new SwipeDismissListViewTouchListener(
                mList,
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
        add = (FloatingActionButton)rootView.findViewById(R.id.addDirectiveButton);
        add.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(getActivity(), CreateDirectiveActivity.class));
            }
        });

        return rootView;
    }
}