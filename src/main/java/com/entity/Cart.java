package com.entity;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

public class Cart {
	
	private HashMap<Items,Integer> itemsInCart;
	private double totalPrice;
	
	public Cart(){
		itemsInCart=new HashMap<Items, Integer>();
		totalPrice=0.0;
	}

	public HashMap<Items, Integer> getItemsInCart() {
		return itemsInCart;
	}

	public void setItemsInCart(HashMap<Items, Integer> itemsInCart) {
		this.itemsInCart = itemsInCart;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public boolean addItemsInCart(Items item,int num){
		if(itemsInCart.containsKey(item)){
			itemsInCart.put(item, itemsInCart.get(item)+num);
		}
		else{
			itemsInCart.put(item, num);
		}
		 calTotalPrice();
		return true;
	}
	public boolean removeItemsFromCart(Items item){
		
		int aaa=itemsInCart.remove(item);//remove
		 calTotalPrice();
		return true;
	}
	public double calTotalPrice(){
		double sum=0.0;
		Set<Items> keys=itemsInCart.keySet();
		Iterator<Items> it=keys.iterator();
		while(it.hasNext()){
			Items item=it.next();
			sum+=item.getPrice()*itemsInCart.get(item);
		}
		this.setTotalPrice(sum);
		return this.getTotalPrice();
	}
	

}

