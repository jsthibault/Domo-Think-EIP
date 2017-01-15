package com.example.guillaumemunsch.domothink.activities;

import android.content.Context;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TimePicker;
import android.widget.Button;
import android.widget.Toast;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.http.RestAPI;
import com.example.guillaumemunsch.domothink.models.Directive;
import com.example.guillaumemunsch.domothink.utils.Utils;
import com.google.gson.Gson;
import com.loopj.android.http.JsonHttpResponseHandler;
import com.loopj.android.http.RequestParams;

import org.json.JSONObject;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.entity.StringEntity;

/**
 * Created by guillaumemunsch on 03/12/15.
 */
public class CreateUpdateDirectiveActivity extends AppCompatActivity {
    boolean edit = false;
    EditText editName = null;
    Spinner deviceSpinner = null;
    Spinner actionSpinner = null;
    Spinner periodicitySpinner = null;
    Spinner daySpinner = null;
    TimePicker tp = null;
    Directive myDirective = null;
    Button btn = null;
    Context context = null;

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

        if (getIntent().hasExtra("editedDirective"))
        {
            edit = true;
            editName.setText(myDirective.getName());
            //deviceSpinner.setSelection(myDirective.getDeviceId());
            //actionSpinner.setSelection(myDirective.getActionId());
            /*periodicitySpinner.setSelection(myDirective.getPeriodicity().getType());
            daySpinner.setSelection(myDirective.getPeriodicity().getDay());
            tp.setCurrentHour(myDirective.getPeriodicity().getHour());
            tp.setCurrentMinute(myDirective.getPeriodicity().getMinute());*/
            btn.setText("EDIT");
        }

        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (myDirective == null) {
                    myDirective = new Directive();
                    myDirective.setId(0);
                    myDirective.setCreatorId(1); //Creator id.
                }

                myDirective.setName(editName.getText().toString());
                myDirective.setDeviceId((int) deviceSpinner.getSelectedItemId());
                myDirective.setActionId((int) actionSpinner.getSelectedItemId());
/*                Periodicity periodicity = new Periodicity();
                periodicity.setType((int) periodicitySpinner.getSelectedItemId());
                periodicity.setDay((int) daySpinner.getSelectedItemId());
                periodicity.setHour(tp.getCurrentHour());
                periodicity.setMinute(tp.getCurrentMinute());
                myDirective.setPeriodicity(periodicity);*/
                RequestParams params = new RequestParams();
                params.put("directive", new Gson().toJson(myDirective));

                if (!edit)
                {
                    JSONObject param = new JSONObject();
                    StringEntity stringEntity = null;
                    try {
                        param.put("name", myDirective.getName());
                        if (myDirective.getName().length() == 0) {
                            Toast.makeText(context, R.string.directive_name_empty, Toast.LENGTH_LONG).show();
                            throw new Exception("Directive name is empty");
                        }
                        param.put("creatorId", Utils.getInfo(context, "userId"));
                        param.put("deviceId", deviceSpinner.getSelectedItemId());
                        param.put("actionId", actionSpinner.getSelectedItem());
                        param.put("periodicityType", periodicitySpinner.getSelectedItem());
                        param.put("periodicityData", "{ data: 'now' }");
                        stringEntity = new StringEntity(param.toString());
                    }
                    catch (Throwable ex)
                    {
                        Log.d("DirectiveCreate", ex.getMessage());
                    }
                    RestAPI.post(context, "directives", stringEntity, new JsonHttpResponseHandler() {
                        @Override
                        public void onSuccess(int statusCode, Header[] headers, JSONObject response) {
                            Toast.makeText(context, R.string.yes, Toast.LENGTH_LONG).show();
                            finish();
                        }

                        @Override
                        public void onFailure(int statusCode, Header[] headers, Throwable throwable, JSONObject errorResponse) {
                            Toast.makeText(context, R.string.no, Toast.LENGTH_LONG).show();
                            Log.d("Add directive: ", "" + statusCode);
                        }
                    });
                }
                else
                {
                    JSONObject param = new JSONObject();
                    StringEntity stringEntity = null;
                    try {
                        param.put("name", myDirective.getName());
                        if (myDirective.getName().length() == 0) {
                            Toast.makeText(context, R.string.directive_name_empty, Toast.LENGTH_LONG).show();
                            throw new Exception("Directive name is empty");
                        }
                        param.put("deviceId", deviceSpinner.getSelectedItemId());
                        param.put("actionId", actionSpinner.getSelectedItem());
                        param.put("periodicityType", periodicitySpinner.getSelectedItem());
                        param.put("periodicityData", "{ data: 'now' }");
                        stringEntity = new StringEntity(param.toString());
                    }
                    catch (Throwable ex)
                    {
                        Log.d("EditDirective", ex.getMessage());
                    }
                    RestAPI.put(context, "directives", stringEntity, new JsonHttpResponseHandler() {
                        @Override
                        public void onSuccess(int statusCode, Header[] headers, JSONObject response) {
                            Toast.makeText(context, R.string.yes, Toast.LENGTH_LONG).show();
                            finish();
                        }

                        @Override
                        public void onFailure(int statusCode, Header[] headers, Throwable throwable, JSONObject errorResponse) {
                            Toast.makeText(context, R.string.no, Toast.LENGTH_LONG).show();
                            Log.d("Edit directive: ", "" + statusCode);
                        }
                    });
                }
/*                if (!edit)
                    RestAPI.post("/directive", params, new JsonHttpResponseHandler(){
                        @Override
                        public void onSuccess(int statusCode, Header[] headers, JSONObject response) {
                            Log.d("CreateUpdateDirective: ", "Creation success");
                        }

                        @Override
                        public void onFailure(int statusCode, Header[] headers, String responseString, Throwable throwable) {
                            Log.d("CreateUpdateDirective: ", "Creation failure");
                        }
                    });
                else
                    RestAPI.put("/directive/" + myDirective.getId(), params, new JsonHttpResponseHandler(){
                        @Override
                        public void onSuccess(int statusCode, Header[] headers, JSONObject response) {
                            Log.d("CreateUpdateDirective: ", "Edition success");
                        }

                        @Override
                        public void onFailure(int statusCode, Header[] headers, String responseString, Throwable throwable) {
                            Log.d("CreateUpdateDirective: ", "Edition failure");
                        }
                    });
                    */
                finish();
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
