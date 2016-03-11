/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.cart;

import java.util.Vector;
import za.ac.tut.gadget.gadgetextend.GadgetExtend;

/**
 *
 * @author Don
 */
public class ShoppingCart 
{

    private Vector<GadgetExtend> gadgets;
    public ShoppingCart()
    {
        gadgets = new Vector<GadgetExtend>();
    }
    
    public void addGadget(GadgetExtend gadget)
    {
        gadgets.add(gadget);
    }
    
    public void removeGadget(int id)
    {
       
        for(int x = 0; x < gadgets.size();x++)
        {
            if(gadgets.get(x).getID() == id)
            {
                gadgets.remove(x);
                break;
            }
        
        }
    }
    public void removeGadgetByIndex(int id)
    {
        // gadgets.remove(gadget);
        for(int x= 0; x < gadgets.size();x++ )
        {
            GadgetExtend ge = gadgets.get(x);
        
            if(ge.getID() == id)
            {
                gadgets.remove(x);
            }
        }
    }
    
    public int getIndexOf(GadgetExtend gadget)
    {
        return gadgets.indexOf(gadget);
    }
    
    
    public void emptyCart()
    {
        gadgets.removeAllElements();
    }
    
    public Vector<GadgetExtend> getGadgets()
    {
        return gadgets;
    }
    
    public GadgetExtend getGadget(int index)
    {
        return gadgets.get(index);
    }
    
    public double totalPrice()
    {
        double price = 0;
        for(GadgetExtend gadget:gadgets)
        {
            price += gadget.getGadget().getPrice();
        }
        return price;
    }
}
