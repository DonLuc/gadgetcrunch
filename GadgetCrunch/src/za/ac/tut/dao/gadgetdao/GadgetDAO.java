package za.ac.tut.dao.gadgetdao;
import za.ac.tut.dao.connectdao.ConnectDAO;
import za.ac.tut.gadget.Gadget;
import za.ac.tut.gadget.gadgetextend.GadgetExtend;
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
		String sql = 	"INSERT into tblgadget(model_code,brand, description, category, price, gadget_quantity) " +
						"VALUES('"+gad.getmodelCode()+"','"+gad.getBrand()+"','"+gad.getDescription()+"','"+gad.getCategory()+"',"+gad.getPrice()+","+gad.getQuantity()+")";
		return connect.getStatement().executeUpdate(sql);
	}
	
	public int removeGadget(int id) throws SQLException
	{
		String sql = 	"DELETE FROM tblgadget " +
						"WHERE gadget_id ="+id+"";
		return connect.getStatement().executeUpdate(sql);
	
        }
        
        public int getIDByModelCode(String code) throws SQLException
        {
            String sql =    "SELECT gadget_id FROM tblgadget " +
                            "WHERE model_code = '"+code+"' ";
            ResultSet rec = connect.getStatement().executeQuery(sql);
            
            if(rec.next())
            {
                return rec.getInt(1);
            }else
            {
                return 0;
            }
        }
        
        
        public int removeGadgetByCode(String code) throws SQLException
        {
        	String sql = 	"DELETE FROM tblgadget " +
						"WHERE model_code ='"+code+"'";
		return connect.getStatement().executeUpdate(sql);
        }
	
	public Gadget viewGadget(int id) throws SQLException
	{
		String sql = 	"SELECT * FROM tblgadget " +
						"WHERE gadget_id = "+id+"";
		ResultSet rec = connect.getStatement().executeQuery(sql);
		Gadget gadget = null;
		if(rec.next())
		{
			gadget = new Gadget(rec.getString(2),rec.getString(3),rec.getString(4),rec.getString(5), rec.getDouble(6), rec.getInt(7));
		}
		return gadget;
	}
	
	public GadgetExtend viewGadgetExtend(int id) throws SQLException
	{
		String sql = 	"SELECT * FROM tblgadget " +
						"WHERE gadget_id = "+id+"";
		ResultSet rec = connect.getStatement().executeQuery(sql);
		GadgetExtend gadgetex = null;
		Gadget gadget = null;
		int i = 0;
		if(rec.next())
		{
			i = rec.getInt(1);
			gadget = new Gadget(rec.getString(2),rec.getString(3),rec.getString(4),rec.getString(5), rec.getDouble(6), rec.getInt(7));
			gadgetex = new GadgetExtend(i, gadget);
		}
		return gadgetex;
	}
        
        public GadgetExtend viewGadgetExtendByCode(String code) throws SQLException
	{
		String sql = 	"SELECT * FROM tblgadget " +
						"WHERE model_code = '"+code+"' ";
		ResultSet rec = connect.getStatement().executeQuery(sql);
		GadgetExtend gadgetex = null;
		Gadget gadget = null;
		int i = 0;
		if(rec.next())
		{
			i = rec.getInt(1);
			gadget = new Gadget(rec.getString(2),rec.getString(3),rec.getString(4),rec.getString(5), rec.getDouble(6), rec.getInt(7));
			gadgetex = new GadgetExtend(i, gadget);
		}
		return gadgetex;
	}
	
	
	public int updateGadget(Gadget gadget, int id) throws SQLException
	{
		String sql = 	"UPDATE tblgadget " +
						"SET model_code ='"+gadget.getmodelCode()+"',description='"+gadget.getDescription()
						+"',category='"+gadget.getCategory()+"',price="+gadget.getPrice()+",gadget_quantity="+gadget.getQuantity()+" " +
						"WHERE gadget_id="+id;
		return connect.getStatement().executeUpdate(sql);
	}
	
	public Vector<Integer> getIDs() throws SQLException
	{
		String sql = "SELECT gadget_id FROM tblgadget";
		ResultSet rec = connect.getStatement().executeQuery(sql);
		
		Vector<Integer> ids = new Vector<Integer>();
		while(rec.next())
		{
			ids.add(rec.getInt(1));
		}
		return ids;
	}
	
	public Vector<Gadget> viewGadgets() throws SQLException
	{
		String sql = 	"SELECT * FROM tblgadget";
		ResultSet rec = connect.getStatement().executeQuery(sql);
		Gadget gadget = null;
		Vector<Gadget> gadgets = new Vector<Gadget>();
		while(rec.next())
		{
			gadget = new Gadget(rec.getString(2),rec.getString(3),rec.getString(4),rec.getString(5), rec.getDouble(6), rec.getInt(7));
			gadgets.add(gadget);
		}
		return gadgets;
	}
	
	public Vector<GadgetExtend> viewGadgetsExtend() throws SQLException
	{
		String sql = 	"SELECT * FROM tblgadget";
		ResultSet rec = connect.getStatement().executeQuery(sql);
		GadgetExtend gadgetex = null;
		Gadget gadget = null;
		
		Vector<GadgetExtend> gadgets = new Vector<GadgetExtend>();
		int id = 0;
		while(rec.next())
		{
			id = rec.getInt(1);
			gadget = new Gadget(rec.getString(2),rec.getString(3),rec.getString(4),rec.getString(5), rec.getDouble(6), rec.getInt(7));
			gadgetex = new GadgetExtend(id, gadget);
			gadgets.add(gadgetex);
		}
		return gadgets;
	}
	
	
	
	//Retrieve phones
	public Vector<GadgetExtend> viewGadgetsByCat(String cat) throws SQLException
	{
		String sql = 	"SELECT * FROM tblgadget " +
						"WHERE category = '"+cat+"' ";
		ResultSet rec = connect.getStatement().executeQuery(sql);
		Vector<GadgetExtend> gadgets = new Vector<GadgetExtend>();
		GadgetExtend ge = null;
		Gadget gadget = null;
		while(rec.next())
		{
			//Gadget(String modelCode,String brand, String description,String category, double price, int quantity) 
			gadget = new Gadget(rec.getString(2),rec.getString(3),rec.getString(4),rec.getString(5),rec.getDouble(6),rec.getInt(7));
			ge = new GadgetExtend(rec.getInt(1), gadget);
			gadgets.add(ge);
		}
		
		return gadgets;
	}
	
	public void closeConnect() throws SQLException
	{
		connect.closeConnect();
	}



}