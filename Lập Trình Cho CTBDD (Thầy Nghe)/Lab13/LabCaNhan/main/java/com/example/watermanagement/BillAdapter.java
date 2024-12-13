package com.example.watermanagement;


import static androidx.constraintlayout.helper.widget.MotionEffect.TAG;

import android.content.Context;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.util.Log;
import android.view.ContextMenu;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;

public class BillAdapter extends RecyclerView.Adapter<BillAdapter.ViewHolder>{

    private ArrayList<Bill> billList;
    private Context context;
    private int position;
    public BillAdapter(ArrayList<Bill> list, Context context){
        this.billList = list;
        this.context = context;
    }
    public int getPosition(){
        return position;
    }
    public void setPosition(int position){
        this.position = position;
    }
    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType){
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.bill_item,parent,false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull ViewHolder holder, int position){
        Bill bill = billList.get(position);
        //Toast.makeText(context,  bill.getAmount(), Toast.LENGTH_SHORT).show();
        holder.month.setText(bill.getMonth());
        holder.year.setText(bill.getYear());
        holder.consume.setText(String.valueOf(bill.getConsume()));
        holder.totalAmount.setText(String.valueOf(bill.getAmount()));

        holder.itemView.setOnLongClickListener(new View.OnLongClickListener() {
            @Override
            public boolean onLongClick(View v) {
                setPosition(holder.getLayoutPosition());
                return false;
            }
        });

    }
    @Override
    public int getItemCount(){
        return billList.size();
    }

    @Override
    public void onViewRecycled(ViewHolder holder) {
        holder.itemView.setOnLongClickListener(null);
        super.onViewRecycled(holder);
    }
    public class ViewHolder extends RecyclerView.ViewHolder implements View.OnCreateContextMenuListener {
        final private TextView month, year, consume,totalAmount;
        public ViewHolder(@NonNull View itemView){
            super(itemView);
            month = itemView.findViewById(R.id.txtMonth);
            year = itemView.findViewById(R.id.txtYear);
            consume = itemView.findViewById(R.id.txtConsume);
            totalAmount = itemView.findViewById(R.id.txtTotalAmount);
            itemView.setOnCreateContextMenuListener(this);
        }

        @Override
        public void onCreateContextMenu(ContextMenu menu, View v, ContextMenu.ContextMenuInfo info){

            menu.setHeaderTitle("Select action");
            menu.add(Menu.NONE,R.id.menuDelete,Menu.NONE,"Delete");
//                    .setOnMenuItemClickListener(new MenuItem.OnMenuItemClickListener() {
//                @Override
//                public boolean onMenuItemClick(@NonNull MenuItem item) {
//                    return false;
//                }
//            });
            menu.add(Menu.NONE,R.id.menuUpdate,Menu.NONE,"Update");

        }



    }
}
