package com.example.guillaumemunsch.domothink.activities;

import android.app.Fragment;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.fragments.UpToDateFragment;
import com.example.guillaumemunsch.domothink.http.Api;
import com.example.guillaumemunsch.domothink.http.ServiceClasses;

import java.util.List;

import io.swagger.client.api.DefaultApi;
import io.swagger.client.model.Device;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.GsonConverterFactory;
import retrofit2.Response;
import retrofit2.Retrofit;

/**
 * Created by guillaumemunsch on 03/12/15.
 */
public class ConnectActivity extends AppCompatActivity {
    Button connectButton = null;
    DefaultApi api = null;
    List<Device> list;

    private class AsyncCaller extends AsyncTask<Void, Void, List<Device>>
    {
        List<Device> list;
        DefaultApi api = null;

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            api = new DefaultApi();
            api.setBasePath("http://MBPdeGuillaume.lan:8080/api");

            //this method will be running on UI thread
        }
        @Override
        protected List<Device> doInBackground(Void... params) {

            try {
                list = api.deviceGet();
            }
            catch (Throwable ex) {
                Log.d("FAILFAILFAIL", "Dans la Async Task");
            }
            return null;
        }

        @Override
        protected void onPostExecute(List<Device> result) {
            super.onPostExecute(result);
            for (Device dev : list) {
                Log.d(dev.getName(), dev.getId().toString());
                Log.d(dev.getName(), dev.getDescription());
                Log.d(dev.getName(), (dev.getActivate() ? "True" : "False"));
            }
            //this method will be running on UI thread
        }

    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_connect);

        connectButton = (Button)findViewById(R.id.connection_button);
        final Intent intent = new Intent(ConnectActivity.this, MainActivity.class);
        connectButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                try {
                    AsyncCaller call = new AsyncCaller();
                    Log.d("PRE-EXECUTE", "RERTYUZERTYUZERTYZERTY");
                    call.execute();
                    Log.d("POST-EXECUTE", "RERTYUZERTYUZERTYZERTY");
                }
                catch (Exception ex)
                {
                    Log.d("EXCEPTIONEXCEPTION", "RERTYUZERTYUZERTYZERTY");
                    Log.d("Error: ", ex.toString());
                    Log.d("Error: ", ex.getMessage());
                }
                startActivity(intent);
            }
        });
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_connect, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}
