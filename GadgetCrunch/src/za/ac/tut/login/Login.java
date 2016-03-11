package za.ac.tut.login;

public class Login
{
	private String username;
	private String password;
	private String role;
	public Login()
	{
	
	}
	
	public Login(String user, String pass)
	{
		this.username = user;
		this.password = pass;
	}
        
        
        
	
	
	public void setRole(String role)
	{
		this.role = role;
	}
	
	public String getRole()
	{
		return this.role;
	}
	
	public void setUsername(String user)
	{
		this.username = user;
	}
	
	public String getUsername()
	{
		return this.username;
	}
	
	public void setPassword(String pass)
	{
		this.password = pass;
	}
	
	public String getPassword()
	{
		return this.password;
	}
}