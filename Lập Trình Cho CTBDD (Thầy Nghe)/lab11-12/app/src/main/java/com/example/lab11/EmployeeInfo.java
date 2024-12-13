package com.example.lab11;

import android.os.Bundle;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

import java.lang.ref.Reference;

public class EmployeeInfo extends AppCompatActivity {
    TextView txtEName, txtEPhone, txtEAddress;
    FirebaseDatabase firebaseDatabase;
    DatabaseReference reference;
    EmployeeModal employeeInfo;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.employee_info);

        txtEName = findViewById(R.id.eName);
        txtEPhone = findViewById(R.id.ePhone);
        txtEAddress = findViewById(R.id.eAddress);

        firebaseDatabase = FirebaseDatabase.getInstance();
        reference = firebaseDatabase.getReference("EmployeeInfo");

        getData();

//        txtEName.setText(employeeInfo.getEmployeeName());
    }

    private void getData() {
        reference.addValueEventListener(new ValueEventListener() {
            @Override
            public void onDataChange(@NonNull DataSnapshot snapshot) {
                employeeInfo = snapshot.getValue(EmployeeModal.class);
                txtEName.setText("Employee Name: " + employeeInfo.getEmployeeName());
                txtEPhone.setText("Employee Phone number: " + employeeInfo.getEmployeePhoneNumber());
                txtEAddress.setText("Employee Address: " + employeeInfo.getEmployeeAddress());
            }

            @Override
            public void onCancelled(@NonNull DatabaseError error) {
                Toast.makeText(EmployeeInfo.this, "Fail to get data.", Toast.LENGTH_SHORT).show();
            }
        });
    }
}
