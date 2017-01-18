package com.example.guillaumemunsch.domothink.models;

import java.io.Serializable;

/**
 * Created by guillaumemunsch on 11/10/16.
 */
public class Comment implements Serializable {
    private int idComment;
    private String author;
    private float rate;
    private String comment;
    private String keyLoginHash;

    public int getIdComment() {
        return idComment;
    }

    public void setIdComment(int idComment) {
        this.idComment = idComment;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public float getRate() {
        return rate;
    }

    public void setRate(float rate) {
        this.rate = rate;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getKeyLoginHash() {
        return keyLoginHash;
    }

    public void setKeyLoginHash(String keyLoginHash) {
        this.keyLoginHash = keyLoginHash;
    }

    public Comment(int idComment, String author, float rate, String comment, String keyLoginHash) {
        this.idComment = idComment;
        this.author = author;
        this.rate = rate;
        this.comment = comment;
        this.keyLoginHash = keyLoginHash;
    }
}