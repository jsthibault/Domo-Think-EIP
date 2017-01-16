package com.example.guillaumemunsch.domothink.activities;

import android.content.Context;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TimePicker;
import android.widget.Button;
import android.widget.Toast;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.http.RestAPI;
import com.example.guillaumemunsch.domothink.models.Device;
import com.example.guillaumemunsch.domothink.models.Directive;
import com.example.guillaumemunsch.domothink.models.PeriodicityData;
import com.example.guillaumemunsch.domothink.models.Version;
import com.example.guillaumemunsch.domothink.utils.Utils;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.loopj.android.http.JsonHttpResponseHandler;
import com.loopj.android.http.RequestParams;

import org.json.JSONArray;
import org.json.JSONObject;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.entity.StringEntity;

/**
 * Created by guillaumemunsch on 03/12/15.
 */
public class CreateUpdateDirectiveActivity extends AppCompatActivity {
    boolean edit = false;
    EditText editName = null;
    List<Device> devices = null;
    Spinner deviceSpinner = null;
    Spinner actionSpinner = null;
    Spinner periodicitySpinner = null;
    Spinner daySpinner = null;
    TimePicker tp = null;
    Directive myDirective = null;
    PeriodicityData myPeriodicityData = null;
    Button btn = null;
    Context context = null;

