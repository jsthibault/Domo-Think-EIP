package com.example.guillaumemunsch.domothink.utils;

import android.util.Log;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by guillaumemunsch on 12/04/16.
 */
public class Utils {
    public static <T, U> List<T> transform(List<U> income, String property) {
        List<T> list = new ArrayList<T>();

        Log.d("Avant La Liste: ", "Go go go go go !" + income.size());
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
}
