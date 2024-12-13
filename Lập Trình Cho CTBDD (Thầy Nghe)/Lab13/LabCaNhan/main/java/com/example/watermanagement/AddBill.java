package com.example.watermanagement;

import androidx.appcompat.app.AppCompatActivity;

import android.nfc.Tag;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Adapter;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class AddBill extends AppCompatActivity {
    ImageButton iconBack,iconSave;
    EditText edtConsume, e;
    TextView txtAmount;
    Spinner spnMonth, spnYear;
    Button btnCalculate, btnSave;
    int[] consumes ={50,50,100,100,100,0};
    int [] price ={10484,10533,10786,20242,20503,20587};
    final int LEVEL = 6;
    ArrayAdapter<CharSequence> monthAdapter, yearAdapter;
    String mode = "";
    DBHelper db;
    int id;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_bill);
        iconBack = findViewById(R.id.iconBack);
        iconSave = findViewById(R.id.iconSave);
        edtConsume = findViewById(R.id.edtConsume);
        txtAmount = findViewById(R.id.txtAmount);
        spnMonth = findViewById(R.id.spnMonth);
        spnYear = findViewById(R.id.spnYear);
        btnCalculate = findViewById(R.id.btnCalculate);
        btnSave = findViewById(R.id.btnSave);

        setMonthSpinner();
        setYearSpinner();
        db = new DBHelper(this);

        Bundle extra = getIntent().getExtras();
        assert extra != null;
        mode = extra.getString("mode");
        assert mode != null;

        if(mode.equals("update")){
           // Toast.makeText(this, String.valueOf(extra.getInt("amount")), Toast.LENGTH_SHORT).show();
            id = extra.getInt("id");
            edtConsume.setText(String.valueOf(extra.getInt("consume")));
            txtAmount.setText(String.valueOf(extra.getInt("amount")));
            int pos = monthAdapter.getPosition(extra.getString("month"));
            spnMonth.setSelection(pos);

            pos = yearAdapter.getPosition(extra.getString("year"));
            spnYear.setSelection(pos);
        }


        iconBack.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });

        iconSave.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(AddBill.this, "Save",Toast.LENGTH_LONG).show();
            }
        });

        btnCalculate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                calculateAmount();
            }
        });
        btnSave.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String month = spnMonth.getSelectedItem().toString();
                String year = spnYear.getSelectedItem().toString();
                int consume =0;
                if(edtConsume.getText().toString().matches("")){
                    Toast.makeText(AddBill.this,"Please input the consume field.",Toast.LENGTH_LONG).show();
                    return;
                }
                else{
                    consume = Integer.parseInt(edtConsume.getText().toString());
                }
                int amount = calculateAmount();

                if(db.checkBill(month,year) || mode.equals("update")){
                    Bill bill = new Bill(month,year,consume,amount);

                    long result = 0;
                    if(mode.equals("update")){
                        Log.d("tag","update");
                        result = db.updateBill(id,bill);

                    }
                    else{
                        result = db.addNewBill(bill);
                    }
                    String msg = "";
                    if(result <=0 ){
                        msg = "Failed to insert new bill";

                    }
                    else {
                        msg = "Save a new bill successfully";
                        resetField();
                    }
                    Toast.makeText(AddBill.this,msg,Toast.LENGTH_LONG).show();
                }
                else {
                    Toast.makeText(AddBill.this,"Already a bill in application, please try again.",Toast.LENGTH_LONG).show();
                }
            }
        });



    }

    public void resetField(){
        txtAmount.setText("");
        edtConsume.setText("");
    }
    public int calculateAmount(){
        int totalAmount = 0;
        String month = spnMonth.getSelectedItem().toString();
        String year = spnYear.getSelectedItem().toString();
        int consume =0;
        if(edtConsume.getText().toString().matches("")){
            Toast.makeText(AddBill.this,"Please input the consume field.",Toast.LENGTH_LONG).show();
            return 0;
        }
        else{
            consume = Integer.parseInt(edtConsume.getText().toString());
        }
        int temp = consume;
        for( int i = 0 ;i< LEVEL -1;i++){
            if(temp > consumes[i]){
                totalAmount += consumes[i]*price[i];
                temp -= consumes[i];
            }
            else{
                totalAmount += temp*price[i];
                break;
            }
        }
        txtAmount.setText(String.valueOf(totalAmount + "đ"));
        return totalAmount;
    }

    public void setMonthSpinner(){
        monthAdapter = ArrayAdapter.createFromResource(this,R.array.months, android.R.layout.simple_spinner_item);
        monthAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spnMonth.setAdapter(monthAdapter);
        DateFormat df = new SimpleDateFormat("MMMM");
        Date date = new Date();
        String month = df.format(date);
        //Toast.makeText(AddBill.this,month, Toast.LENGTH_SHORT).show();
        int pos = monthAdapter.getPosition(month);
        spnMonth.setSelection(pos);

    }

    public void setYearSpinner(){
        yearAdapter = ArrayAdapter.createFromResource(this,R.array.years, android.R.layout.simple_spinner_item);
        yearAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spnYear.setAdapter(yearAdapter);
        DateFormat df = new SimpleDateFormat("yyyy");
        Date date = new Date();
        String year = df.format(date);
        //Toast.makeText(AddBill.this,month, Toast.LENGTH_SHORT).show();
        int pos = yearAdapter.getPosition(year);
        spnYear.setSelection(pos);
    }
}