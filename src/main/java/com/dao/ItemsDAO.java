package com.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.db.DBUtil;
import com.entity.Items;

public class ItemsDAO {
	public ArrayList<Items> getAllItems() {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<Items> list = new ArrayList<Items>(); 
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from items;"; 
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Items item = new Items();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setOrigin(rs.getString("origin"));
				item.setNumber(rs.getInt("number"));
				item.setPrice(rs.getFloat("price"));
				item.setPicture(rs.getString("picture"));
				item.setDescription(rs.getString("description"));
				list.add(item);
			}
			return list; 
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			closeSrc(rs,stmt,conn);
		}

	}
	public Items getItemsById(int id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from items where id=?;"; 
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			if (rs.next()) {
				Items item = new Items();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setOrigin(rs.getString("origin"));
				item.setNumber(rs.getInt("number"));
				item.setPrice(rs.getFloat("price"));
				item.setPicture(rs.getString("picture"));
				item.setDescription(rs.getString("description"));
				return item;
			} else {
				return null;
			}

		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			closeSrc(rs,stmt,conn);

		}
	}
	private void closeSrc(ResultSet rs,PreparedStatement stmt,Connection conn)
	{
		if (rs != null) {
			try {
				rs.close();
				rs = null;
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		// 
		if (stmt != null) {
			try {
				stmt.close();
				stmt = null;
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
	}
	

}

