
import java.io.IOException;
import java.util.Vector;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import za.ac.tut.cart.ShoppingCart;
import za.ac.tut.dao.gadgetdao.GadgetDAO;
import za.ac.tut.dao.orderdao.OrderDAO;
import za.ac.tut.gadget.gadgetextend.GadgetExtend;
import za.ac.tut.user.client.Client;
import java.util.Calendar;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Don
 */
public class OrderServlet extends HttpServlet
{
    int iCount = 0;
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        GadgetDAO gdao = new GadgetDAO();
        OrderDAO orderdao = new OrderDAO();
        GadgetExtend gadget = null;
        try
        {
            String url = getServletContext().getInitParameter("url");
            String user = getServletContext().getInitParameter("user");
            String pass = getServletContext().getInitParameter("pass");
            
            String hiddenID = request.getParameter("itemID");
            
            
            //gdao.openConnect(url, user, pass);
            gdao.openConnect(url, user, pass);
            HttpSession session = request.getSession(true);
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
            String action = request.getParameter("action");
            String id = request.getParameter("id");
            
            if(cart == null)
            {
                cart = new ShoppingCart();
            }
            
            
            if(action.equalsIgnoreCase("OrderNowPhone"))
            {
                 //JOptionPane.showConfirmDialog(null, "Test");
                cart.addGadget(gdao.viewGadgetExtend(Integer.parseInt(id)));
                session.setAttribute("cart", cart);
                session.setAttribute("countItems", cart.getGadgets().size());
                response.sendRedirect("cellphones.jsp?start=0&end=4");
            }else if(action.equalsIgnoreCase("View Cart"))
            {
			
				
				session.setAttribute("amountDue", cart.totalPrice());
				
                response.sendRedirect("view_cart.jsp");
            }else if(action.equalsIgnoreCase("RemoveItem"))
            {
				
				String modCode = String.valueOf(request.getParameter("remCode"));
				int myID = gdao.getIDByModelCode(modCode); 
				cart.removeGadget(myID);
				session.setAttribute("countItems", cart.getGadgets().size());
				session.setAttribute("amountDue", cart.totalPrice());
				response.sendRedirect("view_cart.jsp");
				
				
				
            }else if(action.equalsIgnoreCase("Check Out"))
            {
                response.sendRedirect("view_invoice.jsp");
			}else if(action.equalsIgnoreCase("OrderNowLaptop"))
			{
				cart.addGadget(gdao.viewGadgetExtend(Integer.parseInt(id)));
                session.setAttribute("cart", cart);
                session.setAttribute("countItems", cart.getGadgets().size());
                response.sendRedirect("notebooks.jsp?start=0&end=4");
			}else if(action.equalsIgnoreCase("OrderNowWear"))
			{
				cart.addGadget(gdao.viewGadgetExtend(Integer.parseInt(id)));
                session.setAttribute("cart", cart);
                session.setAttribute("countItems", cart.getGadgets().size());
                response.sendRedirect("wearables.jsp?start=0&end=4");
			
			}else if(action.equalsIgnoreCase("Clear Cart"))
			{
				cart.emptyCart();
				session.setAttribute("countItems", cart.getGadgets().size());
				response.sendRedirect("client_site.jsp");
			}
        }catch(Exception ex)
        {
            JOptionPane.showMessageDialog(null,"Error " + ex.getMessage());
        }finally
        {
            try
            {
                gdao.closeConnect();
            }catch(Exception e)
            {
                JOptionPane.showMessageDialog(null,"Error " + e.getMessage());            
            }
        }
      
    }
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		OrderDAO orderdao = new OrderDAO();
		try
		{
			HttpSession session = request.getSession(true);
			String action = request.getParameter("select");
			
			String url = getServletContext().getInitParameter("url");
            String user = getServletContext().getInitParameter("user");
            String pass = getServletContext().getInitParameter("pass");
			
			orderdao.openConnect(url,user,pass);
			
			ShoppingCart cart = (ShoppingCart)session.getAttribute("cart"); 
			
			
			
			Client client = (Client)session.getAttribute("clientObj");
			
			
			if(action.equalsIgnoreCase("Pay"))
			{
				//JOptionPane.showMessageDialog(null, "Test Pay");
				
				Calendar date = Calendar.getInstance();
				
				Vector<GadgetExtend> cartList = cart.getGadgets();
				//addOrder(Vector<GadgetExtend> items, Client client, String date, double amountDue)
				JOptionPane.showMessageDialog(null, "Order added: " + orderdao.addOrder(cartList, client, date.getTime().toString(), cart.totalPrice()));
					
				if(orderdao.addOrder(cartList, client, date.getTime().toString(), cart.totalPrice()) > 0)
				{
					
					cart.emptyCart();
					
					session.setAttribute("cart", cart);
					session.setAttribute("countItems", cart.getGadgets().size());
					
					response.sendRedirect("client_site.jsp");
				}
			}
		}catch(Exception ex)
		{
		
		}finally
		{
			try
			{
				orderdao.closeConnect();
			}catch(Exception ex)
			{
				
			
			
			}
		}
	}
}
