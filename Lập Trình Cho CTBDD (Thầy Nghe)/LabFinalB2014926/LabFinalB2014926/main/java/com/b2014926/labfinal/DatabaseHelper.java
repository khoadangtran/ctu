package com.b2014926.labfinal;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

    public class DatabaseHelper extends SQLiteOpenHelper {
        private static final String DATABASE_NAME = "orders.db";
        private static final int DATABASE_VERSION = 1;

        private static final String CREATE_ORDERS_TABLE = "CREATE TABLE orders ("
                + "_id INTEGER PRIMARY KEY AUTOINCREMENT,"
                + "customer_name TEXT,"
                + "drink TEXT);";

        public DatabaseHelper(Context context) {
            super(context, DATABASE_NAME, null, DATABASE_VERSION);
        }

        @Override
        public void onCreate(SQLiteDatabase db) {
            db.execSQL(CREATE_ORDERS_TABLE);
        }

        @Override
        public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
            db.execSQL("DROP TABLE IF EXISTS orders");
            onCreate(db);
        }
    }

