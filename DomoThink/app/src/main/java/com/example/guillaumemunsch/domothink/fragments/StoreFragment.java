package com.example.guillaumemunsch.domothink.fragments;

import android.app.Fragment;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.design.widget.TabLayout;
import android.support.v4.view.ViewPager;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.ListView;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.activities.InfosObject;
import com.example.guillaumemunsch.domothink.activities.StoreActivity;
import com.example.guillaumemunsch.domothink.adapter.PluginAdapter;
import com.example.guillaumemunsch.domothink.adapter.ViewPagerAdapter;
import com.example.guillaumemunsch.domothink.models.Plugin;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by guillaumemunsch on 01/03/16.
 */

public class StoreFragment extends Fragment {
    ListView list = null;
    private TabLayout       tabLayout;
    private ViewPager       viewPager;
    private List<Plugin>    mPlugins;
    private List<Plugin>    mPluginsFiltered;
    private boolean         mSearchOpened;
    private String          mSearchString;
    private ListView        mPluginsListView;
    private Drawable        mIconOpenSearch;
    private Drawable        mIconCloseSearch;
    private EditText        mSearchEt;
    private MenuItem        mSearchAction;


    public StoreFragment(){}

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        View rootView = inflater.inflate(R.layout.fragment_store, container, false);
        startActivity(new Intent(getActivity(), StoreActivity.class));
        return rootView;
    }

}
