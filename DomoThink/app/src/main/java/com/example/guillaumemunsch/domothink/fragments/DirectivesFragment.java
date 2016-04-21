package com.example.guillaumemunsch.domothink.fragments;


import android.app.Fragment;
import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.activities.CreateDirectiveActivity;
import com.example.guillaumemunsch.domothink.activities.DirectivesActivity;
import com.example.guillaumemunsch.domothink.adapter.EditAdapter;
import com.example.guillaumemunsch.domothink.http.GetDevices;
import com.example.guillaumemunsch.domothink.http.GetDirectives;
import com.example.guillaumemunsch.domothink.listeners.SwipeDismissListViewTouchListener;
import com.example.guillaumemunsch.domothink.utils.Utils;

import java.util.List;

import io.swagger.client.model.Directive;

/**
 * Created by guillaumemunsch on 01/03/16.
 */
public class DirectivesFragment extends Fragment {
    FloatingActionButton add = null;
    List<Directive> directives = null;
    ListView mList = null;

    public DirectivesFragment(){}

    public void setList(List<Directive> list) {
        this.directives = list;
        Log.d("ELEENT 1", list.get(1).getName());
    }

    public void loadContent() {
        final EditAdapter adapter = new EditAdapter(this.getActivity(),
                (List<String>)(Object)Utils.transform(directives, "name"));
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
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        View rootView = inflater.inflate(R.layout.fragment_directives, container, false);
        try { new GetDirectives(this).execute(); }
        catch (Exception ex) { Log.d("Error: ", ex.getMessage()); }

        mList = (ListView)rootView.findViewById(R.id.directivesList);
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