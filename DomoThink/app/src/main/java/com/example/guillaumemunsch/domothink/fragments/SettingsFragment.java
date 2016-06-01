package com.example.guillaumemunsch.domothink.fragments;

import android.app.Fragment;
import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Spinner;
import android.widget.Button;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.activities.ChangePasswordActivity;

/**
 * Created by guillaumemunsch on 01/03/16.
 */
public class SettingsFragment extends Fragment {
    Spinner spinner = null;
    Button btn = null;

    public SettingsFragment(){}

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        View rootView = inflater.inflate(R.layout.fragment_settings, container, false);
        String[] themes = getResources().getStringArray(R.array.themes);
        spinner = (Spinner)rootView.findViewById(R.id.themesSpinner);
        spinner.setAdapter(new ArrayAdapter<String>(this.getActivity(), R.layout.spinner_themes, themes));

        btn = (Button)rootView.findViewById(R.id.change_password_button);
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(getActivity(), ChangePasswordActivity.class));
            }
        });
        return rootView;
    }
}
