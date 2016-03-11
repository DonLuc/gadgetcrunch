package za.ac.tut.dao.connectdao;
//The main DAO
import java.sql.Connection;
import java.sql.Statement;
import java.sql.SQLException;
import java.sql.DriverManager;


public class ConnectDAO
{
	private Connection connect;
	private Statement state;
	public ConnectDAO()
	{
	
	}
	public void openConnect(String url, String user, String pass) throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
		connect = DriverManager.getConnection(url,user,pass);
		state = connect.createStatement();
	}
	
	
	public void setConnection(Connection connect) throws SQLException
	{
		this.connect = connect;
	}
	
	public Connection getConnection() throws SQLException
	{
		return this.connect;
	}
	
	public void setStatement()throws SQLException
	{
		this.state = state;
	}
	
	public Statement getStatement() throws SQLException
	{
		return this.state;
	}
	
	public void closeConnect() throws SQLException
	{
		this.state.close();
		this.connect.close();
	}
}

