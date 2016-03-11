
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import za.ac.tut.contact.Contact;
import za.ac.tut.dao.registrationdao.RegistrationDAO;
import za.ac.tut.login.Login;
import za.ac.tut.user.client.Client;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Don
 */
public class ClientServlet extends HttpServlet
{

    
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doPost(req, resp); //To change body of generated methods, choose Tools | Templates.
        
        PrintWriter out = null;
        
        RegistrationDAO regDao = new RegistrationDAO();
        String url = getServletConfig().getInitParameter("url");
        String user = getServletContext().getInitParameter("user");
        String pass = getServletContext().getInitParameter("pass");
        try  
        {
            
            out = resp.getWriter();
            
            
            
            //Basic info
            String name = req.getParameter("name");
            String surname = req.getParameter("surname");
            String id = req.getParameter("id_number");
            String gender = req.getParameter("gender");
            
            //Contact Info
            String email = req.getParameter("email");
            String contact_num = req.getParameter("contact");
            if(email == null)
            {
                email = "N/A";
            }
            
            //Login Info
            String username = req.getParameter("username");
            String password = req.getParameter("myPassword");
            
            
            String decision = req.getParameter("select");
            
            if(decision.equalsIgnoreCase("Add Client"))
            {
                
                Contact contact = new Contact(email, contact_num);
                Login login = new Login(username, password);
                Client client = new Client(name, surname, Long.parseLong(id), gender, login, contact);
                
               
                regDao.openConnect();
                //JOptionPane.showMessageDialog(null,"Test");
		//HttpSession session = resp.getSession(true);
                
                if(regDao.addClient(client) > 0)
                {
                    
                    if(regDao.addLogin(login) > 0)
                    {
                        if(regDao.addContact(contact) > 0)
                        {
                            //out.print("Registered");
                            resp.sendRedirect("login.html");
                        }else
                        {
                            //resp.sendRedirect("error.jsp");
                        }
                    }else
                    {
                        //resp.sendRedirect("error.jsp");
                    }
                }else
                {
                    //resp.sendRedirect("error.jsp");
                }
            }
        }catch(Exception ex)
        {
            //resp.sendRedirect("../error.jsp");
            out.print("Error " + ex.getMessage());
        }finally
        {
            try
            {
            
            }catch(Exception ex)
            {
                try {
                    regDao.closeConnect();
                } catch (SQLException ex1) {
                    
                    out.print("Error " + ex1.getMessage());
                
                }
            }
        }
    } 
}
