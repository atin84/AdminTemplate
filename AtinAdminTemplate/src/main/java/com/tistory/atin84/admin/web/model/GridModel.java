package com.tistory.atin84.admin.web.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
/**
* A custom POJO that will be automatically converted to JSON format.
* <p>
 
* We can use this to send generic messages to our JqGrid, whether a request is successful or not.
* Of course, you will use plain JavaScript to parse the JSON response.
*/
public class GridModel {
	 
	/**
	* true if successful.
	*/
	private Boolean success = true;
	 
	/**
	* Any custom message, i.e, 'Your request has been processed successfully!'
	*/
	private List<String> message = new ArrayList<String>();
	
	/**
	* Current page of the query
	*/
	private String page = "0";
	 
	/**
	* Total pages for the query
	*/
	private String total = "0";
	 
	/**
	* Total number of records for the query
	*/
	private String records = "0";
	 
	/**
	* An array that contains the actual objects
	*/
	private List<Map<String, Object>> rows;
	
	 
	public Boolean getSuccess() {
		return success;
	}
	 
	public void setSuccess(Boolean success) {
		this.success = success;
	}
	 
	public List<String> getMessage() {
		return message;
	}
	 
	public void setMessage(String message) {
		this.message.add(message);
	}
	
	public String getPage() {
		return page;
	}
		 
	public void setPage(String page) {
		this.page = page;
	}
	 
	public String getTotal() {
		return total;
	}
	 
	public void setTotal(String total) {
		this.total = total;
	}
	 
	public String getRecords() {
		return records;
	}
	 
	public void setRecords(String records) {
		this.records = records;
	}
	 
	public List<Map<String, Object>> getRows() {
		return rows;
	}
	 
	public void setRows(List<Map<String, Object>> rows) {
		this.rows = rows;
	}
	
	public String toString() {
		return "rows : " + this.rows;
	}
}
