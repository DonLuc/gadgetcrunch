package za.ac.tut.user.client;

import za.ac.tut.banking.Banking;
import za.ac.tut.contact.Contact;
import za.ac.tut.login.Login;
import za.ac.tut.user.User;

public class Client extends User
{
	private Banking banking;
	
	private Login login;
	private Contact contact;
	private int index;
	
	
	public Client(String name, String surname, long id, String gender)
	{
		super(name,surname, id, gender);
	}
	
	public Client(int index,String name, String surname, long id, String gender)
	{
		super(name,surname, id, gender);
		this.index = index;
	}
	
	public Client(int index,String name, String surname, long id, String gender, Login login, Contact contact)
	{
		super(name,surname, id, gender);
		this.index = index;
		this.login = login;
		this.contact = contact;
	}
	
	public Client(String name, String surname, long id, String gender,Login login, Contact contact)
	{
		super(name,surname, id, gender);
		this.index = index;
		this.login = login;
		this.contact = contact;
	}

    public Login getLogin() {
        return login;
    }

    public void setLogin(Login login) {
        this.login = login;
    }

    public Contact getContact() {
        return contact;
    }

    public void setContact(Contact contact) {
        this.contact = contact;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }
	
	
	
	
	
	
	public void setBanking(Banking bank)
	{
		this.banking = bank;
	}
	
	public Banking getBanking()
	{
		return this.banking;
	}
}