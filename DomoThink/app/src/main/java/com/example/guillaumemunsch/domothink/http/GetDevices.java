package com.example.guillaumemunsch.domothink.http;

import android.app.Fragment;
import android.os.AsyncTask;
import android.util.Log;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.fragments.ObjectsFragment;

import java.util.List;

import io.swagger.client.api.DefaultApi;
import io.swagger.client.model.Device;

/**
 * Created by guillaumemunsch on 12/04/16.
 */

public class GetDevices extends AsyncTask<Void, Void, List<Device>>
{
    private ObjectsFragment fragment;
    List<Device> list;
    DefaultApi api = null;

    public GetDevices(Fragment f) {
        fragment = (ObjectsFragment)f;
    }

    @Override
    protected void onPreExecute() {
        super.onPreExecute();
        api = new DefaultApi();
        api.setBasePath(fragment.getResources().getString(R.string.apiUrl));
    }
    @Override
    protected List<Device> doInBackground(Void... params) {

        try {
            list = api.deviceGet();
        }
        catch (Throwable ex) {
            Log.d("Error: ", ex.getMessage());
        }
        return list;
    }

    @Override
    protected void onPostExecute(List<Device> result) {
        super.onPostExecute(result);
        fragment.setList(list);
        fragment.loadContent();
    }

}
