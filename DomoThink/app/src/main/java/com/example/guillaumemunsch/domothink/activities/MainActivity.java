package com.example.guillaumemunsch.domothink.activities;

import android.app.Fragment;
import android.app.FragmentManager;
import android.content.Context;
import android.content.res.TypedArray;
import android.os.Bundle;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v4.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.GridView;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.Toast;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.adapter.NavDrawerListAdapter;
import com.example.guillaumemunsch.domothink.fragments.DashboardFragment;
import com.example.guillaumemunsch.domothink.fragments.DirectivesFragment;
import com.example.guillaumemunsch.domothink.fragments.MyPluginsFragment;
import com.example.guillaumemunsch.domothink.fragments.ObjectsFragment;
import com.example.guillaumemunsch.domothink.fragments.SettingsFragment;
import com.example.guillaumemunsch.domothink.fragments.StoreFragment;
import com.example.guillaumemunsch.domothink.fragments.UpdateFragment;
import com.example.guillaumemunsch.domothink.http.RestAPI;
import com.example.guillaumemunsch.domothink.models.NavDrawerItem;
import com.example.guillaumemunsch.domothink.utils.Utils;
import com.loopj.android.http.JsonHttpResponseHandler;

import org.json.JSONObject;

import java.util.ArrayList;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.entity.StringEntity;


public class MainActivity extends AppCompatActivity implements NavigationView.OnNavigationItemSelectedListener {

    private ArrayList<Fragment> fragmentList;
    private FragmentManager fragmentManager;
    private Context context = null;

/*    private DrawerLayout mDrawerLayout;
    private ListView mDrawerList;
    private ActionBarDrawerToggle mDrawerToggle;
    private CharSequence mDrawerTitle;

    // used to store app title
    private CharSequence mTitle;

    // slide menu items
    private String[] navMenuTitles;
    private TypedArray navMenuIcons;

    private ArrayList<NavDrawerItem> navDrawerItems;
    private NavDrawerListAdapter adapter;*/

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        context = this;
        setContentView(R.layout.main_activity);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        toolbar.setTitle(getResources().getStringArray(R.array.nav_drawer_title)[0]);
        setSupportActionBar(toolbar);

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        android.support.v7.app.ActionBarDrawerToggle toggle = new android.support.v7.app.ActionBarDrawerToggle(
                this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);

        drawer.setDrawerListener(toggle);
        toggle.syncState();

        NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view);
        navigationView.setNavigationItemSelectedListener(this);

        fragmentManager = getFragmentManager();
        fragmentList = new ArrayList<Fragment>();
        fragmentList.add(new DashboardFragment());
        fragmentList.add(new ObjectsFragment());
        fragmentList.add(new DirectivesFragment());
        fragmentList.add(new MyPluginsFragment());
        fragmentList.add(new StoreFragment());
        fragmentList.add(new UpdateFragment());
        fragmentList.add(new SettingsFragment());

        fragmentManager.beginTransaction().replace(R.id.fragment_container, fragmentList.get(0)).commit();
    }

    @Override
    public void onBackPressed() {
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        if (drawer.isDrawerOpen(GravityCompat.START)) {
            drawer.closeDrawer(GravityCompat.START);
        } else {
            super.onBackPressed();
        }
    }

    @SuppressWarnings("StatementWithEmptyBody")
    @Override
    public boolean onNavigationItemSelected(MenuItem item) {
        int id = item.getItemId();
        int placeId = 0;

        Fragment fragment = null;
        FragmentManager fragmentManager = getFragmentManager();

        if (id == R.id.nav_dashboard) {
            placeId = 0;
        } else if (id == R.id.nav_objects) {
            placeId = 1;
        } else if (id == R.id.nav_directives) {
            placeId = 2;
        } else if (id == R.id.nav_plugins) {
            placeId = 3;
        } else if (id == R.id.nav_store) {
            placeId = 4;
        } else if (id == R.id.nav_update) {
            placeId = 5;
        } else if (id == R.id.nav_settings) {
            placeId = 6;
        } else if (id == R.id.nav_logout) {
            finish();
            JSONObject param = new JSONObject();
            StringEntity stringEntity = null;
            try {
                param.put("token", Utils.getToken(context));
                stringEntity = new StringEntity(param.toString());
            }
            catch (Throwable ex)
            {
                Log.d("OK", "OK");
            }
            RestAPI.post(context, "/logout", stringEntity, new JsonHttpResponseHandler() {
                @Override
                public void onSuccess(int statusCode, Header[] headers, JSONObject response) {
                    Toast.makeText(context, R.string.logout, Toast.LENGTH_LONG).show();
                    finish();
                }

                @Override
                public void onFailure(int statusCode, Header[] headers, Throwable throwable, JSONObject errorResponse) {
                    Toast.makeText(context, R.string.no, Toast.LENGTH_LONG).show();
                    Log.d("Error: ", "" + statusCode);
                }
            });
            return true;
        }
        fragment = fragmentList.get(placeId);
        ((Toolbar)findViewById(R.id.toolbar)).setTitle(getResources().getStringArray(R.array.nav_drawer_title)[placeId]);
        fragmentManager.beginTransaction().replace(R.id.fragment_container, fragment).commit();

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        return true;
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.menu_connect, menu);
        return true;
    }

}
