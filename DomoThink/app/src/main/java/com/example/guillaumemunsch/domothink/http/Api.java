package com.example.guillaumemunsch.domothink.http;

import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.http.Field;
import retrofit2.http.GET;
import retrofit2.http.POST;
import retrofit2.http.Path;

/**
 * Created by guillaumemunsch on 01/03/16.
 */
public interface Api {
    @GET("/repos/{owner}/{repo}/contributors")
    Call<List<ServiceClasses.Contributor>> contributors(@Path("owner") String owner, @Path("repo") String repo);

    @POST("/user/connect")
    Call<LoginResponse> login(@Field("username") String username, @Field("password") String password);
}
