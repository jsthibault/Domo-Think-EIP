package eu.domothink.munsch.domo_think;

        import android.content.Intent;
        import android.support.v7.app.AppCompatActivity;
        import android.os.Bundle;
        import android.view.Menu;
        import android.view.MenuItem;
        import android.view.View;
        import android.widget.GridView;
        import android.widget.ImageView;

        import eu.domothink.munsch.adapters.CustomAdapter;

public class MainActivity extends AppCompatActivity {
    ImageView imageView = null;
    GridView gv = null;
    public static String [] menuItems = {"Objets", "Directives", "Ma DomoBox", "Store", "Mise à jour", "Paramètres"};
    public static int [] menuImages = {R.mipmap.mario, R.mipmap.mario, R.mipmap.mario, R.mipmap.mario, R.mipmap.mario, R.mipmap.mario};
    public static Class [] menuLinks = {ConnectedObjectsActivity.class, DirectivesActivity.class, MyDomoBoxActivity.class,
            StoreActivity.class, UpdateActivity.class, SettingsActivity.class};

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main_activity);

        gv = (GridView)findViewById(R.id.gridView);
        gv.setAdapter(new CustomAdapter(this, menuItems, menuImages, menuLinks));

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
