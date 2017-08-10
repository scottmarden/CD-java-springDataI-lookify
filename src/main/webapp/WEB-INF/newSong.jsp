<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Song</title>
</head>
<body>
	<div class="header">
		<h1>Add Song</h1>
		<a href="/dashboard">Dashboard</a>
	</div>
	<div class="content">
		<form:form action="/songs/new" method="POST" modelAttribute="song">
			<form:label path="title">Title
			<form:errors path="title"/>
			<form:input path="title"/></form:label>
			
			<form:label path="artist">Artist
			<form:errors path="artist"/>
			<form:input path="artist"/></form:label>
			
			<form:label path="rating">Rating
			<form:errors path="rating"/>
			<form:select path="rating">
				<form:option value="0" label="-Select-"/>	
				<form:option value="10" label="10"/>	
				<form:option value="9" label="9"/>	
				<form:option value="8" label="8"/>	
				<form:option value="7" label="7"/>	
				<form:option value="6" label="6"/>	
				<form:option value="5" label="5"/>	
				<form:option value="4" label="4"/>	
				<form:option value="3" label="3"/>	
				<form:option value="2" label="2"/>	
				<form:option value="1" label="1"/>	
			</form:select></form:label> 
			
			
			<input type="submit" value="Submit">
		</form:form>
	
	</div>
	
	
</body>
</html>