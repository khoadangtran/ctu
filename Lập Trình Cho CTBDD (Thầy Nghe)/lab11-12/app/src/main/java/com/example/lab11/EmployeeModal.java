package com.example.lab11;

public class EmployeeModal {
    public EmployeeModal(String employeeName, String employeePhoneNumber, String employeeAddress) {
        this.employeeName = employeeName;
        this.employeePhoneNumber = employeePhoneNumber;
        this.employeeAddress = employeeAddress;
    }
    private String employeeName, employeePhoneNumber, employeeAddress;

    public EmployeeModal() {

    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String getEmployeePhoneNumber() {
        return employeePhoneNumber;
    }

    public void setEmployeePhoneNumber(String employeePhoneNumber) {
        this.employeePhoneNumber = employeePhoneNumber;
    }

    public String getEmployeeAddress() {
        return employeeAddress;
    }

    public void setEmployeeAddress(String employeeAddress) {
        this.employeeAddress = employeeAddress;
    }
}