    private void setBtn() {
        if (getIntent().hasExtra("editedDirective"))
        {
            edit = true;
            editName.setText(myDirective.getName());
            int selectedDeviceId;
            for (selectedDeviceId = 0; selectedDeviceId < devices.size(); ++selectedDeviceId) {
                if (devices.get(selectedDeviceId).getId() == myDirective.getDeviceId()) {
                    break;
                }
            }
            if (selectedDeviceId == devices.size()) {
                Toast.makeText(context, "Unknown device", Toast.LENGTH_LONG).show();
                finish();
                return;
            }
            deviceSpinner.setSelection(selectedDeviceId);
            actionSpinner.setSelection(myDirective.getActionId());
            periodicitySpinner.setSelection(myDirective.getPeriodicityType() - 1);
            myPeriodicityData = new Gson().fromJson(myDirective.getPeriodicityData(), new TypeToken<PeriodicityData>() {}.getType());
            daySpinner.setSelection(myPeriodicityData.getDay() - 1);
            tp.setCurrentHour(Integer.parseInt(myPeriodicityData.getHour().split(":")[0]));
            tp.setCurrentMinute(Integer.parseInt(myPeriodicityData.getHour().split(":")[1]));
            btn.setText(getResources().getString(R.string.edit));
        }

        myPeriodicityData = new PeriodicityData();
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (myDirective == null) {
                    myDirective = new Directive();
                    myDirective.setIdDirective(0);
                    myDirective.setCreatorId(Integer.parseInt(Utils.getInfo(context, "userId"))); //Creator id.
                }

                myDirective.setIdDirective(edit ? myDirective.getIdDirective() : 0);
                myDirective.setCreatorId(edit ? myDirective.getCreatorId() : Integer.parseInt(Utils.getInfo(context, "userId")));
                myDirective.setName(editName.getText().toString());
                myDirective.setDeviceId(devices.get((int) deviceSpinner.getSelectedItemId()).getId());
                myDirective.setActionId((int) actionSpinner.getSelectedItemId());
                myDirective.setPeriodicityType((int) periodicitySpinner.getSelectedItemId() + 1);
                myPeriodicityData.setDay((int) daySpinner.getSelectedItemId() + 1);
                myPeriodicityData.setHour(tp.getCurrentHour() + ":" + tp.getCurrentMinute());
                myDirective.setPeriodicityData(new Gson().toJson(myPeriodicityData));

                JSONObject param = new JSONObject();
                StringEntity stringEntity = null;

                try {
                    param.put("name", myDirective.getName());
                    if (myDirective.getName().length() == 0) {
                        Toast.makeText(context, R.string.directive_name_empty, Toast.LENGTH_LONG).show();
                        return;
                    }
                    param.put("creatorId", myDirective.getCreatorId());
                    param.put("deviceId", myDirective.getDeviceId());
                    param.put("actionId", myDirective.getActionId());
                    param.put("periodicityType", myDirective.getPeriodicityType());
                    param.put("periodicityData", myDirective.getPeriodicityData());
                    stringEntity = new StringEntity(param.toString());
                } catch (Throwable ex) { Log.d("DirectiveCreate", ex.getMessage()); }

                if (!edit)
                {
                    try {
                        stringEntity = new StringEntity(param.toString());
                    } catch (Throwable ex) { Log.d("DirectiveCreate", ex.getMessage()); }
                    RestAPI.post(context, "directives", stringEntity, new JsonHttpResponseHandler() {
                        @Override
                        public void onSuccess(int statusCode, Header[] headers, JSONObject response) {
                            Toast.makeText(context, R.string.success, Toast.LENGTH_LONG).show();
                            finish();
                        }

                        @Override
                        public void onFailure(int statusCode, Header[] headers, Throwable throwable, JSONObject errorResponse) {
                            Toast.makeText(context, R.string.failure, Toast.LENGTH_LONG).show();
                            Log.d("Add directive: ", "" + statusCode);
                        }
                    });
                } else {
                    try {
                        param.put("idDirective", myDirective.getIdDirective());
                        stringEntity = new StringEntity(param.toString());
                    }
                    catch (Throwable ex)
                    {
                        Log.d("EditDirective", ex.getMessage());
                    }
                    RestAPI.put(context, "directives", stringEntity, new JsonHttpResponseHandler() {
                        @Override
                        public void onSuccess(int statusCode, Header[] headers, JSONObject response) {
                            Toast.makeText(context, R.string.success, Toast.LENGTH_LONG).show();
                            finish();
                        }

                        @Override
                        public void onFailure(int statusCode, Header[] headers, Throwable throwable, JSONObject errorResponse) {
                            Toast.makeText(context, R.string.failure, Toast.LENGTH_LONG).show();
                            Log.d("Edit directive: ", "" + statusCode);
                        }
                    });
                }

                finish();
            }
        });
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        context = this;
        setContentView(R.layout.create_edit_directive_activity);
        btn = (Button)findViewById(R.id.createEditDirectiveButton);
        if (getIntent().hasExtra("editedDirective"))
            myDirective = (Directive)getIntent().getSerializableExtra("editedDirective");
        editName = (EditText)findViewById(R.id.directiveName);
        deviceSpinner = (Spinner)findViewById(R.id.directiveObject);
        actionSpinner = (Spinner)findViewById(R.id.directiveAction);
        periodicitySpinner = (Spinner)findViewById(R.id.directivePeriodicity);
        daySpinner = (Spinner)findViewById(R.id.directiveDay);
        tp = (TimePicker)findViewById(R.id.directiveHour);
        tp.setIs24HourView(true);
        tp.setOnTimeChangedListener(new TimePicker.OnTimeChangedListener() {
            @Override
            public void onTimeChanged(TimePicker view, int hourOfDay, int minute) {

            }
        });
        periodicitySpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                if (position == 0) {
                    daySpinner.setVisibility(View.GONE);
                    tp.setVisibility(View.GONE);
                } else {
                    daySpinner.setVisibility(View.VISIBLE);
                    tp.setVisibility(View.VISIBLE);
                }
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {
                daySpinner.setVisibility(View.GONE);
                tp.setVisibility(View.GONE);
            }
        });

        RestAPI.get("/devices", null, new JsonHttpResponseHandler() {
            @Override
            public void onSuccess(int statusCode, Header[] headers, JSONArray response) {
                try {
                    devices = new Gson().fromJson(response.toString(), new TypeToken<List<Device>>() {
                    }.getType());
                    List<String> listDeviceNames = Utils.transform(devices, "name");
                    ArrayList<String> arrayListDeviceNames = new ArrayList<String>(listDeviceNames);
                    ArrayAdapter<String> spinnerArrayAdapter = new ArrayAdapter<String>(context, android.R.layout.simple_spinner_item, arrayListDeviceNames); //selected item will look like a spinner set from XML
                    spinnerArrayAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                    deviceSpinner.setAdapter(spinnerArrayAdapter);
                    setBtn();
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
//        int id = item.getItemId();
//
//        //noinspection SimplifiableIfStatement
//        if (id == R.id.action_settings) {
//            return true;
//        }

        return super.onOptionsItemSelected(item);
    }
}
