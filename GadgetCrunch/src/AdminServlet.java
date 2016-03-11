import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import java.io.PrintWriter;
import java.io.IOException;
import za.ac.tut.gadget.Gadget;
import za.ac.tut.dao.logindao.AdminLoginDAO;
import za.ac.tut.gadget.gadgetextend.GadgetExtend;
import za.ac.tut.dao.gadgetdao.GadgetDAO;
//import za.ac.tut.user.User;
import java.util.Vector;
import za.ac.tut.dao.clientdao.ClientDAO;
import za.ac.tut.dao.orderdao.OrderDAO;
import za.ac.tut.order.Order;


public class AdminServlet extends HttpServlet
{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	{
		PrintWriter out = null;
		GadgetDAO g_dao = new GadgetDAO();
		ClientDAO clientdao = new ClientDAO();
		OrderDAO orderdao = new OrderDAO();
		String decision = request.getParameter("select");
		RequestDispatcher dispatch = null;
		try
		{
			//Retrieve credentials
			
			String url = getServletContext().getInitParameter("url");
			String user = getServletContext().getInitParameter("user");
			String pass  = getServletContext().getInitParameter("pass");
			
			//Instantiate RequestDispatcher
			
			out = response.getWriter();
			g_dao.openConnect(url,user,pass);
			clientdao.openConnect(url,user,pass);
			orderdao.openConnect(url,user,pass);
			GadgetExtend gadgete = null;
			HttpSession session = request.getSession(true);
			if(decision.equalsIgnoreCase("Gadget Management"))
			{
				
				Vector<GadgetExtend> gadgets = g_dao.viewGadgetsExtend();
				request.setAttribute("gadgets",gadgets);
				//request.setAttribute("ids",ids);
				dispatch = request.getRequestDispatcher("admin_gadget_manage.jsp");
				
			}else if(decision.equalsIgnoreCase("Add Gadget"))
			{
				Vector<Gadget> gadgets = g_dao.viewGadgets();
				request.setAttribute("gadgets",gadgets);
				//request.setAttribute("ids",ids);
				dispatch = request.getRequestDispatcher("add_gadget.jsp");
			}else if(decision.equalsIgnoreCase("View Clients"))
			{
				/*
				//request.setAttribute("clients", );
				//JOptionPane.showMessageDialog(null, clientdao.viewClients().size());
				session.setAttribute("totalClients", clientdao.viewClients().size());
				session.setAttribute("clients", clientdao.viewClients());
				
				dispatch = request.getRequestDispatcher("view_clients.jsp");
				*/
			}else if(decision.equalsIgnoreCase("Sales Management"))
			{
				Vector<Order> orders = orderdao.viewOrders();
				session.setAttribute("orders",orders);
				dispatch = request.getRequestDispatcher("sales_manage.jsp");
			}

			dispatch.forward(request,response);
			
		}catch(Exception ex)
		{
			try
			{
				out.print("Error " + ex.getMessage());
			}catch(Exception e)
			{
			
			}
		}finally
		{
			try
			{
				g_dao.closeConnect();
				orderdao.closeConnect();
			}catch(Exception ex)
			{
				
			}
		}
	
	}
	
	@Override
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	{
		
		PrintWriter out = null;
		GadgetDAO g_dao = new GadgetDAO();
		
		try
		{
			
			//Retrieve credentials
			String url = getServletContext().getInitParameter("url");
			String user = getServletContext().getInitParameter("user");
			String pass  = getServletContext().getInitParameter("pass");
			HttpSession session = request.getSession(true);
			//Get the decision
			String decision = request.getParameter("select");
			
			Vector<GadgetExtend> gadgetsExtend = null;
			RequestDispatcher dispatch = null;	
			out = response.getWriter();
			g_dao.openConnect(url,user,pass);
			String id = "";
			
			Gadget gadget = null;
			GadgetExtend ge = null;
			//Fields
			String brand = "";
			String modelCode = "";
			String description = "";
			String category = "";
			String price = "";
			String quantity = "";
			if(decision.equalsIgnoreCase("Delete"))
			{
				id = request.getParameter("gadgetID");
				if(g_dao.removeGadget(Integer.parseInt(id)) > 0)
				{
					//out.print("Deleted");
					gadgetsExtend = g_dao.viewGadgetsExtend();
					request.setAttribute("gadgets",gadgetsExtend);
					dispatch = request.getRequestDispatcher("admin_gadget_manage.jsp");
					
					//dispatch.forward(request,response);
					//response.sendRedirect("admin_gadget_manage.jsp");
				}else
				{
					out.print("The record was unable to be deleted!");
				}
				//<input align="left" type="radio" name="gadgetID" value=
			}else if(decision.equalsIgnoreCase("Add to stock"))
			{
				brand = request.getParameter("brand");
				modelCode = request.getParameter("model_code");
				description = request.getParameter("description");
				category = request.getParameter("category");
				price = request.getParameter("price");
				quantity = request.getParameter("quantity");
				
				gadget = new Gadget(modelCode,brand,description, category,Double.parseDouble(price),Integer.parseInt(quantity));
				if(g_dao.addGadget(gadget) > 0)
				{
					//out.print("The gadget is added successfully");
					Vector<Gadget> gadgets = g_dao.viewGadgets();
					request.setAttribute("gadgets",gadgets);
					dispatch = request.getRequestDispatcher("add_gadget.jsp");
					//dispatch.forward(request, response);
				}else
				{
					out.print("The gadget was unable to be added");
				}
				
			}else if(decision.equalsIgnoreCase("Update Gadget"))
			{
				//String id_up = request.getParameter("gadgetID_update");
				ge = (GadgetExtend)session.getAttribute("gadgetUpdate");
				
					brand = request.getParameter("brand_update");
					modelCode = request.getParameter("model_code_update");
					description = request.getParameter("description_update");
					category = request.getParameter("category_update");
					price = request.getParameter("price_update");
					quantity = request.getParameter("quantity_update");
					
					
					gadget = new Gadget(modelCode, brand, description, category, Double.parseDouble(price),Integer.parseInt(quantity));
					//String sid = (String)session.getAttribute("id");
					
					if(g_dao.updateGadget(gadget, ge.getID()) > 0)
					{
						ge = g_dao.viewGadgetExtend(Integer.parseInt(request.getParameter("gadgetID_update")));
						request.setAttribute("gadget", ge);
						dispatch = request.getRequestDispatcher("update_gadget.jsp");
					}else
					{
						out.print("Not updated");
					}
					dispatch.forward(request, response);
			}else if(decision.equalsIgnoreCase("Update"))
			{
				id = request.getParameter("gadgetID");
				GadgetExtend gadgetUpdate = g_dao.viewGadgetExtend(Integer.parseInt(id));
				
				session.setAttribute("gadgetUpdate", gadgetUpdate);
				ge = g_dao.viewGadgetExtend(Integer.parseInt(id));
				if(ge != null)
				{
					request.setAttribute("gadget",ge);
					dispatch = request.getRequestDispatcher("update_gadget.jsp");
				}else
				{
					out.print("The gadget with the specified id does not exist");
				}
			}
			dispatch.forward(request,response);
		}catch(Exception ex)
		{
			out.print("Error " + ex.getMessage());
		}finally
		{
			try
			{
					g_dao.closeConnect();
					
			}catch(Exception e)
			{
				out.print("Error " + e.getMessage());
			}
		}
	}
}
