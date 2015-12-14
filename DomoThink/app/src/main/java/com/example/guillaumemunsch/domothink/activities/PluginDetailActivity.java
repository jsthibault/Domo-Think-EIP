package com.example.guillaumemunsch.domothink.activities;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ListView;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.adapter.PluginCommentsAdapter;

/**
 * Created by guillaumemunsch on 04/12/15.
 */
public class PluginDetailActivity extends AppCompatActivity {
    ListView list = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.plugin_detail_activity);

        int[] icons = new int[]{R.drawable.mario, R.drawable.mario, R.drawable.mario};
        String[] names = new String[]{"Marcel Patulacci", "Tom Cruise", "Emma Watson"};
        String[] comments = new String[]{"Really cool though !", "Crashes everytime I use it ! Fix this please !!!", "OMFG. Too much advertisement ! :@ !!"};
        float[] rates = new float[]{5f, 2f, 3.5f};

        list = (ListView)findViewById(R.id.pluginCommentsList);
        list.setAdapter(new PluginCommentsAdapter(this, icons, names, comments, rates));
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
