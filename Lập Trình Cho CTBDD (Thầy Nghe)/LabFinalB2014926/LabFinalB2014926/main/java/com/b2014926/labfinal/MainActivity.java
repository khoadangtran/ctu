package com.b2014926.labfinal;

import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    private Spinner drinkSpinner;
    private EditText customerName;
    private EditText quantityInput;
    private Button orderButton;
    private TextView orderSummary;

    private SQLiteDatabase database;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        drinkSpinner = findViewById(R.id.drink_spinner);
        customerName = findViewById(R.id.customer_name);
        quantityInput = findViewById(R.id.quantity_input);
        orderButton = findViewById(R.id.order_button);
        orderSummary = findViewById(R.id.order_summary);

        // Khởi tạo cơ sở dữ liệu SQLite
        SQLiteOpenHelper dbHelper = new DatabaseHelper(this);
        database = dbHelper.getWritableDatabase();

        // Thiết lập Adapter cho Spinner
        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(this,
                R.array.drink_options, android.R.layout.simple_spinner_item);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        drinkSpinner.setAdapter(adapter);

        // Xử lý sự kiện khi nhấn nút Đặt hàng
        orderButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Lấy thông tin từ các trường nhập liệu
                String drink = drinkSpinner.getSelectedItem().toString();
                String name = customerName.getText().toString();
                int quantity = Integer.parseInt(quantityInput.getText().toString());

                // Tính tổng thành tiền
                double totalPrice = calculateTotalPrice(drink, quantity);

                // Lưu thông tin vào cơ sở dữ liệu SQLite
                saveOrder(name, drink, quantity, totalPrice);

                // Hiển thị thông tin đơn hàng
                orderSummary.setText("Đã đặt " + quantity + " " + drink + " cho " + name + ". Tổng thành tiền: " + totalPrice + " đ");
            }
        });
    }

    private double calculateTotalPrice(String drink, int quantity) {
        // Giả sử giá của mỗi loại thức uống được lưu trong một bảng giá
        double pricePerDrink;
        switch (drink) {
            case "Trà Sữa":
                pricePerDrink = 25000; // Giả sử giá trà là 25000 đồng
                break;
            case "Cà phê":
                pricePerDrink = 15000; // Giả sử giá cà phê là 15000 đồng
                break;
            case "Nước ngọt":
                pricePerDrink = 10000; // Giả sử giá nước ngọt là 10000 đồng
                break;
            default:
                pricePerDrink = 0;
        }
        return pricePerDrink * quantity;
    }

    private void saveOrder(String name, String drink, int quantity, double totalPrice) {
        // Thêm thông tin đơn hàng vào cơ sở dữ liệu
        // Ở đây bạn cần thực hiện các thao tác với cơ sở dữ liệu SQLite để lưu thông tin đơn hàng
        // Đây là nơi bạn cần thêm mã để thực hiện thao tác với cơ sở dữ liệu
        // Ví dụ:
        // database.execSQL("INSERT INTO orders (customer_name, drink, quantity, total_price) VALUES ('" + name + "', '" + drink + "', " + quantity + ", " + totalPrice + ")");

        // Thông báo cho người dùng biết rằng đơn hàng đã được đặt thành công
        Toast.makeText(this, "Đặt hàng thành công", Toast.LENGTH_SHORT).show();
    }
}
