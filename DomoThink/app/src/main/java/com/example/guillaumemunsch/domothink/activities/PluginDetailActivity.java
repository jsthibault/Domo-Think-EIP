package com.example.guillaumemunsch.domothink.activities;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ListView;
import android.widget.RatingBar;
import android.widget.TextView;
import android.widget.Toast;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.adapter.PluginCommentsAdapter;
import com.example.guillaumemunsch.domothink.models.Comment;
import com.example.guillaumemunsch.domothink.models.Plugin;

import java.util.List;

/**
 * Created by guillaumemunsch on 04/12/15.
 */
public class PluginDetailActivity extends AppCompatActivity {
    ListView commentsList = null;
    TextView pluginName = null;
    TextView pluginDesc = null;
    RatingBar pluginRate = null;
    Plugin plugin = null;
    List<Comment> comments;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.plugin_detail_activity);

        if (getIntent().hasExtra("storePlugin"))
            plugin = (Plugin)getIntent().getSerializableExtra("storePlugin");
        else
            Log.d("Error", "No plugin in extras ?! Oo");
        if (plugin == null) {
            Log.d("Error", "No plugin");
        }
        else {
            Log.d("Success", "Plugin");
        }

        int[] icons = new int[]{R.drawable.plugin_logo, R.drawable.plugin_logo, R.drawable.plugin_logo};
        String[] names = new String[]{"User 1", "User 2", "User 3"};
        String[] comments = new String[]{"This plugin works great!", "Crashed with the lamp XM1014", "I use this plugin a lot, it works well."};
        float[] rates = new float[]{5f, 2f, 3.5f};

        pluginName = (TextView)findViewById(R.id.pluginName);
        //pluginName.setText(plugin.getName());
        pluginDesc = (TextView)findViewById(R.id.pluginDescription);
        //pluginDesc.setText(plugin.getRepository()); // ? A voir
        pluginRate = (RatingBar)findViewById(R.id.pluginRate);
        //pluginRate.setRating(plugin.getRate());
        commentsList = (ListView)findViewById(R.id.pluginCommentsList);
        commentsList.setAdapter(new PluginCommentsAdapter(this, null, names, comments, rates));
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
