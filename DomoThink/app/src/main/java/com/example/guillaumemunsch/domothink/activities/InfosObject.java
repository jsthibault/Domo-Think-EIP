package com.example.guillaumemunsch.domothink.activities;

import android.content.Context;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Button;
import android.widget.Toast;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.http.RestAPI;
import com.example.guillaumemunsch.domothink.models.Device;
import com.loopj.android.http.JsonHttpResponseHandler;
import com.loopj.android.http.RequestParams;

import org.json.JSONObject;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.entity.StringEntity;

/**
 * Created by guillaumemunsch on 21/04/16.
 */
public class InfosObject extends AppCompatActivity {
    EditText name = null;
    Device device = null;
    Button button = null;
    Context context = this;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_object_infos);
        name = (EditText)findViewById(R.id.infoObjectName);
        device = (Device)getIntent().getSerializableExtra("device");
        button = (Button)findViewById(R.id.editDeviceNameBtn);
        name.setText(device.getName(), TextView.BufferType.EDITABLE);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                device.setName(name.getText().toString());
                JSONObject param = new JSONObject();
                StringEntity stringEntity = null;
                try {
                    param.put("name", device.getName());
                    stringEntity = new StringEntity(param.toString());
                }
                catch (Throwable ex)
                {
                    Log.d("OK", "OK");
                }
                RestAPI.putApiTest(InfosObject.this, "device/" + device.getId(), stringEntity, new JsonHttpResponseHandler() {
                    @Override
                    public void onSuccess(int statusCode, Header[] headers, JSONObject response) {
                        Toast.makeText(InfosObject.this, R.string.yes, Toast.LENGTH_LONG).show();
                        finish();
                    }

                    @Override
                    public void onFailure(int statusCode, Header[] headers, Throwable throwable, JSONObject errorResponse) {
                        Toast.makeText(InfosObject.this, R.string.no, Toast.LENGTH_LONG).show();
                        Log.d("Edit object: ", "" + statusCode);
                    }
                });
            }
        });
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.menu_connect, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();

        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}
