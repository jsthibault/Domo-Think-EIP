package com.example.guillaumemunsch.domothink.activities;

import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ListView;
import android.widget.Toast;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.adapter.SwitchListAdapter;
import com.example.guillaumemunsch.domothink.touch_listeners.SwipeDismissListViewTouchListener;

/**
 * Created by guillaumemunsch on 03/12/15.
 */
public class MyPluginsActivity extends AppCompatActivity {
    ListView list = null;
    Context context = this;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.my_plugins_activity);
        String[] plugins = new String[]{
                "Plugin #1",
                "Plugin #2",
                "Plugin #3",
                "Plugin #4"};
        Boolean[] states = new Boolean[]{
                true,
                true,
                false,
                false
        };
        list = (ListView)findViewById(R.id.myPluginsList);
        final SwitchListAdapter adapter = new SwitchListAdapter(this, plugins, states);
        list.setAdapter(adapter);
        list.setOnTouchListener(new SwipeDismissListViewTouchListener(
                list,
                new SwipeDismissListViewTouchListener.DismissCallbacks() {
                    @Override
                    public boolean canDismiss(int position) {
/*                        final boolean ret;
                        new AlertDialog.Builder(context)
                                .setTitle("Removing")
                                .setMessage("Do you really want to remove " + adapter.getItem(reverseSortedPositions[0]) + "?")
                                .setIcon(android.R.drawable.ic_dialog_alert)
                                .setPositiveButton(android.R.string.yes, new DialogInterface.OnClickListener() {

                                    public void onClick(DialogInterface dialog, int whichButton) {
                                        ret = true;
                                    }
                                })
                                .setNegativeButton(android.R.string.no, new DialogInterface.OnClickListener() {

                                    public void onClick(DialogInterface dialog, int whichButton) {
                                        ret = false;
                                    }
                                }).show();
                        return ret;*/
                        return true;
                    }

                    @Override
                    public void onDismiss(ListView listView, final int[] reverseSortedPositions) {
                        new AlertDialog.Builder(context)
                                .setTitle("Removing")
                                .setMessage("Do you really want to remove " + adapter.getItem(reverseSortedPositions[0]) + "?")
                                .setIcon(android.R.drawable.ic_dialog_alert)
                                .setPositiveButton(android.R.string.yes, new DialogInterface.OnClickListener() {

                                    public void onClick(DialogInterface dialog, int whichButton) {
                                        for (int position : reverseSortedPositions) {
                                            adapter.remove(position);
                                        }
                                        adapter.notifyDataSetChanged();
                                    }
                                })
                                .setNegativeButton(android.R.string.no, null).show();
                    }
                }));
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
