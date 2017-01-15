package com.example.guillaumemunsch.domothink.fragments;

import android.app.Fragment;
import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.http.RestAPI;
import com.example.guillaumemunsch.domothink.models.Version;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.loopj.android.http.JsonHttpResponseHandler;

import org.json.JSONObject;

import cz.msebera.android.httpclient.Header;

/**
 * Created by guillaumemunsch on 01/03/16.
 */

public class UpdateFragment extends Fragment {
    Context context = null;
    TextView text = null;
    Button installButton = null;
    Version currentVersion = null, serverVersion = null;

    public UpdateFragment(){}

    private void checkVersion() {
        if (currentVersion == null || serverVersion == null) {
            return;
        }
        if (!currentVersion.getVersion().equals(serverVersion.getVersion())) {
            Log.d("Need an update", currentVersion.getVersion() + serverVersion.getVersion());
            text.setText(getResources().getString(R.string.newUpdate));
            installButton.setText(getResources().getString(R.string.newUpdateButton));
            installButton.setBackgroundColor(getResources().getColor(R.color.domoBlue));
            installButton.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    RestAPI.post(context, "/update", null, new JsonHttpResponseHandler() {
                        @Override
                        public void onSuccess(int statusCode, Header[] headers, JSONObject response) {
                            getActivity().finish();
                        }

                        @Override
                        public void onFailure(int statusCode, Header[] headers, Throwable throwable, JSONObject errorResponse) {
                            Log.d("Error", "Maybe failed");
                        }
                    });
                }
            });
        } else {
            Log.d("No need for any update", "Update");
            text.setText(getResources().getString(R.string.noUpdate));
            installButton.setText(getResources().getString(R.string.noUpdateButton));
        }
    }

    @Override
    public View onCreateView(final LayoutInflater inflater, final ViewGroup container,
                             Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.fragment_update, container, false);
        context = getActivity().getApplicationContext();
        text = (TextView)rootView.findViewById(R.id.updateText);
        installButton = (Button)rootView.findViewById(R.id.updateInstallButton);
        RestAPI.get("/update", null, new JsonHttpResponseHandler() {
            @Override
            public void onSuccess(int statusCode, Header[] headers, JSONObject response) {
                currentVersion = new Gson().fromJson(response.toString(), new TypeToken<Version>() {
                }.getType());
                checkVersion();
            }

            @Override
            public void onFailure(int statusCode, Header[] headers, String responseString, Throwable throwable) {
                Log.d("Error", "Could not get current version");
            }
        });
        RestAPI.getStore("/update", null, new JsonHttpResponseHandler() {
            @Override
            public void onSuccess(int statusCode, Header[] headers, JSONObject response) {
                serverVersion = new Gson().fromJson(response.toString(), new TypeToken<Version>() {
                }.getType());
                checkVersion();
            }

            @Override
            public void onFailure(int statusCode, Header[] headers, String responseString, Throwable throwable) {
                Log.d("Error", "Could not get current version");
            }
        });
//        installButton.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View v) {
//                Fragment fragment = new UpdatingFragment();
//
//                FragmentManager fm = getActivity().getFragmentManager();
//                FragmentTransaction transaction = fm.beginTransaction();
//                transaction.replace(R.id.frame_container, fragment);
//                transaction.commit();
//            }
//        });
        return rootView;
    }
}