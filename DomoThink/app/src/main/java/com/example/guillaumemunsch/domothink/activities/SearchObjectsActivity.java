package com.example.guillaumemunsch.domothink.activities;

import android.os.Bundle;
import android.os.CountDownTimer;
import android.support.v7.app.AppCompatActivity;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ListView;
import android.widget.TextView;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.adapter.CheckboxListAdapter;

/**
 * Created by guillaumemunsch on 03/12/15.
 */
public class SearchObjectsActivity extends AppCompatActivity {
    TextView text = null;
    ListView list = null;
    SearchObjectsActivity context = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.search_objects_activity);

        context = SearchObjectsActivity.this;

        text = (TextView)findViewById(R.id.searchObjectId);

        new CountDownTimer(3000, 1000) {

            public void onTick(long ms) {
                text.setText("seconds remaining: " + ms / 1000);
            }

            public void onFinish() {
                text.setText("done!");
                setContentView(R.layout.found_objects_activity);
                String [] objects = new String[]{
                        "Lampe XYZ", "Temp Capture XYZ", "Autre module", "TV Smart Sony"
                };
                boolean [] states = new boolean[]{
                        true, false, false, true
                };
                list = (ListView)findViewById(R.id.listFoundObjects);

                list.setAdapter(new CheckboxListAdapter(context, objects, states));

            }
        }.start();

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
