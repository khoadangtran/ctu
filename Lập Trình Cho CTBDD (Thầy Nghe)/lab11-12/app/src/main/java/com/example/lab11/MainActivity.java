package com.example.lab11;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.google.firebase.Firebase;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

public class MainActivity extends AppCompatActivity {

    EditText eName, ePhone, eAddress;
    Button save_btn, read_btn;
    String employeeName, employeePhone, employeeAddress;
    FirebaseDatabase rootNode;
    DatabaseReference reference;
    EmployeeModal employeeModal;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        eName = findViewById(R.id.txt_eName);
        ePhone = findViewById(R.id.txt_ePhone);
        eAddress = findViewById(R.id.txt_eAddress);
        save_btn = findViewById(R.id.btn_save);
        read_btn = findViewById(R.id.btn_read);

        employeeName = String.valueOf(eName.getText());
        employeePhone = String.valueOf(ePhone.getText());
        employeeAddress = String.valueOf(eAddress.getText());

        rootNode = FirebaseDatabase.getInstance();
        reference = rootNode.getReference("EmployeeInfo");

        save_btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                employeeName = String.valueOf(eName.getText());
                employeePhone = String.valueOf(ePhone.getText());
                employeeAddress = String.valueOf(eAddress.getText());

                if (TextUtils.isEmpty(employeeName) && TextUtils.isEmpty(employeePhone) && TextUtils.isEmpty(employeeAddress)) {
                    Toast.makeText(MainActivity.this, "Please add some data.", Toast.LENGTH_SHORT).show();
                } else {
                    addDatatoFirebase(employeeName, employeePhone, employeeAddress);
                }
                Toast.makeText(MainActivity.this, "Added the value", Toast.LENGTH_SHORT).show();
            }
        });

        read_btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, EmployeeInfo.class);
                startActivity(intent);
            }
        });
    }

    private void addDatatoFirebase(String employeeName, String employeePhone, String employeeAddress) {
        employeeModal = new EmployeeModal(employeeName, employeePhone, employeeAddress);
        reference.addValueEventListener(new ValueEventListener() {
            @Override
            public void onDataChange(@NonNull DataSnapshot snapshot) {
                reference.setValue(employeeModal);
                Toast.makeText(MainActivity.this, "Data has added", Toast.LENGTH_SHORT).show();
            }
            @Override
            public void onCancelled(@NonNull DatabaseError error) {
                Toast.makeText(MainActivity.this, "Fail to add data " + error, Toast.LENGTH_SHORT).show();
            }
        });
    }

}
