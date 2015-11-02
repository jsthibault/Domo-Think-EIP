package eu.domothink.munsch.domo_think;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Button;
import android.widget.ListView;

import eu.domothink.munsch.adapters.SwitchListAdapter;

/**
 * Created by munsch on 16/10/2015.
 */
public class ConnectedObjectsActivity extends AppCompatActivity {

    Button add = null;
    ListView list = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.connected_objects_activity);

        String[] objs = new String[]{"Television", "Lampe salon", "Lampe chambre bébé", "Radiateur"};
        boolean[] states = new boolean[]{true, false, false, true};

        list = (ListView)findViewById(R.id.listView);

        list.setAdapter(new SwitchListAdapter(this, objs, states));
   }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.add_object, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.add) {
            Intent intent = new Intent(ConnectedObjectsActivity.this, SearchObjectsActivity.class);
            startActivity(intent);
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}
