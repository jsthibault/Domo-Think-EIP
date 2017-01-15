package com.example.guillaumemunsch.domothink.activities;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.inputmethod.EditorInfo;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.http.RestAPI;
import com.loopj.android.http.JsonHttpResponseHandler;

import org.json.JSONObject;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.entity.StringEntity;

/**
 * Created by guillaumemunsch on 01/06/16.
 */

public class CreateAccountActivity extends AppCompatActivity {
    Button btn = null;
    EditText userInput, passwordInput, confirmInput, boxKeyInput;

    private void tryCreateAccount() {
        JSONObject param = new JSONObject();
        StringEntity stringEntity = null;
        try {
            param.put("login", userInput.getText().toString());
            param.put("password", passwordInput.getText().toString());
            param.put("confirmPassword", confirmInput.getText().toString());
            param.put("boxKey", boxKeyInput.getText().toString());
            stringEntity = new StringEntity(param.toString());
        }
        catch (Throwable ex)
        {
            Log.d("OK", "OK");
        }
        RestAPI.post(CreateAccountActivity.this, "/create_account", stringEntity, new JsonHttpResponseHandler() {
            @Override
            public void onSuccess(int statusCode, Header[] headers, JSONObject response) {
                Toast.makeText(CreateAccountActivity.this, R.string.create_account, Toast.LENGTH_LONG).show();
                finish();
            }

            @Override
            public void onFailure(int statusCode, Header[] headers, Throwable throwable, JSONObject errorResponse) {
                Toast.makeText(CreateAccountActivity.this, R.string.unable_create_account, Toast.LENGTH_LONG).show();
                Log.d("Create account: ", "" + statusCode);
                finish();
            }
        });
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.create_account_activity);
        userInput = (EditText)findViewById(R.id.username);
        passwordInput = (EditText)findViewById(R.id.password);
        confirmInput = (EditText)findViewById(R.id.confirm);
        boxKeyInput = (EditText)findViewById(R.id.box_key);
        boxKeyInput.setOnEditorActionListener(new TextView.OnEditorActionListener() {
            public boolean onEditorAction(TextView v, int actionId, KeyEvent event) {
                if ((event != null && (event.getKeyCode() == KeyEvent.KEYCODE_ENTER)) || (actionId == EditorInfo.IME_ACTION_DONE)) {
                    tryCreateAccount();
                }
                return false;
            }
        });
        btn = (Button)findViewById(R.id.validate);
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                tryCreateAccount();
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
