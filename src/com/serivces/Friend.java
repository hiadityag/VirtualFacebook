package com.serivces;


public class Friend {
int id,status;
String sender,rec;
public Friend() {

}
public Friend(int id, int status, String sender, String rec) {
	super();
	this.id = id;
	this.status = status;
	this.sender = sender;
	this.rec = rec;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getStatus() {
	return status;
}
public void setStatus(int status) {
	this.status = status;
}
public String getSender() {
	return sender;
}
public void setSender(String sender) {
	this.sender = sender;
}
public String getRec() {
	return rec;
}
public void setRec(String rec) {
	this.rec = rec;
}
}

