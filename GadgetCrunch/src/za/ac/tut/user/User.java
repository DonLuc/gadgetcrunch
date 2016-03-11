package za.ac.tut.user;
public abstract class User 
{
    private String name;
    private String surname;
    private long id;
    private String gender;

    public User() 
    {
    
    }
    public User(String name, String surname, long id, String gender) 
    {
        this.name = name;
        this.surname = surname;
        this.id = id;
        this.gender = gender;
    }
    public void setName(String name) 
	{
        this.name = name;
    }

    public void setSurname(String surname) 
	{
        this.surname = surname;
    }

    public void setId(long id) 
	{
        this.id = id;
    }

    public void setGender(String gender) 
    {
        this.gender = gender;
    }
    

    public String getName() 
    {
        return name;
    }

    public String getSurname() 
    {
        return surname;
    }

    public long getId() 
    {
        return id;
    }

    public String getGender() 
    {
        return gender;
    }
}
