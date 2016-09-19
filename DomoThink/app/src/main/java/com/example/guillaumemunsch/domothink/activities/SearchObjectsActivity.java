package com.example.guillaumemunsch.domothink.activities;

import android.os.Bundle;
import android.os.CountDownTimer;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.adapter.CheckboxListAdapter;
import com.example.guillaumemunsch.domothink.http.RestAPI;
import com.example.guillaumemunsch.domothink.models.Device;
import com.example.guillaumemunsch.domothink.utils.Utils;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.loopj.android.http.JsonHttpResponseHandler;
import com.loopj.android.http.RequestParams;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.List;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.entity.StringEntity;

/**
 * Created by guillaumemunsch on 03/12/15.
 */
public class SearchObjectsActivity extends AppCompatActivity {
    TextView text = null;
    ListView list = null;
    SearchObjectsActivity context = null;
    List<Device> foundDevices;

    private void loadContent()
    {
        setContentView(R.layout.found_objects_activity);
        list = (ListView)findViewById(R.id.listFoundObjects);
        final ArrayAdapter adapter = new ArrayAdapter(this, android.R.layout.simple_list_item_1, Utils.transform(foundDevices, "name"));
        list.setAdapter(adapter);
        list.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, final int position, long id) {
                RequestParams params = new RequestParams();
                JSONObject param = new JSONObject();
                StringEntity stringEntity = null;
                try {
                    param.put("id", foundDevices.get(position).getId());
                    param.put("name", foundDevices.get(position).getName());
                    param.put("description", foundDevices.get(position).getDescription());
                    param.put("state", foundDevices.get(position).isActivate());
                    stringEntity = new StringEntity(param.toString());
                }
                catch (Throwable ex)
                {
                    Log.d("OK", "OK");
                }
                RestAPI.postApiTest(SearchObjectsActivity.this, "device", stringEntity, new JsonHttpResponseHandler() {
                    @Override
                    public void onSuccess(int statusCode, Header[] headers, JSONObject response) {
                        adapter.remove(adapter.getItem(position));
                        adapter.notifyDataSetChanged();
                        Toast.makeText(SearchObjectsActivity.this, R.string.add_device, Toast.LENGTH_LONG).show();
                        finish();
                    }

                    @Override
                    public void onFailure(int statusCode, Header[] headers, Throwable throwable, JSONObject errorResponse) {
                        Toast.makeText(SearchObjectsActivity.this, R.string.unable_create_account, Toast.LENGTH_LONG).show();
                        finish();
                    }
                });
            }
        });
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.search_objects_activity);

        context = SearchObjectsActivity.this;

        text = (TextView)findViewById(R.id.searchObjectId);
        RestAPI.getApiTest("installDevice", null, new JsonHttpResponseHandler() {
            @Override
            public void onSuccess(int statusCode, Header[] headers, JSONArray response) {
                foundDevices = new Gson().fromJson(response.toString(), new TypeToken<List<Device>>() {
                }.getType());
                loadContent();
            }

            @Override
            public void onFailure(int statusCode, Header[] headers, String responseString, Throwable throwable) {
                Log.d("Fail:", "Unable to detect objects.");
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
