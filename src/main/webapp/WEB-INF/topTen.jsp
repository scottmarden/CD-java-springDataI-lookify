<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Top Songs</title>
</head>
<body>
	<div class="header">
		<h1>Top Songs</h1>
		<a href="/dashboard">Dashboard</a>
		<a href="songs/new">New Song</a>
	</div>
	<div class="content">
		<table cellspacing="15">
			<tr>
				<th>Title</th>
				<th>Artist</th>
				<th>Rating</th>
				<th>Actions</th>
			</tr>
		<c:forEach items="${topTen}" var="song">
			<tr>
				<td><a href="/songs/${song.id}"><c:out value="${song.title}" /></a></td>
				<td><c:out value="${song.artist}" /></td>
				<td><c:out value="${song.rating}" /></td>
			</tr>
		</c:forEach>
		</table>
	</div>

</body>
</html>