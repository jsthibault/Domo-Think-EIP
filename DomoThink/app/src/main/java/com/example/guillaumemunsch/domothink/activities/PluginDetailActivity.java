package com.example.guillaumemunsch.domothink.activities;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
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
import android.widget.Button;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.adapter.StoreCommentsAdapter;
import com.example.guillaumemunsch.domothink.http.RestAPI;
import com.example.guillaumemunsch.domothink.models.Comment;
import com.example.guillaumemunsch.domothink.models.Device;
import com.example.guillaumemunsch.domothink.models.Plugin;
import com.example.guillaumemunsch.domothink.recycler.DividerItemDecoration;
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
import cz.msebera.android.httpclient.entity.StringEntity;

/**
 * Created by guillaumemunsch on 04/12/15.
 */
public class PluginDetailActivity extends AppCompatActivity {
    RecyclerView recyclerView = null;
    TextView pluginName = null;
    TextView pluginDesc = null;
    RatingBar pluginRate = null;
    TextView pluginRateText = null;
    Plugin plugin = null;
    List<Comment> commentList = new ArrayList<>();
    Context context;
    Button pluginInstallButton = null;
    private StoreCommentsAdapter mAdapter;
    FloatingActionButton addComment = null;
    boolean installed;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        context = this;
        setContentView(R.layout.plugin_detail_activity);

