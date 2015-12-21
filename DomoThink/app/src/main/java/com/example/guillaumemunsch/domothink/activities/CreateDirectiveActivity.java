package com.example.guillaumemunsch.domothink.activities;

import android.app.TimePickerDialog;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.Spinner;
import android.widget.TimePicker;

import com.example.guillaumemunsch.domothink.R;

/**
 * Created by guillaumemunsch on 03/12/15.
 */
public class CreateDirectiveActivity extends AppCompatActivity {
    Spinner periodicity = null;
    Spinner day = null;
    TimePicker tp = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.create_directive_activity);
        periodicity = (Spinner)findViewById(R.id.newDirectivePeriodicity);
        day = (Spinner)findViewById(R.id.newDirectiveDay);
        tp = (TimePicker)findViewById(R.id.directiveHour);
        tp.setIs24HourView(true);
        tp.setOnTimeChangedListener(new TimePicker.OnTimeChangedListener() {
            @Override
            public void onTimeChanged(TimePicker view, int hourOfDay, int minute) {

            }
        });
        periodicity.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                if (position == 0) {
                    day.setVisibility(View.GONE);
                    tp.setVisibility(View.GONE);
                }
                else {
                    day.setVisibility(View.VISIBLE);
                    tp.setVisibility(View.VISIBLE);
                }
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {
                day.setVisibility(View.GONE);
                tp.setVisibility(View.GONE);
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
