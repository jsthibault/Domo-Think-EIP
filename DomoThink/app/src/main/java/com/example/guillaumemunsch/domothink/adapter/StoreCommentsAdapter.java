package com.example.guillaumemunsch.domothink.adapter;

import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.RatingBar;
import android.widget.TextView;

import com.example.guillaumemunsch.domothink.R;
import com.example.guillaumemunsch.domothink.models.Comment;

import java.util.List;

/**
 * Created by guillaumemunsch on 12/10/2016.
 */

public class StoreCommentsAdapter extends RecyclerView.Adapter<StoreCommentsAdapter.MyViewHolder> {

    private List<Comment> commentList;

    public class MyViewHolder extends RecyclerView.ViewHolder {
        public ImageView icon;
        public TextView author, comment;
        public RatingBar rate;

        public MyViewHolder(View view) {
            super(view);
            icon = (ImageView) view.findViewById(R.id.commentUserIcon);
            author = (TextView) view.findViewById(R.id.commentUserName);
            comment = (TextView) view.findViewById(R.id.commentUserText);
            rate = (RatingBar) view.findViewById(R.id.commentUserRate);
        }
    }

    public StoreCommentsAdapter(List<Comment> commentList) {
        this.commentList = commentList;
    }

    @Override
    public MyViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.list_item_plugin_comments, parent, false);

        return new MyViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(MyViewHolder holder, int position) {
        Comment comment = commentList.get(position);
        //holder.icon.setImageIcon(plugin.getIcon());
        holder.author.setText(comment.getAuthor());
        holder.comment.setText(comment.getComment());
        holder.rate.setRating(comment.getRate());
    }

    @Override
    public int getItemCount() {
        return commentList.size();
    }
}
