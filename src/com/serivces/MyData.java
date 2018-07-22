package com.serivces;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.Cookie;

import org.apache.catalina.connector.Response;

import com.sun.istack.internal.FinalArrayList;

public class MyData {

	Connection getConnection()
	{
		Connection cn=null;
		try
		{
		Class.forName("com.mysql.jdbc.Driver");
		cn=DriverManager.getConnection("jdbc:mysql://localhost/facebook?user=root&password=12345");
		}
		catch(Exception e)
		{
			
		}
		return cn;
	
	}
	
	public void saveWpost(Wpost w)
	{
		Connection cn=null;
		try
		{
			cn=getConnection();
			String str="insert into Wpost(sender,message , date) values(?,?,?)";
			PreparedStatement st=cn.prepareStatement(str);
			st.setString(1,w.getSender());
			st.setString(2,w.getMsg());
			st.setString(3,w.getDate());
			
			st.executeUpdate();
			
		}
		catch(Exception e)
		{
			System.out.print("Save post"+e.getMessage());
		}
		finally{
			try {
				cn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public ArrayList<String> getFriends(String email)
	{
		ArrayList<String> friends=new ArrayList<>();		
		Connection cn=null;
		try
		{
			cn=getConnection();
			String str="select * from friends where (sender=? or receiver=?) and status=1";
			PreparedStatement st=cn.prepareStatement(str);
			st.setString(1,email);
			st.setString(2,email);
			ResultSet rs=st.executeQuery();
			while(rs.next())
			{
				String sender=rs.getString(2);
				String rec=rs.getString(3);
				if(sender.equals(email))
					friends.add(rec);
				else
					friends.add(sender);
			
			}
		}
		catch(Exception e)
		{
			System.out.print("Get Friends"+e.getMessage());
		}
		finally{
			try {
				cn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return friends;
		
	}
	
	
	
	
	public ArrayList<Wpost> listWposts(String email)
	{
		ArrayList<Wpost> al=new ArrayList<>();
		ArrayList<String> friends=getFriends(email);
		friends.add(email);
		Connection cn=null;
		try
		{
			cn=getConnection();
			String str="select * from Wpost order by wid desc";
			PreparedStatement st=cn.prepareStatement(str);
			ResultSet rs=st.executeQuery();
			while(rs.next())
			{
				String sender=rs.getString(2);
				if(friends.contains(sender))
				{
					al.add(new Wpost(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4)));
					
				}
				
			}
		}
		catch(Exception e)
		{
			System.out.print("List wall"+e.getMessage());
		}
		finally{
			try {
				cn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return al;
	}
	
	public	ArrayList<Friend> getPendingFriends(String email)
	{
		ArrayList<Friend> al=new ArrayList<>();
		Connection cn=null;
		try
		{
			cn=getConnection();
			String str="select * from friends where receiver=? and status=0 order by fid desc";
			PreparedStatement st=cn.prepareStatement(str);
			st.setString(1,email);
			ResultSet rs=st.executeQuery();
			while(rs.next())
			{
				al.add(new Friend(rs.getInt(1),0,rs.getString(2),rs.getString(3)));
				
			}
		}
		catch(Exception e)
		{
			System.out.print("Get Pending"+e.getMessage());
		}
		finally{
			try {
				cn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return al;
	}
	
	public	ArrayList<User> getUser(String email)
	{
		ArrayList<User> al=new ArrayList<>();
		Connection cn=null;
		try
		{
			cn=getConnection();
			String str="select * from user where email=?";
			PreparedStatement st=cn.prepareStatement(str);
			st.setString(1,email);
			ResultSet rs=st.executeQuery();
			while(rs.next())
			{
			al.add(new User(rs.getString(2),rs.getString(3),rs.getString(5),rs.getString(4),rs.getString(6),rs.getString(7)));
			}
		}
		catch(Exception e)
		{
			System.out.print("Get Pending"+e.getMessage());
		}
		finally{
			try {
				cn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return al;
	}
	
	
	public	void UpdateUser(String email , User u)
	{
		Connection cn=null;
		try
		{
			cn=getConnection();
			String str="update user set (name,email,phone,password,dob gender) values (?,?,?,?,?,?) where email=?";
			PreparedStatement st=cn.prepareStatement(str);
			st.setString(1,u.getName());
			st.setString(2,u.getEmail());
			st.setString(3,u.getPhone());
			st.setString(4,u.getPass());
			st.setString(5,u.getDob());
			st.setString(6,u.getGender());
			st.setString(7,email);
			st.executeUpdate();
			
		}
		catch(Exception e)
		{
			System.out.print("Get Pending"+e.getMessage());
		}
		finally{
			try {
				cn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	
	
	
	
	
	public	void saveUser(User u)
	{
		Connection cn=null;
		try
		{
			cn=getConnection();
			String str="insert into user (name, email,phone,password,dob,gender) values(?,?,?,?,?,?)";
			PreparedStatement st=cn.prepareStatement(str);
			st.setString(1,u.getName());
			st.setString(2,u.getEmail());
			st.setString(3,u.getPhone());
			st.setString(4,u.getPass());
			st.setString(5,u.getDob());
			st.setString(6,u.getGender());
			
			st.executeUpdate();
			
			
			
		}
		catch(Exception e)
		{
			System.out.print("Save User"+e.getMessage());
		}
		finally{
			try {
				cn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
public	boolean isUser(String email,String pass)
	{
		Connection cn=null;
		try
		{
			cn=getConnection();
			String str="select * from user where email=? and password=?";
			PreparedStatement st=cn.prepareStatement(str);
			st.setString(1,email);
			st.setString(2,pass);
			ResultSet rs=st.executeQuery();
			if(rs.next())
			{
				return true;
			}
			else
				return false;
		}
		catch(Exception e)
		{
			System.out.print("Login"+e.getMessage());
		}
		finally{
			try {
				cn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
	}


public void saveFriendRequest(Friend f)
	{
		Connection cn=null;
		try
		{
			cn=getConnection();
			String str="insert into friends(sender,receiver) values(?,?)";
			PreparedStatement st=cn.prepareStatement(str);
			st.setString(1,f.getSender());
			st.setString(2,f.getRec());
			st.executeUpdate();
			
		}
		catch(Exception e)
		{
			System.out.print("Save Friend"+e.getMessage());
		}
		finally{
			try {
				cn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
public void acceptFriendRequest(int id)
	{
		Connection cn=null;
		try
		{
			cn=getConnection();
			String str="update friends set status=1 where fid=?";
			PreparedStatement st=cn.prepareStatement(str);
			st.setInt(1,id);
			st.executeUpdate();
			
		}
		catch(Exception e)
		{
			System.out.print("Accept"+e.getMessage());
		}
		finally{
			try {
				cn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

public void rejectFriendRequest(int id)
	{
		Connection cn=null;
		try
		{
			cn=getConnection();
			String str="delete from friends where fid=?";
			PreparedStatement st=cn.prepareStatement(str);
			st.setInt(1,id);
			st.executeUpdate();
			
		}
		catch(Exception e)
		{
			System.out.print("reject"+e.getMessage());
		}
		finally{
			try {
				cn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	
	
	
}