package com.example.guillaumemunsch.domothink.http;

import com.example.guillaumemunsch.domothink.R;
import com.loopj.android.http.*;
/**
 * Created by guillaumemunsch on 07/05/16.
 */

public class RestAPI {
    private static final String BASE_URL = "http://10.0.3.2:8080/api/";

    private static AsyncHttpClient client = new AsyncHttpClient();

    public static void get(String url, RequestParams params, AsyncHttpResponseHandler responseHandler) {
        client.get(getAbsoluteUrl(url), params, responseHandler);
    }

    public static void post(String url, RequestParams params, AsyncHttpResponseHandler responseHandler) {
        client.post(getAbsoluteUrl(url), params, responseHandler);
    }

    public static void put(String url, RequestParams params, AsyncHttpResponseHandler responseHandler) {
        client.put(getAbsoluteUrl(url), params, responseHandler);
    }

    public static void delete(String url, RequestParams params, AsyncHttpResponseHandler responseHandler) {
        client.delete(getAbsoluteUrl(url), params, responseHandler);
    }

    private static String getAbsoluteUrl(String relativeUrl) {
        return BASE_URL + relativeUrl;
    }
}