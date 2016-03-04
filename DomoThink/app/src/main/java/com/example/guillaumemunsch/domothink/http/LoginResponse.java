package com.example.guillaumemunsch.domothink.http;

/**
 * Created by guillaumemunsch on 01/03/16.
 */
public class LoginResponse {
    private String token;

    public LoginResponse(String token) {
        this.token = token;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }
}
