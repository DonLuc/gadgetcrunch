package za.ac.tut.dao.registrationdao;

import java.sql.Connection;
import java.sql.DriverManager;
import za.ac.tut.dao.connectdao.ConnectDAO;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;
import za.ac.tut.contact.Contact;
import za.ac.tut.login.Login;
import za.ac.tut.user.client.Client;

public class RegistrationDAO
{
	Connection connect;
        Statement state;
	public void openConnect() throws ClassNotFoundException, SQLException
	{
                Class.forName("com.mysql.jdbc.Driver");
		connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/gadgetcrunchdbase", "root", "");
                state = connect.createStatement();
	}
	
	//check the availaility of a username
	public boolean isUsernameAvailable(Login login) throws SQLException
	{
		String sql = 	"SELECT * FROM tbllogin WHERE " +
						"username = '"+login.getUsername()+"' ";
                ResultSet rec = state.executeQuery(sql);
                
                if(rec.next())
                {
                    return true;
                }else
                {
                    return false;
                }
        }
        
        
        
    public boolean isIDAvail(Client client) throws SQLException
	{
		String sql = 	"SELECT * FROM tblclient " +
						"WHERE id_number = '"+client.getId()+"'";
		ResultSet rec = state.executeQuery(sql);				
		
		if(rec.next())
		{
			return true;
		}else
		{
			return false;
		}
	}
        
	
		
	public int addClient(Client client) throws SQLException
	{
            if(!isIDAvail(client))
            {
                
                String sql =    "INSERT INTO tblclient(name,surname, id_number,gender) " +
                                        "VALUES('"+client.getName()+"','"+client.getSurname()+"', "+
                                        client.getId()+",'"+client.getGender()+"')";
                return state.executeUpdate(sql);
            }else
            {
                return 0;
            }
	}

    public boolean checkUsername(String username) throws SQLException
	{
		String sql = 	"SELECT * FROM tbllogin " +
						"WHERE username = '"+username+"'";
		ResultSet rec = state.executeQuery(sql);
		if(rec.next())
		{
			return true;
		}else
		{
			return false;
		}
	}    
        
	public int addLogin(Login login) throws SQLException
	{
		if(checkUsername(login.getUsername()))
        {
               return 0;
		}else
		{
			
			String sql = "INSERT INTO tbllogin(login_id,username, password, role) " +
						 "VALUES((SELECT MAX(client_id) FROM tblclient),'"+login.getUsername()+"','"+
						 login.getPassword()+"','Client')";
			return state.executeUpdate(sql);
		}
	}

	public int addContact(Contact contact) throws SQLException
	{
		String sql =    "INSERT INTO tblclientcontact(contact_id,email,contact_number)" +
						"VALUES((SELECT MAX(client_id) FROM tblclient), '"+contact.getEmail()+"','"+contact.getContact()+"' )";
		return state.executeUpdate(sql);
	}
	
	
	public void closeConnect() throws SQLException
	{
                state.close();
		connect.close();
	}       


}