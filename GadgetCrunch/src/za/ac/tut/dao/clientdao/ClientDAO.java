/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.dao.clientdao;

import java.sql.ResultSet;
import java.util.Date;
import java.sql.SQLException;
import java.util.Vector;
import za.ac.tut.dao.connectdao.ConnectDAO;
import za.ac.tut.user.User;

/**
 *
 * @author Don
 */
public class ClientDAO 
{

    private ConnectDAO connect = new ConnectDAO();
	
    public void openConnect(String url, String user,String pass) throws SQLException, ClassNotFoundException
    {
            connect.openConnect(url,user,pass);
    }

    //Retrive clients
    public Vector<User> viewClients() throws SQLException
    {
        String sql = "SELECT * FROM tblclient";
        ResultSet rec = connect.getStatement().executeQuery(sql);
        User client = null;
        Vector<User> clients = new Vector<>();
        
        while(rec.next())
        {
            client = new User(rec.getString(2), rec.getString(3), rec.getLong(4), rec.getString(5));
            clients.add(client);
        }
        return clients;
    }
    
    
    
    
    public void closeConnect() throws SQLException
    {
        connect.closeConnect();
    }
    
    
}
