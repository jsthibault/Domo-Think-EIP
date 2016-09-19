package com.example.guillaumemunsch.domothink.utils;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.util.Log;

import com.example.guillaumemunsch.domothink.R;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by guillaumemunsch on 12/04/16.
 */
public class Utils {
    public static <T, U> List<T> transform(List<U> income, String property) {
        List<T> list = new ArrayList<T>();

        for (U obj : income) {
            try {
                Field f = obj.getClass().getDeclaredField(property);
                f.setAccessible(true);
                T adding = (T)(f.get(obj));
                list.add(adding);
            }
            catch (Throwable ex) {
                Log.d("Error in Utils: ", ex.getMessage());
            }
        }
        return list;
    }

    public static boolean confirm(Context c, String title, String msg) {
        final boolean confirmation = false;
        AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(c);

        alertDialogBuilder.setTitle(title);
        alertDialogBuilder.setMessage(msg).setCancelable(false)
                .setPositiveButton("Yes", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int id) {
                        //confirmation = false;
                        dialog.cancel();
                    }
                })
                .setNegativeButton("No", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int id) {

                        //confirmation = true;
            }
        });

        // create alert dialog
        AlertDialog alertDialog = alertDialogBuilder.create();

        // show it
        alertDialog.show();
        return confirmation;
    }

    public static boolean storeToken(Context c, String token) {
        SharedPreferences settings = PreferenceManager
                .getDefaultSharedPreferences(c);
        SharedPreferences.Editor editor = settings.edit();
        editor.putString("token", token);
        editor.commit();
        return true;
    }

    public static String getToken(Context c) {
        SharedPreferences settings = PreferenceManager.getDefaultSharedPreferences(c);
        return (settings.getString("token", ""));
    }

    public static boolean storeInfo(Context c, String info, String token) {
        SharedPreferences settings = PreferenceManager
                .getDefaultSharedPreferences(c);
        SharedPreferences.Editor editor = settings.edit();
        editor.putString(info, token);
        editor.commit();
        return true;
    }

    public static String getInfo(Context c, String info) {
        SharedPreferences settings = PreferenceManager.getDefaultSharedPreferences(c);
        return (settings.getString(info, ""));
    }
}
