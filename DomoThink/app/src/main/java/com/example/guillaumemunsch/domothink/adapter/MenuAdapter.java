package com.example.guillaumemunsch.domothink.adapter;

import android.content.Context;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.activities.MainActivity;

/**
 * Created by guillaumemunsch on 03/12/15.
 */
public class MenuAdapter extends BaseAdapter {

    String [] result;
    Context context;
    int [] imageId;
    Class[] links;
    private static LayoutInflater inflater=null;
    public MenuAdapter(AppCompatActivity mainActivity, String[] labels, int[] images, Class[] btnLinks) {
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