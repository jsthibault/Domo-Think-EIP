package eu.domothink.munsch.domo_think;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;

import java.util.ArrayList;

import eu.domothink.munsch.adapters.EditDeleteAdapter;

/**
 * Created by munsch on 22/10/2015.
 */
public class DirectivesActivity extends AppCompatActivity {
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

        EditDeleteAdapter adapter = new EditDeleteAdapter(this, objs);
        mList.setAdapter(adapter);

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
