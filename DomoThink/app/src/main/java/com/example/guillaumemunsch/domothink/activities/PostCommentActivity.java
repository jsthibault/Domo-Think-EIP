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
import android.widget.RatingBar;
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
 * Created by guillaumemunsch on 12/10/2016.
 */

public class PostCommentActivity extends AppCompatActivity {
    Context context = null;
    Button btn = null;
    EditText comment = null;
    RatingBar rate = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.post_comment_activity);
        context = this;
        btn = (Button)findViewById(R.id.validate);
        comment = (EditText)findViewById(R.id.comment);
        rate = (RatingBar)findViewById(R.id.rate);
        if (getIntent().hasExtra("idComment")) {
            String keyLoginHash = getIntent().getStringExtra("keyLoginHash");
            if (!keyLoginHash.equals(Utils.md5(Utils.getInfo(context, "userId") + Utils.getInfo(context, "password")))) {
                Toast.makeText(PostCommentActivity.this, getResources().getString(R.string.forbidden), Toast.LENGTH_LONG).show();
                finish();
            }
            rate.setRating(getIntent().getFloatExtra("rate", 0f));
            comment.setText(getIntent().getStringExtra("comment"));
        }
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                JSONObject param = new JSONObject();
                StringEntity stringEntity = null;
                try {
                    if (getIntent().hasExtra("idComment")) {
                        param.put("idComment", getIntent().getIntExtra("idComment", 0));
                    }
                    param.put("author", Utils.getInfo(context, "login"));
                    param.put("rate", rate.getRating());
                    param.put("comment", comment.getText().toString());
                    param.put("keyLoginHash", Utils.md5(Utils.getInfo(context, "userId") + Utils.getInfo(context, "password")));
                    stringEntity = new StringEntity(param.toString());
                }
                catch (Throwable ex)
                {
                    Log.d("Connection", ex.getMessage());
                }
                if (!getIntent().hasExtra("idComment")) {
                    RestAPI.postStore(PostCommentActivity.this, "/store/" + getIntent().getIntExtra("pluginId", 0) + "/comments/", stringEntity, new JsonHttpResponseHandler() {
                        @Override
                        public void onSuccess(int statusCode, Header[] headers, JSONObject response) {
                            try {
                                Toast.makeText(PostCommentActivity.this, "Posted", Toast.LENGTH_LONG).show();
                                finish();
                            } catch (Throwable ex) {
                                Toast.makeText(PostCommentActivity.this, "Fail", Toast.LENGTH_LONG).show();
                            }
                        }

                        @Override
                        public void onFailure(int statusCode, Header[] headers, Throwable throwable, JSONObject errorResponse) {
                            Toast.makeText(PostCommentActivity.this, throwable.getMessage(), Toast.LENGTH_LONG).show();
                        }
                    });
                } else {
                    RestAPI.putStore(PostCommentActivity.this, "/store/comments/", stringEntity, new JsonHttpResponseHandler() {
                        @Override
                        public void onSuccess(int statusCode, Header[] headers, JSONObject response) {
                            try {
                                Toast.makeText(PostCommentActivity.this, "Posted", Toast.LENGTH_LONG).show();
                                finish();
                            } catch (Throwable ex) {
                                Toast.makeText(PostCommentActivity.this, "Fail", Toast.LENGTH_LONG).show();
                            }
                        }

                        @Override
                        public void onFailure(int statusCode, Header[] headers, Throwable throwable, JSONObject errorResponse) {
                            Toast.makeText(PostCommentActivity.this, throwable.getMessage(), Toast.LENGTH_LONG).show();
                        }
                    });
                }
            }
        });
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.menu_connect, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();

        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}
