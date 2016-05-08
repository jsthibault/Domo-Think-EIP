package com.example.guillaumemunsch.domothink.fragments;


import android.app.Fragment;
import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ListView;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.activities.CreateUpdateDirectiveActivity;
import com.example.guillaumemunsch.domothink.adapter.EditAdapter;
import com.example.guillaumemunsch.domothink.http.RestAPI;
import com.example.guillaumemunsch.domothink.listeners.SwipeDismissListViewTouchListener;
import com.example.guillaumemunsch.domothink.models.Device;
import com.example.guillaumemunsch.domothink.models.Directive;
import com.example.guillaumemunsch.domothink.utils.Utils;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.loopj.android.http.JsonHttpResponseHandler;

import org.json.JSONArray;

import java.util.List;

import cz.msebera.android.httpclient.Header;


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
                        Utils.confirm(getActivity(), "Deleting Directive", "Do you really want to delete this directive ?");
                        for (int position : reverseSortedPositions) {
                            adapter.remove(position);
                        }
                        adapter.notifyDataSetChanged();
                    }
                }));
        mList.setOnItemClickListener(new AdapterView.OnItemClickListener() {

            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {

                Intent intent = new Intent(getActivity(), CreateUpdateDirectiveActivity.class);
                intent.putExtra("editedDirective", directives.get(position));
                startActivity(intent);
            }
        });
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        View rootView = inflater.inflate(R.layout.fragment_directives, container, false);

        RestAPI.get("/directive", null, new JsonHttpResponseHandler() {
            @Override
            public void onSuccess(int statusCode, Header[] headers, JSONArray response) {
                try {
                    directives = new Gson().fromJson(response.toString(), new TypeToken<List<Directive>>() {
                    }.getType());
                    loadContent();
                } catch (Throwable ex) {
                    Log.d("Directive Fragment", "Unable to find directives.");
                }
            }
        });

        mList = (ListView)rootView.findViewById(R.id.directivesList);
        add = (FloatingActionButton)rootView.findViewById(R.id.addDirectiveButton);
        add.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(getActivity(), CreateUpdateDirectiveActivity.class));
            }
        });

        return rootView;
    }
}