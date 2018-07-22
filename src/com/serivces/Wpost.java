package com.serivces;

public class Wpost {
int id;
String sender,msg,date;

public Wpost() {
	
}
public Wpost( int id ,String sender, String msg , String date) {
	this.id= id;
	this.date = date;
	this.sender = sender;
	this.msg = msg;
}

public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}
public String getSender() {
	return sender;
}
public void setSender(String sender) {
	this.sender = sender;
}
public String getMsg() {
	return msg;
}
public void setMsg(String msg) {
	this.msg = msg;
}

}

