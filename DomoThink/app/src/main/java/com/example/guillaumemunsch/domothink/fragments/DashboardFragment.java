package com.example.guillaumemunsch.domothink.fragments;

import android.app.Fragment;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.Switch;
import android.widget.Toast;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.activities.InfosObject;
import com.example.guillaumemunsch.domothink.activities.SearchObjectsActivity;
import com.example.guillaumemunsch.domothink.adapter.SwitchListAdapter;
import com.example.guillaumemunsch.domothink.http.RestAPI;
import com.example.guillaumemunsch.domothink.listeners.SwipeDismissListViewTouchListener;
import com.example.guillaumemunsch.domothink.models.Device;
import com.example.guillaumemunsch.domothink.models.DomoNetwork;
import com.example.guillaumemunsch.domothink.utils.Utils;
import com.github.mikephil.charting.charts.LineChart;
import com.github.mikephil.charting.components.LimitLine;
import com.github.mikephil.charting.components.XAxis;
import com.github.mikephil.charting.components.YAxis;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.data.LineData;
import com.github.mikephil.charting.data.LineDataSet;
import com.github.mikephil.charting.interfaces.datasets.ILineDataSet;
import com.github.mikephil.charting.utils.ColorTemplate;
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

public class DashboardFragment extends Fragment {
    Context context = null;
    View rootView = null;
    boolean listLoaded = false;
    ListView list = null;
    DomoNetwork networks = null;
    Switch  zwave, simulator;
    public DashboardFragment(){}

    public void loadContent(){
        zwave.setChecked(networks.isZwave());
        simulator.setChecked(networks.isSimulator());
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        context = getActivity();
        rootView = inflater.inflate(R.layout.fragment_dashboard, container, false);
        zwave = (Switch)rootView.findViewById(R.id.zwave);
        simulator = (Switch)rootView.findViewById(R.id.simulator);
        RestAPI.get("/box/status", null, new JsonHttpResponseHandler() {
            @Override
            public void onSuccess(int statusCode, Header[] headers, JSONObject response) {
                try {
                    networks = new Gson().fromJson(response.toString(), new TypeToken<DomoNetwork>() {}.getType());
                    loadContent();
                } catch (Throwable ex) {
                    Log.d("Network", "Unable to get networks.");
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

    public void onResume() {
        super.onResume();
        RestAPI.get("/box/status", null, new JsonHttpResponseHandler() {
            @Override
            public void onSuccess(int statusCode, Header[] headers, JSONObject response) {
                try {
                    networks = new Gson().fromJson(response.toString(), new TypeToken<DomoNetwork>() {}.getType());
                    loadContent();
                } catch (Throwable ex) {
                    Log.d("Network", "Unable to get networks.");
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
    }
}
