package com.example.guillaumemunsch.domothink.activities;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.example.guillaumemunsch.domothink.http.RestAPI;
import com.loopj.android.http.*;

import com.example.guillaumemunsch.domothink.R;

import org.json.*;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.entity.StringEntity;

/**
 * Created by guillaumemunsch on 03/12/15.
 */
public class ConnectActivity extends AppCompatActivity {
    Context context;
    Button connectButton = null;
    Button forgottenPassword = null;
    String token = null;
    EditText userInput, passwordInput;

    public void setToken(String t) {
        token = t;
    }

    public void tryConnection(){
        try {
            if (token.equals("Error"))
                Toast.makeText(this, "Wrong username/password", Toast.LENGTH_LONG).show();
            else
                startActivity(new Intent(ConnectActivity.this, MainActivity.class));
        }
        catch (NullPointerException ex)
        {
            throw ex;
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_connect);
        context = this;
        userInput = (EditText)findViewById(R.id.user);
        passwordInput = (EditText)findViewById(R.id.password);
        connectButton = (Button)findViewById(R.id.connection_button);
        connectButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                JSONObject param = new JSONObject();
                StringEntity stringEntity = null;
                try {
                    param.put("login", userInput.getText().toString());
                    param.put("password", passwordInput.getText().toString());
                    stringEntity = new StringEntity(param.toString());
                }
                catch (Throwable ex)
                {
                    Log.d("OK", "OK");
                }
                RestAPI.post(ConnectActivity.this, "user/connect", stringEntity, new JsonHttpResponseHandler() {
                    @Override
                    public void onSuccess(int statusCode, Header[] headers, JSONObject response) {
                        try {
                            token = response.getString("token");
                            startActivity(new Intent(ConnectActivity.this, MainActivity.class));
                        } catch (Throwable ex) {
                            Toast.makeText(ConnectActivity.this, "Wrong username/password", Toast.LENGTH_LONG).show();
                        }
                    }

                    @Override
                    public void onFailure(int statusCode, Header[] headers, String responseString, Throwable throwable) {
                        Log.d("Connexion: ", "" + statusCode);
                    }
                });
            }
        });
        forgottenPassword = (Button)findViewById(R.id.forgotten_password_button);
        forgottenPassword.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(ConnectActivity.this, ForgottenPassword.class));
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
