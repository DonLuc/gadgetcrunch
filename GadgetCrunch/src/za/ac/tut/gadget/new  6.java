import za.ac.tut.login.Login;
import za.ac.tut.dao.logindao.AdminLoginDAO;
import za.ac.tut.dao.logindao.AdminLoginDAO;
import za.ac.tut.gadget.Gadget;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import java.io.PrintWriter;
import java.io.IOException;
import java.util.Vector;

public class LoginServlet
{
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			PrintWriter out = response.getWriter();
			//Get the database credentials==============================
			String url = getServletContext().getInitParameter("url");
			String user = getServletContext().getInitParameter("user");
			String pass = getServletContext().getInitParameter("pass");
			//==========================================================
		
			String decision = request.getParameter("select");
			
			Login login = null;
			AdminLoginDAO adminDao = new AdminLoginDAO();
			GadgetDAO gadgetDao = new GadgetDAO();
			RequestDispatcher dispatcher = ne 
			if(decision.equalsIgnoreCase("Login"))
			{
				//Get Credentials
				String username = request.getParameter("txtUsername");
				String password = request.getParameter("txtPassword");
				Login login = new Login(username,password);
				
				//Open database connections=================================
				adminDao.openConnect(url,user,pass);
				
				if(adminDao.login(login))
				{
					Vector<Gadget> gadgets = gadgetDao.viewGadgets();
				}else
				{
					String error = "Unable to login, ensure that you have entered correct login credentials!"
					request.setAttribute("error",error);
					dispatcher = request.getRequestDispatcher("error.jsp");
					dispatcher.forward(request, response);
				}
			}
		}catch(Exception ex)
		{
			out.print("Error " + ex.getMessage());
		}
	}
}