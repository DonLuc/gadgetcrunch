/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.dao.orderdao;

import java.util.Date;
import java.sql.SQLException;
import java.util.Vector;
import za.ac.tut.dao.connectdao.ConnectDAO;
import za.ac.tut.gadget.gadgetextend.GadgetExtend;
import za.ac.tut.user.client.Client;
import za.ac.tut.order.Order;
import java.sql.ResultSet;

/**
 *
 * @author Don
 */
public class OrderDAO 
{

    private ConnectDAO connect = new ConnectDAO();
	
    public void openConnect(String url, String user,String pass) throws SQLException, ClassNotFoundException
    {
            connect.openConnect(url,user,pass);
    }

    //Retrieve a items in strings
    public String getItemsOrdered(Vector<GadgetExtend> items)
    {
        String out = "";
        
        for(GadgetExtend item: items)
        {
            out += item.getGadget().getDescription() + "\n";
        }
        return out;
    }
    
    public double getAmountDue(Vector<GadgetExtend> items)
    {
    
        double amntDue = 0.0;
        
        for(GadgetExtend item: items)
        {
            amntDue += item.getGadget().getPrice();
        }
        return amntDue;
    }
    
	public int addOrder(Vector<GadgetExtend> items, Client client, String date, double amountDue) throws SQLException
    {
        String sql =    "INSERT INTO tblOrder(client_id, orderDescription, category,orderDate, amountDue) " +
                        "VALUES("+client.getIndex()+", '"+getItemsOrdered(items)+"','"+date+"',"+amountDue+")";
        return connect.getStatement().executeUpdate(sql);
    }
    
	public Vector<Order> viewOrders() throws SQLException
	{
		String sql = "SELECT * FROM tblorder";
		ResultSet rec = connect.getStatement().executeQuery(sql);
		Order order = null;
		Vector<Order> orders = new Vector<>();
		while(rec.next())
		{
			order = new Order(rec.getInt(1),rec.getInt(2),rec.getString(3),rec.getDouble(4),rec.getString(5));
			orders.add(order);
		}
		return orders;
	}
	
	
    
    public void closeConnect() throws SQLException
    {
        connect.closeConnect();
    }
    
    
}
