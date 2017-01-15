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
import com.example.guillaumemunsch.domothink.activities.InfosObject;
import com.example.guillaumemunsch.domothink.activities.MainActivity;
import com.example.guillaumemunsch.domothink.activities.SearchObjectsActivity;
import com.example.guillaumemunsch.domothink.adapter.SwitchListAdapter;
import com.example.guillaumemunsch.domothink.http.RestAPI;
import com.example.guillaumemunsch.domothink.listeners.SwipeDismissListViewTouchListener;
import com.example.guillaumemunsch.domothink.models.Device;
import com.example.guillaumemunsch.domothink.utils.Utils;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.loopj.android.http.JsonHttpResponseHandler;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

import cz.msebera.android.httpclient.Header;

/**
 * Created by guillaumemunsch on 01/03/16.
 */
public class ObjectsFragment extends Fragment {
    Context context = null;
    View rootView = null;
    boolean listLoaded = false;
    FloatingActionButton search = null;
    ListView list = null;
    List<Device> devices = null;
    int pos;

    public ObjectsFragment(){}

    public void setList(List<Device> list) {
        devices = list;
        listLoaded = true;
    }

    public void loadContent(){
        if (devices.size() == 0)
            Toast.makeText(context, R.string.no_directive_found, Toast.LENGTH_LONG).show();
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
                        for (final int position : reverseSortedPositions) {
                            RestAPI.delete("/devices/" + devices.get(position).getId(), null, new JsonHttpResponseHandler() {
                                @Override
                                public void onSuccess(int statusCode, Header[] headers, JSONObject response) {
                                    Log.d("Success:", "Deleting device");
                                    adapter.remove(position);
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
        list.setOnItemClickListener(new AdapterView.OnItemClickListener() {

            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Intent intent = new Intent(getActivity(), InfosObject.class);
                intent.putExtra("device", devices.get(position));
                startActivity(intent);
            }
        });
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        context = this.getActivity();
        rootView = inflater.inflate(R.layout.fragment_objects, container, false);
        RestAPI.get("/devices", null, new JsonHttpResponseHandler() {
            @Override
            public void onSuccess(int statusCode, Header[] headers, JSONArray response) {
                try {
                    devices = new Gson().fromJson(response.toString(), new TypeToken<List<Device>>() {
                    }.getType());
                    loadContent();
                } catch (Throwable ex) {
                    Log.d("Devices Fragment", "Unable to find devices.");
                }
            }

            @Override
            public void onFailure(int statusCode, Header[] headers, Throwable throwable, JSONObject errorResponse) {
                Log.d("Fail", errorResponse.toString());
            }

            @Override
            public void onFailure(int statusCode, Header[] headers, String responseString, Throwable throwable) {
                Log.d("Error", responseString);
            }
        });
        search = (FloatingActionButton)rootView.findViewById(R.id.searchObjectsButton);
        search.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(getActivity(), SearchObjectsActivity.class));
            }
        });
        return rootView;
    }

    @Override
    public void onResume() {
        super.onResume();
        RestAPI.get("/devices", null, new JsonHttpResponseHandler() {
            @Override
            public void onSuccess(int statusCode, Header[] headers, JSONArray response) {
                try {
                    devices = new Gson().fromJson(response.toString(), new TypeToken<List<Device>>() {
                    }.getType());
                    loadContent();
                } catch (Throwable ex) {
                    Log.d("Devices Fragment", "Unable to find devices.");
                }
            }

            @Override
            public void onFailure(int statusCode, Header[] headers, Throwable throwable, JSONObject errorResponse) {
                Log.d("Fail", errorResponse.toString());
            }

            @Override
            public void onFailure(int statusCode, Header[] headers, String responseString, Throwable throwable) {
                Log.d("Error", responseString);
            }
        });
        search = (FloatingActionButton)rootView.findViewById(R.id.searchObjectsButton);
        search.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(getActivity(), SearchObjectsActivity.class));
            }
        });
    }
}