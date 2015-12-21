package com.example.guillaumemunsch.domothink.activities;

import android.app.Fragment;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.design.widget.TabLayout;
import android.support.v4.view.ViewPager;
import android.support.v7.app.ActionBar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.EditText;
import android.widget.ListView;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.adapter.PluginAdapter;
import com.example.guillaumemunsch.domothink.adapter.ViewPagerAdapter;
import com.example.guillaumemunsch.domothink.fragments.BaseFragment;
import com.example.guillaumemunsch.domothink.fragments.StoreNewAppsFragment;
import com.example.guillaumemunsch.domothink.fragments.StoreTopAllTimesFragment;

import java.util.ArrayList;
import java.util.List;

import com.example.guillaumemunsch.domothink.models.Plugin;

/**
 * Created by guillaumemunsch on 20/12/15.
 */
public class TabsActivity extends AppCompatActivity {
    private Toolbar toolbar;
    private TabLayout tabLayout;
    private ViewPager viewPager;
    private List<Plugin> mPlugins;
    private List<Plugin> mPluginsFiltered;
    private boolean mSearchOpened;
    private String mSearchString;
    private ListView mPluginsListView;
    private Drawable mIconOpenSearch;
    private Drawable mIconCloseSearch;
    private EditText mSearchEt;
    private MenuItem mSearchAction;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.tabs);

        //


        toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        viewPager = (ViewPager) findViewById(R.id.viewpager);
        setupViewPager(viewPager);

        tabLayout = (TabLayout) findViewById(R.id.tabs);
        tabLayout.setupWithViewPager(viewPager);


        if (savedInstanceState == null) {
            mPlugins = new ArrayList<Plugin>();
            mPlugins.add(new Plugin(R.drawable.mario, "Plugin 1", "Un excellent plugin !", 5f));
            mPlugins.add(new Plugin(R.drawable.mario, "Plugin 2", "Un plugin génial !", 4.8f));
            mPlugins.add(new Plugin(R.drawable.mario, "Plugin 3", "Un super plugin !", 4.5f));
            mPlugins.add(new Plugin(R.drawable.mario, "Plugin 4", "Un très bon plugin !", 2.3f));
            mPluginsFiltered = mPlugins;
            mSearchOpened = false;
            mSearchString = "";
        } else {
            mPlugins = (List<Plugin>) savedInstanceState.getParcelable("mPlugins");
            mPluginsFiltered = (List<Plugin>) savedInstanceState.getParcelable("mFilteredPlugins");
            mSearchOpened = savedInstanceState.getBoolean("mSearchOpened");
            mSearchString = savedInstanceState.getString("mSearchString");
        }

        // Getting the icons.
        mIconOpenSearch = getResources().getDrawable(R.drawable.search);
        mIconCloseSearch = getResources().getDrawable(R.drawable.button_delete);

        if ((((ViewPagerAdapter) (viewPager.getAdapter())).getItem(viewPager.getCurrentItem())) != null)
            Log.d("Ok", "FONCTIONNEL !");
        // Initializing the list view.

