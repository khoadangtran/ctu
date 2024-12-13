package com.example.watermanagement;

import static androidx.constraintlayout.helper.widget.MotionEffect.TAG;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.MenuItem;
import android.view.View;
import android.view.accessibility.AccessibilityManager;
import android.widget.ImageButton;
import android.widget.TextView;
import android.widget.Toast;

import java.time.temporal.ValueRange;
import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {

    ImageButton iconRefresh, iconAdd;
    RecyclerView rclBills;
    DBHelper db;
    ArrayList<Bill> billList;
    BillAdapter billAdapter;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        iconAdd = findViewById(R.id.iconSave);
        iconRefresh = findViewById(R.id.iconRefresh);
        rclBills = findViewById(R.id.rclBills);
        db = new DBHelper(this);
        iconRefresh.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                reloadBill();
            }
        });
        iconAdd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this,AddBill.class);
                intent.putExtra("mode","insert");
                startActivity(intent);

            }
        });

        reloadBill();

        registerForContextMenu(rclBills);

    }
    @Override
    public boolean onContextItemSelected(MenuItem item) {
        int position = -1;
        try {
            position = billAdapter.getPosition();
        } catch (Exception e) {
            Log.d(TAG, e.getLocalizedMessage(), e);
            return super.onContextItemSelected(item);
        }
        if(item.getItemId() == R.id.menuDelete){
            int id = billList.get(position).getId();
            db.deleteBillById(id);
            reloadBill();
          //  Toast.makeText(this, String.valueOf(billList.get(position).getId()), Toast.LENGTH_SHORT).show();
        }else{
            Bill bill = billList.get(position);
            Intent intent = new Intent(MainActivity.this,AddBill.class);
            intent.putExtra("mode","update");
            intent.putExtra("id",bill.getId());
            intent.putExtra("month",bill.getMonth());
            intent.putExtra("year",bill.getYear());
            intent.putExtra("consume",bill.getConsume());
            intent.putExtra("amount",bill.getAmount());
            startActivity(intent);
        }
        return super.onContextItemSelected(item);
    }
    public void reloadBill(){
        billList = db.getAllBills();
        billAdapter = new BillAdapter(billList,MainActivity.this);
        LinearLayoutManager linearLayoutManager = new LinearLayoutManager(this,LinearLayoutManager.VERTICAL,false);
        rclBills.setLayoutManager(linearLayoutManager);
        rclBills.setAdapter(billAdapter);
    }
}