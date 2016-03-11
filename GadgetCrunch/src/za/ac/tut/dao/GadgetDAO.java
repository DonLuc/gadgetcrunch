package za.ac.tut.dao.gadgetdao;
import za.ac.tut.dao.connectdao.ConnectDAO;
import za.ac.tut.gadget.Gadget;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.Vector;

public class GadgetDAO
{
	private ConnectDAO connect = new ConnectDAO();
	
	public void openConnect(String url, String user,String pass) throws SQLException, ClassNotFoundException
	{
		connect.openConnect(url,user,pass);
	}
	
	//Add gadgets
	public int addGadget(Gadget gad) throws SQLException
	{
		String sql = 	"INSERT into tblgadget(model_code, description, description, category, price, gadget_quantity) " +
						"VALUES('"+gad.getModelCode()+"','"+gad.getDescription()+"','"+gad.getCategory()+"',"+gad.getPrice()+","+gad.getQuantity()+")";
		return connect.getStatement().executeUpdate(sql);
	}
	
	public int removeGadget(int id) throws SQLException
	{
		String sql = 	"DELETE FROM tblgadget " +
						"WHERE gadget_id ="+id+"";
		return connect.getStatement().executeUpdate();
	}
	
	public Gadget viewGadget(int id) throws SQLException
	{
		String sql = 	"SELECT * FROM tblgadget " +
						"WHERE gadget_id = "+id+"";
		ResultSet rec = connect.getStatement().executeQuery(sql);
		Gadget gadget = null;
		if(rec.next())
		{
			gadget = new Gadget(rec.getString(2),rec.getString(3),rec.getString(4), rec.getDouble(5), rec.getInt(6));
		}
		return gadget;
	}
	
	
	public int updateGadget(Gadget gadget, int id) throws SQLException
	{
		String sql = 	"UPDATE tblgadget " +
						"SET model_code ='"+gadget.getModelCode()+"','"+gadget.getDescription()
						+"','"+gadget.getCategory()+"',"+gadget.getPrice()+","+gadget.getQuantity()+"";
		return connect.getStatement().executeUpdate(sql);
	}
	
	public Vector
	
	public Vector<Gadget> viewGadgets() throws SQLException
	{
		String sql = 	"SELECT * FROM tblgadget";
		ResultSet rec = connect.getStatement().executeQuery(sql);
		Gadget gadget = null;
		Vector<Gadget> gadgets = new Vector<Gadget>();
		while(rec.next())
		{
			gadget = new Gadget(rec.getString(2),rec.getString(3),rec.getString(4), rec.getDouble(5), rec.getInt(6));
			gadgets.add(gadget);
		}
		return gadgets;
	}
	
	public void closeConnect() throws SQLException
	{
		connect.closeConnect();
	}



}