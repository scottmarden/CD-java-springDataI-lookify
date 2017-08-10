<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Song Detail</title>
</head>
<body>
	<div class="header">
		<h1><c:out value="${song.title}" /></h1>
		<a href="/dashboard">Dashboard</a>
		<a href="songs/new">New Song</a>
	</div>
	<div class="content">
		<h4>Title: <c:out value="${song.title}" /></h4>
		<h4>Artist: <c:out value="${song.artist}" /></h4>
		<h4>Rating(1-10): <c:out value="${song.rating}" /></h4>
	</div>
	<div class="footer">
		<a href="/delete/${song.id}">Delete</a>
	</div>
</body>
</html>