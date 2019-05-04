package com.neu.cassian.pojo;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="WT_admin")
@PrimaryKeyJoinColumn(name="adminId")
public class Admin extends Person {
	
	
	
	@OneToMany(fetch=FetchType.EAGER,cascade=CascadeType.ALL,mappedBy="customer")
	private Set<Order> orderList = new HashSet<Order>();
	
	public Set<Order> getOrderList() {
		return orderList;
	}

	public void setOrderList(Set<Order> orderList) {
		this.orderList = orderList;
	}
	


	@OneToMany(fetch=FetchType.EAGER,mappedBy="admin")
	private Set<Supplier> supplierList = new HashSet<Supplier>();
	
	public Set<Supplier> getSupplierList() {
		return supplierList;
	}

	public void setSupplierList(Set<Supplier> supplierList) {
		this.supplierList = supplierList;
	}
	
	public Admin()
	{
	}

}
