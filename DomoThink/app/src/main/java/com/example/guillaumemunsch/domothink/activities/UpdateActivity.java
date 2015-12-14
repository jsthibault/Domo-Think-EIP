package com.example.guillaumemunsch.domothink.activities;

import android.content.Intent;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.support.v7.app.AppCompatActivity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.adapter.CheckboxListAdapter;

/**
 * Created by guillaumemunsch on 03/12/15.
 */
public class UpdateActivity extends AppCompatActivity {
    Button installButton = null;
    TextView text = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.update_activity);
        installButton = (Button)findViewById(R.id.updateInstallButton);
        installButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                setContentView(R.layout.update_installating_activity);
                text = (TextView)findViewById(R.id.updateInstallText);
                new CountDownTimer(3000, 1000) {

                    public void onTick(long ms) {
                        text.setText("Installation en cours: " + ms / 1000);
                    }

                    public void onFinish() {
                        text.setText("done!");
                        setContentView(R.layout.update_uptodate_activity);
                    }
                }.start();

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
