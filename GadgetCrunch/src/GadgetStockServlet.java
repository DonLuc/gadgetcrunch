//StockServlet
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.RequestDispatcher;
import java.util.Vector;
import za.ac.tut.gadget.Gadget;
import za.ac.tut.dao.gadgetdao.GadgetDAO;
import java.io.PrintWriter;
import java.io.IOException;
import za.ac.tut.gadget.gadgetextend.GadgetExtend;
import javax.swing.JOptionPane;


public class GadgetStockServlet extends HttpServlet
{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	{
		GadgetDAO gdao = new GadgetDAO();
		String url = getServletContext().getInitParameter("url");
		String user = getServletContext().getInitParameter("user");
		String pass = getServletContext().getInitParameter("pass");
		String decision = request.getParameter("select");
		RequestDispatcher dispatcher = null;
		PrintWriter out = null;
		try
		{
			out = response.getWriter();
			HttpSession session = request.getSession(true);
			gdao.openConnect(url, user, pass);
			
			if(decision.equalsIgnoreCase("View Cellphones"))
			{
				//JOptionPane.showMessageDialog(null,"test");
				Vector<GadgetExtend> cellphones = gdao.viewGadgetsByCat("Cellphone");
				session.setAttribute("cellphones", cellphones);
				dispatcher = request.getRequestDispatcher("cellphones.jsp?start=0&end=4");
			}else if(decision.equalsIgnoreCase("View Laptops"))
                        {
                                //JOptionPane.showMessageDialog(null,"test");
				Vector<GadgetExtend> cellphones = gdao.viewGadgetsByCat("Laptop");
				session.setAttribute("cellphones", cellphones);
				dispatcher = request.getRequestDispatcher("notebooks.jsp?start=0&end=4");
                        }else if(decision.equalsIgnoreCase("Wearables"))
                        {
                            	Vector<GadgetExtend> cellphones = gdao.viewGadgetsByCat("Wearable");
								session.setAttribute("cellphones", cellphones);
								dispatcher = request.getRequestDispatcher("wearables.jsp?start=0&end=4");
                        }
			dispatcher.forward(request, response);
		}catch(Exception ex)
		{
			out.print("Error " + ex.getMessage());
		}
		finally
		{
			try
			{ 
				gdao.closeConnect();
			}catch(Exception ex)
			{
				out.print("Error " + ex.getMessage());
			}
		}

	}
}