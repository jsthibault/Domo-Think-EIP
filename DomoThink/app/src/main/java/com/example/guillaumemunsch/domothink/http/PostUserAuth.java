package com.example.guillaumemunsch.domothink.http;

import android.app.Fragment;
import android.os.AsyncTask;
import android.util.Log;

import com.example.guillaumemunsch.domothink.activities.ConnectActivity;
import com.example.guillaumemunsch.domothink.fragments.DirectivesFragment;

import java.util.List;

import io.swagger.client.api.DefaultApi;
import io.swagger.client.model.ConnectionInfos;
import io.swagger.client.model.Directive;

/**
 * Created by guillaumemunsch on 14/04/16.
 */
public class PostUserAuth  extends AsyncTask<String, Void, String> {
    private ConnectActivity context;
    String token;
    DefaultApi api = null;

    public PostUserAuth(ConnectActivity c) {
        context = (ConnectActivity)c;
    }

    @Override
    protected void onPreExecute() {
        super.onPreExecute();
        api = new DefaultApi();
        api.setBasePath("http://MBPdeGuillaume.lan:8080/api");
    }
    @Override
    protected String doInBackground(String... params) {

        try {
            ConnectionInfos co = new ConnectionInfos();
            co.setUsername(params[0]);
            co.setPassword(params[1]);
            token = api.userAuthPost(co);
        }
        catch (Throwable ex) {
            Log.d("Error: ", ex.getMessage());
        }
        return token;
    }

    @Override
    protected void onPostExecute(String result) {
        super.onPostExecute(result);
        context.setToken(result);
        context.tryConnection();
    }

}
