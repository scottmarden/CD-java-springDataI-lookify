<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Search Results</h1>
	
	<div class="header">
		<a href="/dashboard">Dashboard</a>
		<a href="songs/new">New Song</a>
	</div>
	
	<div class="content">
		<c:choose>
			<c:when test="${foundSongs != null}">
				<table cellspacing="15">
					<tr>
						<th>Title</th>
						<th>Artist</th>
						<th>Rating</th>
						<th>Actions</th>
					</tr>
				<c:forEach items="${foundSongs}" var="song">
					<tr>
						<td><a href="/songs/${song.id}"><c:out value="${song.title}" /></a></td>
						<td><c:out value="${song.artist}" /></td>
						<td><c:out value="${song.rating}" /></td>
						<td><a href="delete/${song.id}">Delete</a>
					</tr>
				</c:forEach>
				</table>
			</c:when>
			<c:otherwise>
				<h3><c:out value="${failedSearch}" /></h3>
			</c:otherwise>
				
		</c:choose>
	</div>
</body>
</html>