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
import android.widget.EditText;
import android.widget.Toast;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.fragments.UpToDateFragment;
import com.example.guillaumemunsch.domothink.http.Api;
import com.example.guillaumemunsch.domothink.http.PostUserAuth;
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
    DefaultApi api = new DefaultApi();
    String token = null;
    EditText userInput, passwordInput;

    public void setToken(String t) {
        token = t;
    }

    public void tryConnection(){
        Log.d("TOKEN", "[" + token + "]");
        if (token.equals("Error"))
            Toast.makeText(this, "Wrong username/password", Toast.LENGTH_LONG).show();
        else
            startActivity(new Intent(ConnectActivity.this, MainActivity.class));
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_connect);
        userInput = (EditText)findViewById(R.id.user);
        passwordInput = (EditText)findViewById(R.id.password);
        connectButton = (Button)findViewById(R.id.connection_button);
        connectButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                new PostUserAuth(ConnectActivity.this).execute(userInput.getText().toString(), passwordInput.getText().toString());
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
