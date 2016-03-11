/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.dao.logindao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import za.ac.tut.dao.connectdao.ConnectDAO;
import za.ac.tut.login.Login;
import za.ac.tut.user.client.Client;

/**
 *
 * @author Don
 */
public class ClientLoginDAO 
{
    public ConnectDAO connect = new ConnectDAO();
    
    public void openConnect(String url, String user, String pass) throws ClassNotFoundException, SQLException
    {
        connect.openConnect(url, user, pass);
    }
    
    public int getID(Login login) throws SQLException
    {
        String sql =    "SELECT login_id FROM tbllogin " +
                        "WHERE username = '"+login.getUsername()+"' " +
                        "AND password = '"+login.getPassword()+"'";
        ResultSet rec = connect.getStatement().executeQuery(sql);
        
        
        if(rec.next())
        {
            return rec.getInt(1);
        }else
        {
            return 0;
        }
        
    }
    
   public boolean validateClient(Login login) throws SQLException
   {
       String sql = "SELECT * FROM tbllogin " +
                    "WHERE username='"+login.getUsername()+"' " +
                    "AND password='"+login.getPassword()+"'";
       ResultSet rec = connect.getStatement().executeQuery(sql);
       
       return rec.next();
   }
  
   
   public Client getClient(Login login) throws SQLException
   {    
        String sql = "SELECT * FROM tblclient " +
                    "WHERE client_id = "+getID(login)+"";
        ResultSet rec = connect.getStatement().executeQuery(sql);
        Client client = null;
        
        if(rec.next())
        {
            client = new Client(rec.getInt(1), rec.getString(2), rec.getString(3), rec.getLong(4), rec.getString(5));
        }
        return client;
   }
   
    
    public void closeConnect() throws SQLException
    {
        connect.closeConnect();
    }
}
