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
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.Toast;

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
import org.json.JSONObject;

import java.util.List;

import cz.msebera.android.httpclient.Header;


/**
 * Created by guillaumemunsch on 01/03/16.
 */
public class DirectivesFragment extends Fragment {
    FloatingActionButton add = null;
    List<Directive> directives = null;
    ListView mList = null;
    Context context = null;
    int pos;

    public DirectivesFragment(){}

    public void setList(List<Directive> list) {
        this.directives = list;
    }

    public void loadContent() {
        if (directives.size() == 0)
            Toast.makeText(context, R.string.no_directive_found, Toast.LENGTH_LONG).show();
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
                            pos = position;
                            RestAPI.delete("/directives/" + directives.get(position).getIdDirective(), null, new JsonHttpResponseHandler() {
                                @Override
                                public void onSuccess(int statusCode, Header[] headers, JSONObject response) {
                                    Log.d("Success:", "Deleting directive");
                                    adapter.remove(pos);
                                    adapter.notifyDataSetChanged();
                                    if (adapter.getCount() == 0)
                                        Toast.makeText(context, R.string.no_directive_found, Toast.LENGTH_LONG).show();
                                }

                                @Override
                                public void onFailure(int statusCode, Header[] headers, String responseString, Throwable throwable) {
                                    Log.d("Error:", "Deleting device");
                                }
                            });
                        }
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
        context = getActivity();
        View rootView = inflater.inflate(R.layout.fragment_directives, container, false);

        RestAPI.get("/directives", null, new JsonHttpResponseHandler() {
            @Override
            public void onSuccess(int statusCode, Header[] headers, JSONArray response) {
                try {
                    directives = new Gson().fromJson(response.toString(), new TypeToken<List<Directive>>() {
                    }.getType());
                    if (directives.size() == 0) {
                        Toast.makeText(context, R.string.no_directive_found, Toast.LENGTH_LONG).show();
                    }
                    loadContent();
                } catch (Throwable ex) {
                    Log.d("Directive Fragment", "Unable to find directives.");
                }
            }

            @Override
            public void onFailure(int statusCode, Header[] headers, String responseString, Throwable throwable) {
                Toast.makeText(context, R.string.request_failed, Toast.LENGTH_LONG).show();
                Log.d("Directive Fragment: ", "Unable to get directives.");
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

    @Override
    public void onResume() {
        super.onResume();
        RestAPI.get("/directives", null, new JsonHttpResponseHandler() {
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

            @Override
            public void onFailure(int statusCode, Header[] headers, String responseString, Throwable throwable) {
                Toast.makeText(context, R.string.request_failed, Toast.LENGTH_LONG).show();
                Log.d("Directive Fragment: ", "Unable to get directives.");
            }
        });
    }
}