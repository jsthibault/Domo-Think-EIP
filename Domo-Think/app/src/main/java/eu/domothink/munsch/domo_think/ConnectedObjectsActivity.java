package eu.domothink.munsch.domo_think;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;

import java.util.ArrayList;

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

        list = (ListView)findViewById(R.id.listView);

        String[] objs = new String[]{
                "Television",
                "Lampe salon",
                "Lampe chambre bébé",
                "Radiateur"};
        ArrayList<String> objects = new ArrayList<>();
        for (int i = 0; i < objs.length; i++){
            objects.add(objs[i]);
        }

        ArrayAdapter adapter = new ArrayAdapter<String>(this,
                android.R.layout.simple_list_item_multiple_choice,
                objects);
        list.setAdapter(adapter);
   }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.add_object, menu);
        /*add = (Button)findViewById(R.id.add);
        add.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(ConnectedObjectsActivity.this, SearchObjectsActivity.class);
                startActivity(intent);
            }
        });*/
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
