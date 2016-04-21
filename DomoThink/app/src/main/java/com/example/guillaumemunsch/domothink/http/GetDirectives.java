package com.example.guillaumemunsch.domothink.http;

import android.app.Fragment;
import android.os.AsyncTask;
import android.util.Log;

import com.example.guillaumemunsch.domothink.fragments.DirectivesFragment;
import com.example.guillaumemunsch.domothink.fragments.ObjectsFragment;

import java.util.List;

import io.swagger.client.api.DefaultApi;
import io.swagger.client.model.Device;
import io.swagger.client.model.Directive;

/**
 * Created by guillaumemunsch on 14/04/16.
 */
public class GetDirectives extends AsyncTask<Void, Void, List<Directive>> {
    private DirectivesFragment fragment;
    List<Directive> list;
    DefaultApi api = null;

    public GetDirectives(Fragment f) {
        fragment = (DirectivesFragment)f;
    }

    @Override
    protected void onPreExecute() {
        super.onPreExecute();
        api = new DefaultApi();
        api.setBasePath("http://MBPdeGuillaume.lan:8080/api");
    }
    @Override
    protected List<Directive> doInBackground(Void... params) {

        try {
            list = api.directiveGet();
        }
        catch (Throwable ex) {
            Log.d("Error: ", ex.getMessage());
        }
        return list;
    }

    @Override
    protected void onPostExecute(List<Directive> result) {
        super.onPostExecute(result);
        fragment.setList(list);
        fragment.loadContent();
    }


}
