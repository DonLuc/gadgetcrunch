package za.ac.tut.gadget;


public class Gadget
{
	
	private String modelCode;
	private String brand;
	private String description;
	private String category;
	private double price;
	private int quantity;

    public Gadget() 
    {
    }

    public Gadget(String modelCode,String brand, String description,String category, double price, int quantity) 
	{
        this.modelCode = modelCode;
        this.brand = brand;
		this.description = description;
		this.category = category;
        this.price = price;
        this.quantity = quantity;
    }

	public void setBrand(String brand)
	{
		this.brand = brand;
	}
	public String getBrand()
	{
		return this.brand;
	}
    public String getmodelCode() 
	{
        return this.modelCode;
    }

    public void setmodelCode(String modelCode) {
        this.modelCode = modelCode;
    }

    public String getDescription() {
        return description;
    }
	
    public void setDescription(String description) {
        this.description = description;
    }

	public void setCategory(String category)
	{
		this.category = category;
	}
	public String getCategory()
	{
		return this.category;
	}
    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }


}