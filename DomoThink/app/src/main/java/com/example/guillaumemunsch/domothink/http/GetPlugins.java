package com.example.guillaumemunsch.domothink.http;

import android.app.Fragment;
import android.os.AsyncTask;
import android.util.Log;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.fragments.DirectivesFragment;
import com.example.guillaumemunsch.domothink.fragments.MyPluginsFragment;
import com.example.guillaumemunsch.domothink.fragments.ObjectsFragment;

import java.util.List;

import io.swagger.client.api.DefaultApi;
import io.swagger.client.model.Device;
import io.swagger.client.model.Directive;
import io.swagger.client.model.Plugin;

/**
 * Created by guillaumemunsch on 14/04/16.
 */
public class GetPlugins extends AsyncTask<Void, Void, List<Plugin>> {
    private MyPluginsFragment fragment;
    List<Plugin> list;
    DefaultApi api = null;

    public GetPlugins(Fragment f) {
        fragment = (MyPluginsFragment)f;
    }

    @Override
    protected void onPreExecute() {
        super.onPreExecute();
        api = new DefaultApi();
        api.setBasePath(fragment.getResources().getString(R.string.apiUrl));
    }
    @Override
    protected List<Plugin> doInBackground(Void... params) {

        try {
            Log.d("LA -------->:", "IL SE PASSE QQCH ?");
            list = api.pluginGet();
        }
        catch (Throwable ex) {
            Log.d("Error: ", ex.getMessage());
        }
        return list;
    }

    @Override
    protected void onPostExecute(List<Plugin> result) {
        super.onPostExecute(result);
        fragment.setList(list);
        fragment.loadContent();
    }


}