        addComment = (FloatingActionButton)findViewById(R.id.addCommentButton);
        addComment.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(PluginDetailActivity.this, PostCommentActivity.class);
                intent.putExtra("pluginId", plugin.getIdPlugin());
                startActivity(intent);
            }
        });

        if (getIntent().hasExtra("storePlugin"))
            plugin = (Plugin)getIntent().getSerializableExtra("storePlugin");
        else
            finish();
        installed = getIntent().hasExtra("installed");
        pluginName = (TextView)findViewById(R.id.pluginName);
        pluginName.setText(plugin.getName());
        pluginDesc = (TextView)findViewById(R.id.pluginDescription);
        pluginDesc.setText(plugin.getRepository());
        pluginRate = (RatingBar)findViewById(R.id.pluginRate);
        pluginRate.setRating(plugin.getRate());
        pluginRateText = (TextView)findViewById(R.id.pluginRateText);
        if (plugin.getRate() == -1f) {
            pluginRateText.setText("No rate");
            pluginRate.setVisibility(View.INVISIBLE);
        }
        else {
            pluginRate.setRating(plugin.getRate());
        }
        pluginInstallButton = (Button)findViewById(R.id.pluginInstallButton);
        if (installed) {
            pluginInstallButton.setBackgroundTintList(getResources().getColorStateList(R.color.grey));
            pluginInstallButton.setText(getResources().getString(R.string.alreadyInstalled));
        }
        else {
            pluginInstallButton.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    JSONObject param = new JSONObject();
                    StringEntity stringEntity = null;
                    try {
                        param.put("idPlugin", plugin.getIdPlugin());
                        param.put("name", plugin.getName());
                        param.put("repository", plugin.getRepository());
                        param.put("status", true);
                        stringEntity = new StringEntity(param.toString());
                    }
                    catch (Throwable ex)
                    {
                        Log.d("PluginDetailActivity", ex.getMessage());
                    }
                    RestAPI.post(PluginDetailActivity.this, "plugins/install", stringEntity, new JsonHttpResponseHandler() {
                        @Override
                        public void onSuccess(int statusCode, Header[] headers, JSONObject response) {
                            Toast.makeText(context, getResources().getString(R.string.alreadyInstalled), Toast.LENGTH_LONG).show();
                            finish();
                        }



                        @Override
                        public void onFailure(int statusCode, Header[] headers, Throwable throwable, JSONObject response) {
                            Toast.makeText(context, getResources().getString(R.string.unableToInstall), Toast.LENGTH_LONG).show();
                            finish();
                        }
                    });
                }
            });
        }

        recyclerView = (RecyclerView) findViewById(R.id.commentsRecyclerList);
        recyclerView.addOnItemTouchListener(
                new RecyclerItemClickListener(context, recyclerView ,new RecyclerItemClickListener.OnItemClickListener() {
                    @Override public void onItemClick(View view, int position) {
                        Intent intent = new Intent(PluginDetailActivity.this, PostCommentActivity.class);
                        intent.putExtra("pluginId", plugin.getIdPlugin());
                        intent.putExtra("idComment", commentList.get(position).getIdComment());
                        intent.putExtra("keyLoginHash", commentList.get(position).getKeyLoginHash());
                        intent.putExtra("rate", commentList.get(position).getRate());
                        intent.putExtra("comment", commentList.get(position).getComment());
                        startActivity(intent);
                    }

                    @Override public void onLongItemClick(View view, final int position) {
                        if (!Utils.md5(Utils.getInfo(context, "userId") + Utils.getInfo(context, "password")).equals(commentList.get(position).getKeyLoginHash())) {
                            Toast.makeText(context, getResources().getString(R.string.forbidden), Toast.LENGTH_LONG).show();
                            return;
                        }
                        AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(context);

                        alertDialogBuilder.setTitle("Delete comment");
                        alertDialogBuilder.setMessage("Do you really wanna delete this comment ?").setCancelable(false)
                                .setPositiveButton("Yes", new DialogInterface.OnClickListener() {
                                    @Override
                                    public void onClick(final DialogInterface dialog, int id) {
                                        RestAPI.deleteStore("/store/comments/" + commentList.get(position).getIdComment(), null, new JsonHttpResponseHandler() {
                                            @Override
                                            public void onSuccess(int statusCode, Header[] headers, JSONObject response) {
                                                Log.d("OU", "GG");
                                                try {
                                                    Toast.makeText(PluginDetailActivity.this, "Removed", Toast.LENGTH_LONG).show();
                                                    finish();
                                                } catch (Throwable ex) {
                                                    Toast.makeText(PluginDetailActivity.this, "Fail", Toast.LENGTH_LONG).show();
                                                }
                                            }

                                            @Override
                                            public void onFailure(int statusCode, Header[] headers, String responseString, Throwable throwable) {
                                                Toast.makeText(PluginDetailActivity.this, throwable.getMessage(), Toast.LENGTH_LONG).show();
                                            }

                                            @Override
                                            public void onFailure(int statusCode, Header[] headers, Throwable throwable, JSONObject errorResponse) {
                                                Toast.makeText(PluginDetailActivity.this, throwable.getMessage(), Toast.LENGTH_LONG).show();
                                            }
                                        });
                                    }
                                })
                                .setNegativeButton("No", new DialogInterface.OnClickListener() {
                                    @Override
                                    public void onClick(DialogInterface dialog, int id) {
                                        dialog.cancel();
                                    }
                                });

                        // create alert dialog
                        AlertDialog alertDialog = alertDialogBuilder.create();

                        // show it
                        alertDialog.show();
                    }
                })
        );

        mAdapter = new StoreCommentsAdapter(commentList);
        RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(getApplicationContext());
        recyclerView.setLayoutManager(mLayoutManager);
        recyclerView.setItemAnimator(new DefaultItemAnimator());
        recyclerView.addItemDecoration(new DividerItemDecoration(this, LinearLayoutManager.VERTICAL));
        recyclerView.setAdapter(mAdapter);

        RestAPI.getStore("store/" + plugin.getIdPlugin() + "/comments", null, new JsonHttpResponseHandler() {
            @Override
            public void onSuccess(int statusCode, Header[] headers, JSONArray response) {
                try {
                    commentList.clear();
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
    protected void onResume() {
        super.onResume();
        RestAPI.getStore("store/" + plugin.getIdPlugin() + "/comments", null, new JsonHttpResponseHandler() {
            @Override
            public void onSuccess(int statusCode, Header[] headers, JSONArray response) {
                try {
                    commentList.clear();
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
