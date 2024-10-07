package kr.or.gaw.dto;

import java.sql.Date;

public class ClientDTO {

	private String client_id;
	private String name;
	private String location;
	private String contact;
	private int phone;
	private String email;
	private Date create_at;
	
	public String getClient_id() {
		return client_id;
	}
	public void setClient_id(String client_id) {
		this.client_id = client_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getCreate_at() {
		return create_at;
	}
	public void setCreate_at(Date create_at) {
		this.create_at = create_at;
	}
	
	@Override
	public String toString() {
		return "ClientDTO [client_id=" + client_id + ", name=" + name + ", location=" + location + ", contact="
				+ contact + ", phone=" + phone + ", email=" + email + ", create_at=" + create_at + "]";
	}
	
}
