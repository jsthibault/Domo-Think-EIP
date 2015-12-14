package com.example.guillaumemunsch.domothink.activities;

import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.GridView;
import android.widget.ImageView;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.adapter.MenuAdapter;


public class MainActivity extends AppCompatActivity {
    ImageView imageView = null;
    GridView gv = null;
    public static String [] menuItems = {"Objets", "Directives", "Ma DomoBox", "Store", "Mise à jour", "Paramètres"};
    public static int [] menuImages = {R.drawable.icon_grid_objects, R.drawable.icon_grid_directives, R.drawable.icon_grid_domobox,
            R.drawable.icon_grid_store, R.drawable.icon_grid_update, R.drawable.icon_grid_settings};
    public static Class [] menuLinks = {ConnectedObjectsActivity.class, DirectivesActivity.class, MyDomoBoxActivity.class,
            StoreActivity.class, UpdateActivity.class, SettingsActivity.class};

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main_activity);

        gv = (GridView)findViewById(R.id.gridView);
        gv.setAdapter(new MenuAdapter(this, menuItems, menuImages, menuLinks));

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
