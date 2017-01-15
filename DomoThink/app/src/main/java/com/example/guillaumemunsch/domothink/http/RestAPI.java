package com.example.guillaumemunsch.domothink.http;

import android.content.Context;

import com.example.guillaumemunsch.domothink.R;
import com.loopj.android.http.*;
import com.example.guillaumemunsch.domothink.http.SingletonAsyncHttpClient;

import org.json.JSONObject;

import cz.msebera.android.httpclient.entity.StringEntity;

/**
 * Created by guillaumemunsch on 07/05/16.
 */

public class RestAPI {
//    private static final String BASE_URL = "http://89.156.153.245:4242/";
//    private static final String BASE_URL = "http://10.0.3.2:8082/";
//    private static final String BASE_URL_API_TEST = "http://10.0.3.2:8082/";
    private static final String BASE_URL = "http://86.70.224.226:4242/";
    private static final String BASE_URL_STORE = "http://api-domothink.timekube.net:8081/";

    private static AsyncHttpClient client = SingletonAsyncHttpClient.getInstance();

    public static void addHeader(String header, String value) {
        client.addHeader(header, value);
    }

    //CLIENT

    public static void get(String url, RequestParams params, AsyncHttpResponseHandler responseHandler) {
        client.get(getAbsoluteUrl(url), params, responseHandler);
    }

    public static void post(String url, RequestParams params, AsyncHttpResponseHandler responseHandler) {
        client.post(getAbsoluteUrl(url), params, responseHandler);
    }

    public static void post(Context context, String url, StringEntity entity, AsyncHttpResponseHandler responseHandler) {
        client.post(context, getAbsoluteUrl(url), entity, "application/json", responseHandler);
    }

    public static void put(String url, RequestParams params, AsyncHttpResponseHandler responseHandler) {
        client.put(getAbsoluteUrl(url), params, responseHandler);
    }

    public static void put(Context context, String url, StringEntity entity, AsyncHttpResponseHandler responseHandler) {
        client.put(context, getAbsoluteUrl(url), entity, "application/json", responseHandler);
    }

    public static void delete(String url, RequestParams params, AsyncHttpResponseHandler responseHandler) {
        client.delete(getAbsoluteUrl(url), params, responseHandler);
    }

    // STORE

    public static void getStore(String url, RequestParams params, AsyncHttpResponseHandler responseHandler) {
        client.get(getAbsoluteUrlStore(url), params, responseHandler);
    }

    public static void postStore(String url, RequestParams params, AsyncHttpResponseHandler responseHandler) {
        client.post(getAbsoluteUrlStore(url), params, responseHandler);
    }

    public static void postStore(Context context, String url, StringEntity entity, AsyncHttpResponseHandler responseHandler) {
        client.post(context, getAbsoluteUrlStore(url), entity, "application/json", responseHandler);
    }

    public static void putStore(String url, RequestParams params, AsyncHttpResponseHandler responseHandler) {
        client.put(getAbsoluteUrlStore(url), params, responseHandler);
    }

    public static void putStore(Context context, String url, StringEntity entity, AsyncHttpResponseHandler responseHandler) {
        client.put(context, getAbsoluteUrlStore(url), entity, "application/json", responseHandler);
    }

    public static void deleteStore(String url, RequestParams params, AsyncHttpResponseHandler responseHandler) {
        client.delete(getAbsoluteUrlStore(url), params, responseHandler);
    }

    private static String getAbsoluteUrl(String relativeUrl) {
        return BASE_URL + relativeUrl;
    }
    private static String getAbsoluteUrlStore(String relativeUrl) {
        return BASE_URL_STORE + relativeUrl;
    }
}