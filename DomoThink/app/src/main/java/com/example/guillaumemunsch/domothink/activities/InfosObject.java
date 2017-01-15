package com.example.guillaumemunsch.domothink.activities;

import android.content.Context;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.inputmethod.EditorInfo;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Button;
import android.widget.Toast;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.http.RestAPI;
import com.example.guillaumemunsch.domothink.models.Device;
import com.github.mikephil.charting.charts.LineChart;
import com.github.mikephil.charting.components.LimitLine;
import com.github.mikephil.charting.components.XAxis;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.data.LineData;
import com.github.mikephil.charting.data.LineDataSet;
import com.github.mikephil.charting.interfaces.datasets.ILineDataSet;
import com.loopj.android.http.JsonHttpResponseHandler;
import com.loopj.android.http.RequestParams;

import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

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

    private void postComment() {
        device.setName(name.getText().toString());
        JSONObject param = new JSONObject();
        StringEntity stringEntity = null;
        try {
            param.put("idDevice", device.getId());
            param.put("name", device.getName());
            stringEntity = new StringEntity(param.toString());
        }
        catch (Throwable ex)
        {
            Log.d("OK", "OK");
        }
        RestAPI.put(InfosObject.this, "devices", stringEntity, new JsonHttpResponseHandler() {
            @Override
            public void onSuccess(int statusCode, Header[] headers, JSONObject response) {
                Toast.makeText(InfosObject.this, R.string.success, Toast.LENGTH_LONG).show();
                finish();
            }

            @Override
            public void onFailure(int statusCode, Header[] headers, Throwable throwable, JSONObject errorResponse) {
                Toast.makeText(InfosObject.this, R.string.failure, Toast.LENGTH_LONG).show();
                Log.d("Edit object: ", "" + statusCode);
            }
        });
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_object_infos);
        name = (EditText)findViewById(R.id.infoObjectName);
        device = (Device)getIntent().getSerializableExtra("device");
        button = (Button)findViewById(R.id.editDeviceNameBtn);
        name.setText(device.getName(), TextView.BufferType.EDITABLE);
        name.setOnEditorActionListener(new TextView.OnEditorActionListener() {
            public boolean onEditorAction(TextView v, int actionId, KeyEvent event) {
                if ((event != null && (event.getKeyCode() == KeyEvent.KEYCODE_ENTER)) || (actionId == EditorInfo.IME_ACTION_DONE)) {
                    postComment();
                }
                return false;
            }
        });
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                postComment();
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
