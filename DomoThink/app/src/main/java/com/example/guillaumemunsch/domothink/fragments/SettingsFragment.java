package com.example.guillaumemunsch.domothink.fragments;

import android.app.Fragment;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Spinner;

import com.example.guillaumemunsch.domothink.R;

/**
 * Created by guillaumemunsch on 01/03/16.
 */
public class SettingsFragment extends Fragment {
    Spinner spinner = null;

    public SettingsFragment(){}

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        View rootView = inflater.inflate(R.layout.fragment_settings, container, false);
        String[] themes = getResources().getStringArray(R.array.themes);
        spinner = (Spinner)rootView.findViewById(R.id.themesSpinner);
        spinner.setAdapter(new ArrayAdapter<String>(this.getActivity(), R.layout.spinner_themes, themes));
        return rootView;
    }
}
