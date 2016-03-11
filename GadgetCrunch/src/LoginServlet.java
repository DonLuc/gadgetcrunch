import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import java.io.PrintWriter;
import java.io.IOException;
import za.ac.tut.dao.logindao.AdminLoginDAO;
import za.ac.tut.login.Login;
import java.util.Vector;
import javax.swing.JOptionPane;
import za.ac.tut.dao.logindao.ClientLoginDAO;
import za.ac.tut.user.client.Client;

public class LoginServlet extends HttpServlet
{
    
    @Override
    public void doGet(HttpServletRequest req,HttpServletResponse resp)
    {
        PrintWriter out = null;
        RequestDispatcher dispatcher = null;
        try
        {
            HttpSession session = req.getSession(true);
            out = resp.getWriter();
            String decision = req.getParameter("select");
            if(decision.equalsIgnoreCase("Sign Out"))
            {
                session.invalidate();
                
                dispatcher = req.getRequestDispatcher("index.html");
                //resp.sendRedirect("index.html");
            }
            dispatcher.forward(req, resp);
        }catch(Exception ex)
        {
           out.print("Error " + ex.getMessage());
        }
    
    }
    
 
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	{
		
		AdminLoginDAO admin_dao = new AdminLoginDAO();
		ClientLoginDAO client_dao = new ClientLoginDAO();
		PrintWriter out = null;
                try
		{
			HttpSession session = request.getSession(true);
			
			Login login = null;
			Client client = null;
                        out = response.getWriter();
			
			String url = getServletContext().getInitParameter("url");
			String user = getServletContext().getInitParameter("user");
			String pass  = getServletContext().getInitParameter("pass");
			
			String decision = request.getParameter("select");
			
			if(decision.equalsIgnoreCase("Login"))
			{
				String username = request.getParameter("txtUsernameLogin");
				String password = request.getParameter("txtPasswordLogin");
				
				//Login object
				login = new Login(username, password);
				//out.print("Test");
				//JOptionPane.showMessageDialog(null,login.getPassword());
				if(login !=null)
                                {
                                    //JOptionPane.showMessageDialog(null,"Test 1");
                                    if(username.substring(0,5).equalsIgnoreCase("admin"))
                                    {
                                            //Open adminDao
                                            admin_dao.openConnect(url,user, pass);

                                            //Login
                                            if(admin_dao.loginAdmin(login))
                                            {
                                                    login.setRole("Admin");
                                                    session.setAttribute("loginObj",login);
                                                    response.sendRedirect("admin_home.jsp");
                                            }else
                                            {
                                                    response.sendRedirect("login.html");
                                            }
                                    }else
                                    {
                                        
                                        client_dao.openConnect(url, user, pass);
                                  //      JOptionPane.showMessageDialog(null, client_dao.validateClient(login));
                                        if(client_dao.validateClient(login))
                                        {
                                    //        JOptionPane.showMessageDialog(null, "Valid login");
                                            login.setRole("Client");
                                            client = client_dao.getClient(login);
                                            session.setAttribute("loginObj", login);
                                            session.setAttribute("clientObj", client);
                                            response.sendRedirect("client_site.jsp");
                                        }else
                                        {
                                      //      JOptionPane.showMessageDialog(null, "Invalid login");
                                            response.sendRedirect("login.html");
                                        
                                        }
                                    }
                                }else
                                {
                                    response.sendRedirect("login.html");
                                }
			}else if(decision.equalsIgnoreCase("sign out"))
                        {
                            session.invalidate();
                            response.sendRedirect("index.html");
                        }
                        }catch(Exception ex)
                        {
                                out.print("Error " + ex.getMessage());

                        }finally
                        {
			try
			{
				admin_dao.closeConnect();
                                client_dao.closeConnect();
			}catch(Exception e)
			{
				
			}
		
		}
	}



}