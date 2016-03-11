package za.ac.tut.order;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Don
 */
public class Order 
{
    private int order_id;
    private int client_id;
    private String order_desc;
    private double order_amount;
    private String order_date;

    public Order(int order_id, int client_id, String order_desc, double order_amount, String order_date) {
        this.order_id = order_id;
        this.client_id = client_id;
        this.order_desc = order_desc;
        this.order_amount = order_amount;
        this.order_date = order_date;
    }

    public Order(int client_id, String order_desc, double order_amount, String order_date) {
        this.client_id = client_id;
        this.order_desc = order_desc;
        this.order_amount = order_amount;
        this.order_date = order_date;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getClient_id() {
        return client_id;
    }

    public void setClient_id(int client_id) {
        this.client_id = client_id;
    }

    public String getOrder_desc() {
        return order_desc;
    }

    public void setOrder_desc(String order_desc) {
        this.order_desc = order_desc;
    }

    public double getOrder_amount() {
        return order_amount;
    }

    public void setOrder_amount(double order_amount) {
        this.order_amount = order_amount;
    }

    public String getOrder_date() {
        return order_date;
    }

    public void setOrder_date(String order_date) {
        this.order_date = order_date;
    }
    
    
}
