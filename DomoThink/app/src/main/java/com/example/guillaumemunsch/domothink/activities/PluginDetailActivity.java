package com.example.guillaumemunsch.domothink.activities;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.DefaultItemAnimator;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.RatingBar;
import android.widget.TextView;
import android.widget.Toast;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.adapter.StoreCommentsAdapter;
import com.example.guillaumemunsch.domothink.http.RestAPI;
import com.example.guillaumemunsch.domothink.models.Comment;
import com.example.guillaumemunsch.domothink.models.Plugin;
import com.example.guillaumemunsch.domothink.recycler.DividerItemDecoration;
import com.example.guillaumemunsch.domothink.recycler.RecyclerItemClickListener;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.loopj.android.http.JsonHttpResponseHandler;

import org.json.JSONArray;

import java.util.ArrayList;
import java.util.List;

import cz.msebera.android.httpclient.Header;

/**
 * Created by guillaumemunsch on 04/12/15.
 */
public class PluginDetailActivity extends AppCompatActivity {
    RecyclerView recyclerView = null;
    TextView pluginName = null;
    TextView pluginDesc = null;
    RatingBar pluginRate = null;
    Plugin plugin = null;
    List<Comment> commentList = new ArrayList<>();
    Context context;
    private StoreCommentsAdapter mAdapter;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        context = this;
        setContentView(R.layout.plugin_detail_activity);

        if (getIntent().hasExtra("storePlugin"))
            plugin = (Plugin)getIntent().getSerializableExtra("storePlugin");
        else
            finish();

        int[] icons = new int[]{R.drawable.plugin_logo, R.drawable.plugin_logo, R.drawable.plugin_logo};
        String[] names = new String[]{"User 1", "User 2", "User 3"};
        String[] comments = new String[]{"This plugin works great!", "Crashed with the lamp XM1014", "I use this plugin a lot, it works well."};
        float[] rates = new float[]{5f, 2f, 3.5f};

        pluginName = (TextView)findViewById(R.id.pluginName);
        pluginName.setText(plugin.getName());
        pluginDesc = (TextView)findViewById(R.id.pluginDescription);
        pluginDesc.setText(plugin.getRepository());
        pluginRate = (RatingBar)findViewById(R.id.pluginRate);
        pluginRate.setRating(plugin.getRate());
        recyclerView = (RecyclerView) findViewById(R.id.commentsRecyclerList);
        recyclerView.addOnItemTouchListener(
                new RecyclerItemClickListener(context, recyclerView ,new RecyclerItemClickListener.OnItemClickListener() {
                    @Override public void onItemClick(View view, int position) {
                        Toast.makeText(context, "Click", Toast.LENGTH_LONG).show();

                    }

                    @Override public void onLongItemClick(View view, int position) {
                        // do whatever
                    }
                })
        );

        mAdapter = new StoreCommentsAdapter(commentList);
        RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(getApplicationContext());
        recyclerView.setLayoutManager(mLayoutManager);
        recyclerView.setItemAnimator(new DefaultItemAnimator());
        recyclerView.addItemDecoration(new DividerItemDecoration(this, LinearLayoutManager.VERTICAL));
        recyclerView.setAdapter(mAdapter);

        RestAPI.getApiTest("store/" + plugin.getIdPlugin() + "/comments", null, new JsonHttpResponseHandler() {
            @Override
            public void onSuccess(int statusCode, Header[] headers, JSONArray response) {
                try {
                    commentList.addAll((List<Comment>)(new Gson().fromJson(response.toString(), new TypeToken<List<Comment>>() {
                    }.getType())));
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

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_connect, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}
