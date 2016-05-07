package com.example.guillaumemunsch.domothink.activities;

import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.v7.app.AppCompatActivity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ListView;

import com.example.guillaumemunsch.domothink.R;

/**
 * Created by guillaumemunsch on 03/12/15.
 */
public class DirectivesActivity extends AppCompatActivity {
    FloatingActionButton add = null;
    ListView mList = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.directives_activity);
        mList = (ListView)findViewById(R.id.directivesList);
        String[] objs = new String[]{
                "Directive #1",
                "Directive #2",
                "Directive #3",
                "Directive #4"};
/*        final EditAdapter adapter = new EditAdapter(this, objs);
        mList.setAdapter(adapter);
        mList.setOnTouchListener(new SwipeDismissListViewTouchListener(
                mList,
                new SwipeDismissListViewTouchListener.DismissCallbacks() {
                    @Override
                    public boolean canDismiss(int position) {
                        return true;
                    }

                    @Override
                    public void onDismiss(ListView listView, int[] reverseSortedPositions) {
                        for (int position : reverseSortedPositions) {
                            adapter.remove(position);
                        }
                        adapter.notifyDataSetChanged();
                    }
                }));*/
        add = (FloatingActionButton)findViewById(R.id.addDirectiveButton);
        add.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(DirectivesActivity.this, CreateUpdateDirectiveActivity.class));
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
