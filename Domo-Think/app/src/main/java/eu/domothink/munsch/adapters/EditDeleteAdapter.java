package eu.domothink.munsch.adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.CheckBox;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import eu.domothink.munsch.domo_think.ConnectedObjectsActivity;
import eu.domothink.munsch.domo_think.DirectivesActivity;
import eu.domothink.munsch.domo_think.R;

/**
 * Created by munsch on 26/10/2015.
 */
public class EditDeleteAdapter extends BaseAdapter {
    String [] objs;
    Context context;
    private static LayoutInflater inflater=null;
    public EditDeleteAdapter(DirectivesActivity mainActivity, String[] mObjs) {
        objs = mObjs;
        context = mainActivity;
        inflater = ( LayoutInflater )context.
                getSystemService(Context.LAYOUT_INFLATER_SERVICE);
    }
    @Override
    public int getCount() {
        // TODO Auto-generated method stub
        return objs.length;
    }

    @Override
    public Object getItem(int position) {
        // TODO Auto-generated method stub
        return position;
    }

    @Override
    public long getItemId(int position) {
        // TODO Auto-generated method stub
        return position;
    }

    public class Holder
    {
        TextView tv;
        CheckBox sw;
    }
    @Override
    public View getView(final int position, View convertView, ViewGroup parent) {
        // TODO Auto-generated method stub
        final Holder holder=new Holder();
        View rowView;
        rowView = inflater.inflate(R.layout.list_item_edit_delete, null);
        holder.tv=(TextView) rowView.findViewById(R.id.editDeleteObjectName);
        //holder.sw=(Switch) rowView.findViewById(R.id.switchId);
        holder.tv.setText(objs[position]);
        //holder.sw.setChecked(states[position]);
        rowView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // TODO Auto-generated method stub
                Toast.makeText(context, "You Clicked " + objs[position], Toast.LENGTH_LONG).show();
                holder.sw.setChecked(!holder.sw.isChecked());
            }
        });
        return rowView;
    }
}
