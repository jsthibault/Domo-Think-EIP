package com.example.guillaumemunsch.domothink.fragments;

import android.app.Fragment;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.widget.DefaultItemAnimator;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.activities.PluginDetailActivity;
import com.example.guillaumemunsch.domothink.activities.UpdateActivity;
import com.example.guillaumemunsch.domothink.adapter.StorePluginAdapter;
import com.example.guillaumemunsch.domothink.models.Device;
import com.example.guillaumemunsch.domothink.recycler.DividerItemDecoration;
import com.example.guillaumemunsch.domothink.http.RestAPI;
import com.example.guillaumemunsch.domothink.models.Plugin;
import com.example.guillaumemunsch.domothink.recycler.RecyclerItemClickListener;
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

public class StoreFragment extends Fragment {
    View rootView = null;
    private List<Plugin> pluginList = null;
    private List<Plugin> installedPluginList = null;
    private RecyclerView recyclerView;
    private StorePluginAdapter mAdapter;
    Context context = null;

    public StoreFragment(){}

    private void loadContent() {
        if (pluginList == null || installedPluginList == null) {
            return;
        }
        recyclerView.addOnItemTouchListener(
                new RecyclerItemClickListener(context, recyclerView ,new RecyclerItemClickListener.OnItemClickListener() {
                    @Override public void onItemClick(View view, int position) {
                        Intent intent = new Intent(getActivity(), PluginDetailActivity.class);
                        boolean installed = false;
                        for (int i = 0; i < installedPluginList.size(); i++) {
                            if (pluginList.get(position).getIdPlugin() == installedPluginList.get(i).getIdPlugin()) {
                                intent.putExtra("installed", true);
                                break;
                            }
                        }
                        intent.putExtra("plugin", pluginList.get(position));
                        intent.putExtra("storePlugin", pluginList.get(position));
                        startActivity(intent);

                    }

                    @Override public void onLongItemClick(View view, int position) {
                        // do whatever
                    }
                })
        );

        mAdapter = new StorePluginAdapter(pluginList);
        RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(getActivity().getApplicationContext());
        recyclerView.setLayoutManager(mLayoutManager);
        recyclerView.setItemAnimator(new DefaultItemAnimator());
        recyclerView.addItemDecoration(new DividerItemDecoration(getActivity(), LinearLayoutManager.VERTICAL));
        recyclerView.setAdapter(mAdapter);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        context = getActivity();
        rootView = inflater.inflate(R.layout.fragment_store, container, false);
        recyclerView = (RecyclerView)rootView.findViewById(R.id.storePluginList);
        final LinearLayoutManager layoutManager = new LinearLayoutManager(context);
        layoutManager.setOrientation(LinearLayoutManager.VERTICAL);
        recyclerView.setLayoutManager(layoutManager);

        RestAPI.getStore("/store", null, new JsonHttpResponseHandler() {
            @Override
            public void onSuccess(int statusCode, Header[] headers, JSONArray response) {
                try {
                    pluginList = new Gson().fromJson(response.toString(), new TypeToken<List<Plugin>>() {}.getType());
                    mAdapter.notifyDataSetChanged();
                } catch (Throwable ex) {

                    Log.d("Store Fragment", ex.getMessage());
                }
            }

            @Override
            public void onFailure(int statusCode, Header[] headers, String responseString, Throwable throwable) {
                Toast.makeText(context, R.string.request_failed, Toast.LENGTH_LONG).show();
                Log.d("Store Fragment: ", "Unable to get store.");
            }
        });
        RestAPI.get("/plugins", null, new JsonHttpResponseHandler() {
            @Override
            public void onSuccess(int statusCode, Header[] headers, JSONArray response) {
                try {
                    installedPluginList = new Gson().fromJson(response.toString(), new TypeToken<List<Plugin>>() {
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
        return rootView;
    }

    @Override
    public void onResume() {
        super.onResume();
        RestAPI.getStore("/store", null, new JsonHttpResponseHandler() {
            @Override
            public void onSuccess(int statusCode, Header[] headers, JSONArray response) {
                try {
                    pluginList = new Gson().fromJson(response.toString(), new TypeToken<List<Plugin>>() {}.getType());
                    mAdapter.notifyDataSetChanged();
                } catch (Throwable ex) {

                    Log.d("Store Fragment", ex.getMessage());
                }
            }

            @Override
            public void onFailure(int statusCode, Header[] headers, String responseString, Throwable throwable) {
                Toast.makeText(context, R.string.request_failed, Toast.LENGTH_LONG).show();
                Log.d("Store Fragment: ", "Unable to get store.");
            }
        });
        RestAPI.get("/plugins", null, new JsonHttpResponseHandler() {
            @Override
            public void onSuccess(int statusCode, Header[] headers, JSONArray response) {
                try {
                    installedPluginList = new Gson().fromJson(response.toString(), new TypeToken<List<Plugin>>() {
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
    }}
