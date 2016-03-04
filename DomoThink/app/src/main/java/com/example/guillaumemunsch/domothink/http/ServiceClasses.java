package com.example.guillaumemunsch.domothink.http;

/**
 * Created by guillaumemunsch on 01/03/16.
 */
public final class ServiceClasses {
    public static final String API_URL = "https://api.github.com";

    public static class Contributor {
        public final String login;
        public final int contributions;

        public Contributor(String login, int contributions) {
            this.login = login;
            this.contributions = contributions;
        }
    }
}
