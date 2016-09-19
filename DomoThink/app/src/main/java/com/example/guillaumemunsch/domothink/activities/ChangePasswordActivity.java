package com.example.guillaumemunsch.domothink.activities;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.http.RestAPI;
import com.example.guillaumemunsch.domothink.utils.Utils;
import com.loopj.android.http.JsonHttpResponseHandler;

import org.json.JSONObject;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.entity.StringEntity;

/**
 * Created by guillaumemunsch on 01/06/16.
 */
public class ChangePasswordActivity extends AppCompatActivity {
    EditText oldPassword, newPassword, confirmPassword;
    Button btn = null;
    Context context = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        context = this;
        setContentView(R.layout.change_password_activity);
        oldPassword = (EditText)findViewById(R.id.old_password);
        newPassword = (EditText)findViewById(R.id.new_password);
        confirmPassword = (EditText)findViewById(R.id.new_password_confirm);
        btn = (Button)findViewById(R.id.change_password_button);
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                JSONObject param = new JSONObject();
                StringEntity stringEntity = null;
                try {
                    param.put("username", Utils.getInfo(context, "login"));
                    param.put("userId", Utils.getInfo(context, "userId"));
                    param.put("oldPassword", oldPassword.getText().toString());
                    param.put("newPassword", newPassword.getText().toString());
                    param.put("confirmPassword", confirmPassword.getText().toString());
                    if (!newPassword.getText().toString().equals(confirmPassword.getText().toString())) {
                        Toast.makeText(context, R.string.new_confirm_password_differ, Toast.LENGTH_LONG).show();
                        throw new Exception("New and Confirm differ");
                    }
                    if (oldPassword.getText().toString().equals(newPassword.getText().toString())) {
                        Toast.makeText(context, R.string.old_new_password_differ, Toast.LENGTH_LONG).show();
                        throw new Exception("New and Old are the same");
                    }
                    if (Utils.getInfo(context, "password").toString().equals(newPassword.getText().toString())) {
                        Toast.makeText(context, R.string.already_current_password, Toast.LENGTH_LONG).show();
                        throw new Exception("Already current password");
                    }
                    stringEntity = new StringEntity(param.toString());
                    RestAPI.post(ChangePasswordActivity.this, "user/change_password", stringEntity, new JsonHttpResponseHandler() {
                        @Override
                        public void onSuccess(int statusCode, Header[] headers, JSONObject response) {
                            Toast.makeText(ChangePasswordActivity.this, R.string.password_changed, Toast.LENGTH_LONG).show();
                            finish();
                        }

                        @Override
                        public void onFailure(int statusCode, Header[] headers, Throwable throwable, JSONObject errorResponse) {
                            Toast.makeText(ChangePasswordActivity.this, R.string.no, Toast.LENGTH_LONG).show();
                            Log.d("Change Password: ", "" + statusCode);
                            finish();
                        }
                    });
                }
                catch (Throwable ex)
                {
                    Log.d("ChangePassword", ex.getMessage());
                }
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
