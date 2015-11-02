package eu.domothink.munsch.adapters;

import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import eu.domothink.munsch.domo_think.MainActivity;
import eu.domothink.munsch.domo_think.R;

/**
 * Created by munsch on 22/10/2015.
 */
public class MenuAdapter extends BaseAdapter {

    String [] result;
    Context context;
    int [] imageId;
    Class[] links;
    private static LayoutInflater inflater=null;
    public MenuAdapter(MainActivity mainActivity, String[] labels, int[] images, Class[] btnLinks) {
        // TODO Auto-generated constructor stub
        result=labels;
        context=mainActivity;
        imageId=images;
        links = btnLinks;
        inflater = ( LayoutInflater )context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
    }

    @Override
    public int getCount() {
        // TODO Auto-generated method stub
        return result.length;
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
        ImageView img;
    }
    @Override
    public View getView(final int position, View convertView, ViewGroup parent) {
        // TODO Auto-generated method stub
        Holder holder=new Holder();
        View rowView;

        rowView = inflater.inflate(R.layout.grid_item_menu, null);
        holder.tv=(TextView) rowView.findViewById(R.id.itemText);
        holder.img=(ImageView) rowView.findViewById(R.id.itemImage);

        holder.tv.setText(result[position]);
        holder.img.setImageResource(imageId[position]);

        final Intent intent = new Intent(context, links[position]);
        rowView.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                // TODO Auto-generated method stub
                context.startActivity(intent);
            }
        });

        return rowView;
    }

}