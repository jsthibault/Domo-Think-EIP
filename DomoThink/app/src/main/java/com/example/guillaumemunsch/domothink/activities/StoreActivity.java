package com.example.guillaumemunsch.domothink.activities;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ListView;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.adapter.PluginAdapter;
import com.example.guillaumemunsch.domothink.adapter.SwitchListAdapter;
import com.example.guillaumemunsch.domothink.models.Plugin;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;


/**
 * Created by guillaumemunsch on 03/12/15.
 */
public class StoreActivity extends AppCompatActivity {
    ListView list = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.store_activity);

        int[] icons = new int[]{R.drawable.plugin_logo, R.drawable.plugin_logo, R.drawable.plugin_logo, R.drawable.plugin_logo};
        String[] names = new String[]{"Valentine Day", "Music Mode", "Cinema setup", "Working Mood"};
        String[] descs = new String[]{"The best plugin for your couples evenings", "Ready to rock ?!", "Watch your favourite movies !", "Calm ambiance. Perfect for work !"};
        float[] rates = new float[]{4.7f, 3.8f, 4.4f, 3f};

        list = (ListView)findViewById(R.id.pluginList);

        List<Plugin> plugins = new ArrayList<Plugin>();
/*        for (int i = 0; i < 4; ++i)
            plugins.add(new Plugin(i, icons[i], names[i], descs[i], rates[i]));
*/
        list.setAdapter(new PluginAdapter(this, plugins));

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.searchable_menu, menu);
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
