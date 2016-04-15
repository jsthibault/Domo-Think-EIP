package com.example.guillaumemunsch.domothink.fragments;

import android.app.Fragment;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;

import com.example.guillaumemunsch.domothink.R;

/**
 * Created by guillaumemunsch on 01/03/16.
 */

public class UpdateFragment extends Fragment {
    Button installButton = null;
    TextView text = null;

    public UpdateFragment(){}

    @Override
    public View onCreateView(final LayoutInflater inflater, final ViewGroup container,
                             Bundle savedInstanceState) {

        View rootView = inflater.inflate(R.layout.fragment_update, container, false);
        installButton = (Button)rootView.findViewById(R.id.updateInstallButton);
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