package com.example.guillaumemunsch.domothink.activities;

import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.v7.app.AppCompatActivity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.ListView;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.adapter.SwitchListAdapter;

/**
 * Created by guillaumemunsch on 03/12/15.
 */
public class ConnectedObjectsActivity extends AppCompatActivity {

    FloatingActionButton search = null;
    ListView list = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.connected_objects_activity);

        String[] objs = new String[]{"Television", "Lampe salon", "Lampe chambre bébé", "Radiateur"};
        boolean[] states = new boolean[]{true, false, false, true};
        list = (ListView)findViewById(R.id.listView);
        list.setAdapter(new SwitchListAdapter(this, objs, states));
        search = (FloatingActionButton)findViewById(R.id.searchObjectsButton);
        search.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(ConnectedObjectsActivity.this, SearchObjectsActivity.class));
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

        return super.onOptionsItemSelected(item);
    }
}
