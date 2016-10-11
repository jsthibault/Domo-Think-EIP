package com.example.guillaumemunsch.domothink.fragments;

import android.app.Fragment;
import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.design.widget.TabLayout;
import android.support.v4.view.ViewPager;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Toast;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.activities.CreateUpdateDirectiveActivity;
import com.example.guillaumemunsch.domothink.activities.InfosObject;
import com.example.guillaumemunsch.domothink.activities.PluginDetailActivity;
import com.example.guillaumemunsch.domothink.activities.StoreActivity;
import com.example.guillaumemunsch.domothink.activities.UpdateActivity;
import com.example.guillaumemunsch.domothink.adapter.EditAdapter;
import com.example.guillaumemunsch.domothink.adapter.PluginAdapter;
import com.example.guillaumemunsch.domothink.adapter.ViewPagerAdapter;
import com.example.guillaumemunsch.domothink.http.RestAPI;
import com.example.guillaumemunsch.domothink.listeners.SwipeDismissListViewTouchListener;
import com.example.guillaumemunsch.domothink.models.Directive;
import com.example.guillaumemunsch.domothink.models.Plugin;
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
    ListView listView = null;
    private List<Plugin>    plugins;

    Context context = null;
    int pos;


    public StoreFragment(){}

    public void loadStoreContent() {
        if (plugins.size() == 0)
            Toast.makeText(context, "No plugin found", Toast.LENGTH_LONG).show();
        listView = (ListView)rootView.findViewById(R.id.storePluginList);
        final PluginAdapter adapter = new PluginAdapter(this.getActivity(),
                plugins
//                (List<String>)(Object) Utils.transform(plugins, "name")
        );
        listView.setAdapter(adapter);
        Log.d("CA LOOOOOAAAAAADDDD", "Length -> " + plugins.size());
        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {

            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {

                Log.d("Ca ne s'affiche pas", "DU TOUT");
                Intent intent = new Intent(getActivity(), UpdateActivity.class);
                intent.putExtra("plugin", plugins.get(position));
                intent.putExtra("storePlugin", plugins.get(position));
                Toast.makeText(context, "Okkkkkkkk", Toast.LENGTH_LONG).show();

                if (intent.hasExtra("storePlugin"))
                    Log.d("OMFG", "ANDROID STP !");
                else
                    Log.d("ANDROID C'EST CASSE ?", "ANDROID STP !");
                startActivity(intent);
            }
        });
        Log.d("CA FINI LE LOAD OMFG", "COUCOUCOU");

    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        context = getActivity();
        rootView = inflater.inflate(R.layout.fragment_store, container, false);
        RestAPI.getApiTest("store", null, new JsonHttpResponseHandler() {
            @Override
            public void onSuccess(int statusCode, Header[] headers, JSONArray response) {
                try {
                    plugins = new Gson().fromJson(response.toString(), new TypeToken<List<Plugin>>() {
                    }.getType());
                    loadStoreContent();
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
//        startActivity(new Intent(getActivity(), StoreActivity.class));
        return rootView;
    }

}
