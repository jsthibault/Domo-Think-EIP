package com.example.guillaumemunsch.domothink.adapter;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.activities.InfosObject;
import com.example.guillaumemunsch.domothink.activities.MainActivity;
import com.example.guillaumemunsch.domothink.http.RestAPI;
import com.loopj.android.http.JsonHttpResponseHandler;

import org.json.JSONObject;

import java.util.List;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.entity.StringEntity;

/**
 * Created by guillaumemunsch on 03/12/15.
 */
public class SwitchListAdapter extends BaseAdapter {
    List<String> objs;
    List<Boolean> states;
    List<Integer> ids;
    String type;
    Context context;
    private static LayoutInflater inflater=null;
    public SwitchListAdapter(Activity mainActivity, List<String> mObjs, List<Boolean> mStates, List<Integer> mIds, String mType) {
        context = mainActivity;
        objs = mObjs;
        states = mStates;
        ids = mIds;
        type = mType;
        inflater = ( LayoutInflater )context.
                getSystemService(Context.LAYOUT_INFLATER_SERVICE);
    }
    @Override
    public int getCount() {
        // TODO Auto-generated method stub
        return objs.size();
    }

    @Override
    public String getItem(int position) {
        // TODO Auto-generated method stub
        return objs.get(position);
    }

    @Override
    public long getItemId(int position) {
        // TODO Auto-generated method stub
        return position;
    }

    public class Holder
    {
        TextView tv;
        Switch sw;
    }
    @Override
    public View getView(final int position, View convertView, ViewGroup parent) {
        // TODO Auto-generated method stub
        final Holder holder=new Holder();
        View rowView;
        rowView = inflater.inflate(R.layout.list_item_switch, null);
        holder.tv=(TextView) rowView.findViewById(R.id.switchObjectName);
        holder.sw=(Switch) rowView.findViewById(R.id.switchId);
        holder.tv.setText(objs.get(position));
        Log.d("Coucou ici", states.get(position) + " <<<<");
        holder.sw.setChecked(states.get(position));
        holder.sw.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                    JSONObject param = new JSONObject();
                    StringEntity stringEntity = null;
                    try {
                        if (type == "devices") {
                            param.put("idDevice", ids.get(position));
                        } else if (type == "plugins") {
                            param.put("idPlugin", ids.get(position));
                        }
                        param.put("status", !states.get(position));
                        stringEntity = new StringEntity(param.toString());
                    }
                    catch (Throwable ex)
                    {
                        Log.d("OK", "OK");
                    }
                    RestAPI.put(context, "/"+ type + "/changeStatus", stringEntity, new JsonHttpResponseHandler() {
                        @Override
                        public void onSuccess(int statusCode, Header[] headers, JSONObject response) {
                            Toast.makeText(context, R.string.success, Toast.LENGTH_LONG).show();
                        }

                        @Override
                        public void onFailure(int statusCode, Header[] headers, Throwable throwable, JSONObject errorResponse) {
                            Toast.makeText(context, R.string.success, Toast.LENGTH_LONG).show();
                        }
                    });
            }
        });
        return rowView;
    }

    public void remove(int position){
        objs.remove(position);
        states.remove(position);
    }

}