//        mPluginsListView = ((BaseFragment)(((ViewPagerAdapter) (viewPager.getAdapter())).getItem(viewPager.getCurrentItem()))).getListView();

        mPluginsListView = new ListView(this);

        // Setting the list adapter. We fill the adapter with filtered list
        // because that is the list we want to show. The initial one we
        // keep for future searches.
        PluginAdapter adapter = new PluginAdapter(this, mPluginsFiltered);
        if (adapter != null)
            Log.d("Ok", "NINJAAAAAAA !");
        if (((BaseFragment)(((ViewPagerAdapter) (viewPager.getAdapter())).getItem(viewPager.getCurrentItem()))) != null)
            Log.d("Ok", "NINJAAAAAAA ENCOOOOOOOOOORE !");

        mPluginsListView.setAdapter(adapter);

        // If the search bar was opened previously, open it on recreate.
        if (mSearchOpened) {
            openSearchBar(mSearchString);
        }

        //

    }

    private void setupViewPager(ViewPager viewPager) {
        ViewPagerAdapter adapter = new ViewPagerAdapter(getSupportFragmentManager());
        adapter.addFragment(new StoreNewAppsFragment(), "New apps");
        adapter.addFragment(new StoreTopAllTimesFragment(), "Better Of All Times");
        viewPager.setAdapter(adapter);
    }

    @Override
    public boolean onPrepareOptionsMenu(Menu menu) {
        mSearchAction = menu.findItem(R.id.action_search);
        return super.onPrepareOptionsMenu(menu);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.searchable_menu, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();
        if (id == R.id.action_search) {
            if (mSearchOpened) {
                closeSearchBar();
            } else {
                openSearchBar(mSearchString);
            }
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    @Override
    protected void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        outState.putParcelableArrayList("mPlugins", (ArrayList<Plugin>) mPlugins);
        outState.putParcelableArrayList("mPluginsFiltered", (ArrayList<Plugin>) mPluginsFiltered);
        outState.putBoolean("mSearchOpened", mSearchOpened);
        outState.putString("mSearchString", mSearchString);
    }

    private void openSearchBar(String queryText) {

        // Set custom view on action bar.
        ActionBar actionBar = getSupportActionBar();
        actionBar.setDisplayShowCustomEnabled(true);
        actionBar.setCustomView(R.layout.search_bar);

        // Search edit text field setup.
        mSearchEt = (EditText) actionBar.getCustomView()
                .findViewById(R.id.actionbarSearch);
        mSearchEt.addTextChangedListener(new SearchModificationHandler());
        mSearchEt.setText(queryText);
        mSearchEt.requestFocus();

        // Change search icon accordingly.
        mSearchAction.setIcon(mIconCloseSearch);
        mSearchOpened = true;

    }

    private void closeSearchBar() {

        // Remove custom view.
        getSupportActionBar().setDisplayShowCustomEnabled(false);

        // Change search icon accordingly.
        mSearchAction.setIcon(mIconOpenSearch);
        mSearchOpened = false;

    }

    public class SearchModificationHandler implements TextWatcher {

        @Override
        public void beforeTextChanged(CharSequence c, int i, int i2, int i3) {

        }

        @Override
        public void onTextChanged(CharSequence c, int i, int i2, int i3) {

        }

        @Override
        public void afterTextChanged(Editable editable) {
            mSearchString = mSearchEt.getText().toString();
            mPluginsFiltered = performSearch(mPlugins, mSearchString);
            ((PluginAdapter) (mPluginsListView.getAdapter())).update(mPluginsFiltered);
            Log.d("Sup", "oiuoiuoiuoiuoiuoiuoiuoiuoiu");
        }

        private List<Plugin> performSearch(List<Plugin> movies, String query) {

            // First we split the query so that we're able
            // to search word by word (in lower case).
            String[] queryByWords = query.toLowerCase().split("\\s+");

            // Empty list to fill with matches.
            List<Plugin> pluginsFiltered = new ArrayList<Plugin>();

            // Go through initial releases and perform search.
            for (Plugin plugin : mPlugins) {

                // Content to search through (in lower case).
                String content = (
                        String.valueOf(plugin.getmIcon()) + " " +
                                plugin.getmName() + " " +
                                plugin.getmDescription() + " " +
                                String.valueOf(plugin.getmRate())
                ).toLowerCase();

                for (String word : queryByWords) {

                    // There is a match only if all of the words are contained.
                    int numberOfMatches = queryByWords.length;

                    // All query words have to be contained,
                    // otherwise the release is filtered out.
                    if (content.contains(word)) {
                        numberOfMatches--;
                    } else {
                        break;
                    }

                    // They all match.
                    if (numberOfMatches == 0) {
                        pluginsFiltered.add(plugin);
                    }

                }

            }

            return pluginsFiltered;
        }
    }

}
