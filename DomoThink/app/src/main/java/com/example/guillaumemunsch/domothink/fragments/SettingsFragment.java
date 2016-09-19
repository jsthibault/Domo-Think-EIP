package com.example.guillaumemunsch.domothink.fragments;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Fragment;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.widget.ButtonBarLayout;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Spinner;
import android.widget.Button;
import android.widget.Toast;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.activities.ChangePasswordActivity;
import com.example.guillaumemunsch.domothink.activities.MainActivity;
import com.example.guillaumemunsch.domothink.http.RestAPI;
import com.example.guillaumemunsch.domothink.utils.Utils;
import com.loopj.android.http.JsonHttpResponseHandler;

import org.json.JSONObject;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.entity.StringEntity;

/**
 * Created by guillaumemunsch on 01/03/16.
 */
public class SettingsFragment extends Fragment {
    Context context = null;
    Spinner spinner = null;
    Button changePwdBtn = null, deleteAccBtn = null;
    AlertDialog.Builder myDialog = null;

    public SettingsFragment(){}

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.fragment_settings, container, false);
        context = this.getActivity();
        String[] themes = getResources().getStringArray(R.array.themes);
        spinner = (Spinner)rootView.findViewById(R.id.themesSpinner);
        spinner.setAdapter(new ArrayAdapter<String>(this.getActivity(), R.layout.spinner_themes, themes));

        changePwdBtn = (Button)rootView.findViewById(R.id.change_password_button);
        changePwdBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(getActivity(), ChangePasswordActivity.class));
            }
        });
        deleteAccBtn = (Button)rootView.findViewById(R.id.delete_account_button);
        deleteAccBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                new AlertDialog.Builder(context)
                        .setTitle(R.string.delete_account)
                        .setMessage(R.string.do_you_really_delete_account)
                        .setIcon(android.R.drawable.ic_dialog_alert)
                        .setPositiveButton(android.R.string.yes, new DialogInterface.OnClickListener() {

                            public void onClick(final DialogInterface dialog, int whichButton) {
                                JSONObject param = new JSONObject();
                                StringEntity stringEntity = null;
                                try {
                                    param.put("username", Utils.getInfo(context, "login"));
                                    param.put("password", Utils.getInfo(context, "password"));
                                    param.put("userId", Utils.getInfo(context, "userId"));
                                    stringEntity = new StringEntity(param.toString());
                                }
                                catch (Throwable ex)
                                {
                                    Log.d("OK", "OK");
                                }
                                RestAPI.post(context, "user/remove_account", stringEntity, new JsonHttpResponseHandler() {
                                    @Override
                                    public void onSuccess(int statusCode, Header[] headers, JSONObject response) {
                                        Toast.makeText(context, R.string.delete_account, Toast.LENGTH_SHORT).show();
                                        dialog.cancel();
                                        ((Activity) context).finish();
                                    }

                                    @Override
                                    public void onFailure(int statusCode, Header[] headers, Throwable throwable, JSONObject errorResponse) {
                                        Toast.makeText(context, R.string.no, Toast.LENGTH_SHORT).show();
                                    }
                                });
                            }})
                        .setNegativeButton(android.R.string.no, null).show();
            }
        });
        return rootView;
    }
}
