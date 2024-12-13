package com.example.watermanagement;

public class Bill {
    private int id;
    private String month;
    private String year;

    private int consume;
    private int amount;

    public Bill(){}

    public Bill(int id,String month, String year,int consume, int amount) {
        this.id = id;
        this.month = month;
        this.year = year;
        this.consume = consume;
        this.amount = amount;

    }
    public Bill(String month, String year,int consume, int amount) {
        this.month = month;
        this.year = year;
        this.consume = consume;
        this.amount = amount;

    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public int getConsume() {
        return consume;
    }

    public void setConsume(int consume) {
        this.consume = consume;
    }

    public int getAmount() {
        return amount;
    }



    public void setAmount(int amount) {
        this.amount = amount;
    }


}
