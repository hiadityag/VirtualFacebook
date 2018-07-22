package com.serivces;

public class User {
	int uid;


String email,pass ,name,gender,phone,dob;

public User() {
	
}

public User(String name, String email, String pass, String phone,String dob, String gender) {
    this.email = email;
	this.pass = pass;
	this.name = name;
	this.gender = gender;
	this.dob= dob;
	this.phone= phone;
}

public int getUid() {
	return uid;
}

public void setUid(int uid) {
	this.uid = uid;
}
public String getPhone() {
	return phone;
}

public void setPhone(String phone) {
	this.phone = phone;
}

public String getDob() {
	return dob;
}

public void setDob(String dob) {
	this.dob = dob;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getPass() {
	return pass;
}

public void setPass(String pass) {
	this.pass = pass;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getGender() {
	return gender;
}

public void setGender(String gender) {
	this.gender = gender;
}


	
}
