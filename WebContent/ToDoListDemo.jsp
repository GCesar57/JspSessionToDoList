<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<!-- 1. Create the HTML Form -->
<form action="ToDoListDemo.jsp">
	Add New Item: <input type="text" name="theItem">
	<input type="submit" name="submit">
</form>
<hr>
<p>Items entered:</p>
<%-- <%= request.getParameter("theItem")  %> --%>
<!-- 2. Add New items into the To Do List -->
<%
	//Get the to do list from the session
	List<String>items = (List<String>)session.getAttribute("myToDoList");
	//if the to do list does not exist, we create a new one
	if(items==null){
		items = new ArrayList<String>();
		session.setAttribute("myToDoList", items);
	}//
	//see if there is a form data to add.
	String theItem = request.getParameter("theItem");
	if(theItem != null){
		items.add(theItem);
	}//
%>
<!-- 3. Display All "To Do" list item form session -->
<b>To Do List Items:</b>
<ol>
<%
for(String temp: items){
	out.print("<li>"+temp+"</li>");
}//
%>
</ol>
</body>
</html>
