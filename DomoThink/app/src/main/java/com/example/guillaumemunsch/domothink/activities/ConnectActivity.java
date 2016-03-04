package com.example.guillaumemunsch.domothink.activities;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.http.Api;
import com.example.guillaumemunsch.domothink.http.ServiceClasses;

import java.util.List;

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
                    Retrofit retrofit = new Retrofit.Builder()
                            .baseUrl(ServiceClasses.API_URL)
                            .addConverterFactory(GsonConverterFactory.create())
                            .build();
                    Api api = retrofit.create(Api.class);
                    Call<List<ServiceClasses.Contributor>> call = api.contributors("square", "retrofit");
                    call.enqueue(new Callback<List<ServiceClasses.Contributor>>() {
                        @Override
                        public void onResponse(Call<List<ServiceClasses.Contributor>> call, Response<List<ServiceClasses.Contributor>> response) {
                            if (response.code() == 200) {
                                if (response.body() != null) {
                                    for (ServiceClasses.Contributor con : response.body()) {
                                        Log.d("Contributor -> ", con.login + " - " + con.contributions);
                                    }
                                }
                            } else {
                                Log.d("Empty", "Response is empty");
                            }
                        }

                        @Override
                        public void onFailure(Call<List<ServiceClasses.Contributor>> call, Throwable t) {
                            Log.d("Error: ", "Request failed.");
                        }
                    });
                }
                catch (Throwable ex)
                {
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
