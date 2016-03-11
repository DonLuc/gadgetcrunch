package za.ac.tut.contact;

public class Contact 
{
    private String email;
    private String contact;

    public Contact() 
    {
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    
    
    
    public Contact(String email, String contact) 
    {
        this.email = email;
        this.contact = contact;
    }

    public String getEmail() 
	{
        return email;
    }

    public String getContact() {
        return contact;
    }
    
}
