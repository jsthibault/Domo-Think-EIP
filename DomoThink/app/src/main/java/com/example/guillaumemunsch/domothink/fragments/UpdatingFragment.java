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
public class UpdatingFragment extends Fragment{
    Button installButton = null;
    TextView text = null;

    public UpdatingFragment(){}

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        View rootView = inflater.inflate(R.layout.fragment_updating, container, false);
//        text = (TextView)rootView.findViewById(R.id.updateInstallText);
//        new CountDownTimer(3000, 1000) {
//
//            public void onTick(long ms) {
//                text.setText("Installation en cours: " + ms / 1000);
//            }
//
//            public void onFinish() {
//                text.setText("done!");
//                Fragment fragment = new UpToDateFragment();
//
//                FragmentManager fm = getActivity().getFragmentManager();
//                FragmentTransaction transaction = fm.beginTransaction();
//                transaction.replace(R.id.frame_container, fragment);
//                transaction.commit();
//            }
//        }.start();

        return rootView;
    }
}
