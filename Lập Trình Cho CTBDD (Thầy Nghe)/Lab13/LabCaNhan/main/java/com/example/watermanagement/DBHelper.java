package com.example.watermanagement;


import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;
import android.widget.Toast;

import java.util.ArrayList;

public class DBHelper extends SQLiteOpenHelper {
    private static final String DB_NAME = "water.db";
    private static final int DB_VERSION = 1;
    private static final String BILLS_TABLE = "Bills";
    private static final String ID_COL = "Id";
    private static final String MONTH_COL = "Month";
    private static final String YEAR_COL = "Year";
    private static final String CONSUME_COL = "Consume";
    private static final String AMOUNT_COL = "Amount";

    private static final String NOTE_COL = "Note";
    //private static final String TYPE_COL = "Type";
    private static final String CREATE_DB = "CREATE TABLE "+ BILLS_TABLE +" ("
            + ID_COL + " Integer primary key autoincrement, "
            + MONTH_COL + " text, "
            +YEAR_COL + " text, "
            +CONSUME_COL + " Integer,"
            +AMOUNT_COL + " Integer)";
    private Context context;
    public DBHelper(Context context){

        super(context,DB_NAME,null,DB_VERSION);
        this.context = context;
    }

    @Override
    public void onCreate(SQLiteDatabase db){
        db.execSQL(CREATE_DB);
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion){
        db.execSQL("drop table if exists "+BILLS_TABLE);
        onCreate(db);
    }
    public void onDropTable(){
        SQLiteDatabase db = this.getWritableDatabase();
        db.execSQL("drop table if exists "+BILLS_TABLE);
        db.close();
    }
    public void onCreateTable(){
        SQLiteDatabase db = this.getWritableDatabase();
        db.execSQL(CREATE_DB);
        db.close();
    }

    public long addNewBill(Bill bill){
        long result = 0;
        try{
            SQLiteDatabase db = this.getWritableDatabase();
            ContentValues values = new ContentValues();

            values.put(MONTH_COL,bill.getMonth());
            values.put(YEAR_COL,bill.getYear());
            values.put(CONSUME_COL,bill.getConsume());
            values.put(AMOUNT_COL,bill.getAmount());


            result = db.insert(BILLS_TABLE,null,values);
            db.close();
        }
        catch (Exception ex){
            Log.d("insert faild",ex.getMessage());
        }
        return result;
    }

    public ArrayList<Bill> getAllBills(){
        ArrayList<Bill> list = new ArrayList<Bill>();
        SQLiteDatabase db  = this.getReadableDatabase();
        Cursor c = db.rawQuery("SELECT * FROM "+BILLS_TABLE,null);
        if(c.moveToFirst()){
            do{
                Bill  bill = new Bill(
                        c.getInt(0),
                        c.getString(1),
                        c.getString(2),
                        c.getInt(3),
                        c.getInt(4));
                //Toast.makeText(context, String.valueOf(c.getInt(4)), Toast.LENGTH_SHORT).show();
                list.add(bill);
            }
            while (c.moveToNext());
        }
        c.close();
        return list;
    }

    public boolean checkBill(String month, String year){
        SQLiteDatabase db = this.getWritableDatabase();
        String query = String.format("SELECT Count(*) FROM %s where %s like '%s' and %s like '%s'",BILLS_TABLE,MONTH_COL,month,YEAR_COL,year);
       // Toast.makeText(context, query, Toast.LENGTH_SHORT).show();
        Cursor c = db.rawQuery(query,null);
        if(c.moveToFirst()){
            if(c.getInt(0) == 0) return true;
        }
        return false;
    }

    public long updateBill(int id, Bill bill){
        SQLiteDatabase db = this.getWritableDatabase();

        ContentValues values = new ContentValues();

        values.put(MONTH_COL,bill.getMonth());
        values.put(YEAR_COL,bill.getYear());
        values.put(CONSUME_COL,bill.getConsume());
        values.put(AMOUNT_COL,bill.getAmount());

        return db.update(BILLS_TABLE,values,"Id=?",new String[]{String.valueOf(id)});

    }



    public ArrayList<Bill> getBillByYear(String year){
        ArrayList<Bill> list = new ArrayList<>();
        SQLiteDatabase db  = this.getReadableDatabase();
        String query = String.format("SELECT * FROM %s where %s like '%s' ",BILLS_TABLE,YEAR_COL,year);
        Cursor c = db.rawQuery(query,null);
        if(c.moveToFirst()){
            do{
                Bill  bill = new Bill(
                        c.getInt(0),
                        c.getString(1),
                        c.getString(2),
                        c.getInt(3),
                        c.getInt(4));
                list.add(bill);
            }
            while (c.moveToNext());
        }
        c.close();
//        Toast.makeText(context,
//                query,
//                Toast.LENGTH_LONG).show();
        return list;
    }
    public Bill getBillById(int id){
        SQLiteDatabase db = this.getWritableDatabase();
        Bill bill = new Bill();
        Cursor c = db.rawQuery("SELECT * FROM Expense where id=?",new String[]{String.valueOf(id)});
        if(c.moveToFirst()){
            bill.setId(c.getInt(0));
            bill.setMonth(c.getString(1));
            bill.setYear(c.getString(2));
            bill.setConsume(c.getInt(3));
            bill.setAmount(c.getInt(4));

        }
        c.close();
        return bill;
    }

    public int deleteAllBill(){
        SQLiteDatabase db = this.getWritableDatabase();
        return  db.delete(BILLS_TABLE,null,null);
    }

    public int deleteBillById(int id){
        SQLiteDatabase db = this.getWritableDatabase();
        return  db.delete(BILLS_TABLE,"id=?",new String[]{String.valueOf(id)});
    }

}
