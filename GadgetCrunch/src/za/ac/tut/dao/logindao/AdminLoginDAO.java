package za.ac.tut.dao.logindao;
import za.ac.tut.login.Login;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLException;
import java.sql.DriverManager;

public class AdminLoginDAO
{

	private Connection connect;
	private Statement state;
	public AdminLoginDAO()
	{
	
	}
	public void openConnect(String url, String user, String pass) throws SQLException, ClassNotFoundException
	{
		Class.forName("com.mysql.jdbc.Driver");
		connect = DriverManager.getConnection(url,user,pass);
		state = connect.createStatement();
	}
	//adelaide
	
	//Search if the username exists in 
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
		int isAdded = 0;
		
		if(checkUsername(login.getUsername()) != true)
		{
			String sql = 	"INSERT INTO tbllogin(username,password,role) " +
							"VALUES( (SELECT MAX(admin_id) FROM tbladmin), login.getUsername(),login.getPassword(),'Admin')";
			isAdded = state.executeUpdate(sql);
		}
		return isAdded;
	}

	public int removeLogin(Login login) throws SQLException
	{
		String sql = 	"DELETE FROM tbllogin " +
						"WHERE username = '"+login.getUsername()+"'";
		return state.executeUpdate(sql);
	}
	
	//public boolean getRole(Login)
	public boolean loginAdmin(Login login) throws SQLException
	{
		
		String sql = 	"SELECT * FROM tbllogin " +
						"WHERE username = '"+login.getUsername()+"' " +
						"AND password ='"+login.getUsername()+"'";
		ResultSet rec = state.executeQuery(sql);
		if(rec.next())
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	public void closeConnect() throws SQLException
	{
		state.close();
		connect.close();
	}
}
