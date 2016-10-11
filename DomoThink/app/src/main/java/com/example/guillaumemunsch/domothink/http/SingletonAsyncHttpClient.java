package com.example.guillaumemunsch.domothink.http;

import com.loopj.android.http.AsyncHttpClient;

/**
 * Created by guillaumemunsch on 10/10/16.
 */
public class SingletonAsyncHttpClient extends AsyncHttpClient {
    private static SingletonAsyncHttpClient singleton = new SingletonAsyncHttpClient( );

    private SingletonAsyncHttpClient() {}

    public static SingletonAsyncHttpClient getInstance( ) {
        return singleton;
    }
}
