package com.example.guillaumemunsch.domothink.fragments;

import android.app.Fragment;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.Toast;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.activities.CreateUpdateDirectiveActivity;
import com.example.guillaumemunsch.domothink.adapter.SwitchListAdapter;
import com.example.guillaumemunsch.domothink.http.RestAPI;
import com.example.guillaumemunsch.domothink.listeners.SwipeDismissListViewTouchListener;
import com.example.guillaumemunsch.domothink.models.Device;
import com.example.guillaumemunsch.domothink.models.Plugin;
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
                (List<Boolean>)(Object)Utils.transform(pluginList, "status"),
                (List<Integer>)(Object)Utils.transform(pluginList, "idPlugin"),
                "plugins"
                );
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
                            RestAPI.delete("/plugins/uninstall/" + pluginList.get(position).getIdPlugin(), null, new JsonHttpResponseHandler() {
                                @Override
                                public void onSuccess(int statusCode, Header[] headers, JSONObject response) {
                                    Log.d("Success:", "removing plugin");
                                    adapter.remove(position);
                                    adapter.notifyDataSetChanged();
                                    if (adapter.getCount() == 0)
                                        Toast.makeText(context, "No plugin installed", Toast.LENGTH_LONG).show();
                                }

                                @Override
                                public void onFailure(int statusCode, Header[] headers, String responseString, Throwable throwable) {
                                    Log.d("Error:", "Removing plugin");
                                }

                                @Override
                                public void onFailure(int statusCode, Header[] headers, Throwable throwable, JSONObject errorResponse) {
                                    Toast.makeText(context, "Plugin not found in DB", Toast.LENGTH_LONG).show();
                                }
                            });
                        }
                        adapter.notifyDataSetChanged();
                    }
                }));
        list.setOnItemClickListener(new AdapterView.OnItemClickListener() {

            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {

            }
        });

    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        context = this.getActivity();
        rootView = inflater.inflate(R.layout.fragment_my_plugins, container, false);

        RestAPI.get("plugins", null, new JsonHttpResponseHandler() {
            @Override
            public void onSuccess(int statusCode, Header[] headers, JSONArray response) {
                try {
                    pluginList = new Gson().fromJson(response.toString(), new TypeToken<List<Plugin>>() {
                    }.getType());
                    if (pluginList.size() == 0) {
                        Toast.makeText(context, "No plugin installed", Toast.LENGTH_LONG).show();
                    }
                    loadContent();
                } catch (Throwable ex) {
                    Log.d("Plugin Fragment", "Unable to find plugin.");
                }
            }

            @Override
            public void onFailure(int statusCode, Header[] headers, String responseString, Throwable throwable) {
                Log.d("Response: ", responseString);
            }
        });

        return rootView;
    }
}