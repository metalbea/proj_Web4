<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html >
<jsp:include page="head.jsp">
	<jsp:param name="title" value="Home" />
</jsp:include>
<body onload="setStatus()">
	<jsp:include page="header.jsp">
		<jsp:param name="title" value="Home" />
	</jsp:include>
	<main>
<c:if test="${errors.size()>0 }">
	<div class="danger">
		<ul>
			<c:forEach var="error" items="${errors }">
				<li>${error }</li>
			</c:forEach>
		</ul>
	</div>
</c:if> <c:choose>
	<c:when test="${user!=null}">
		<p>Welcome ${user.getFirstName()}!</p>
		<form method="post" action="Controller?action=LogOut">
			<p>
				<input type="submit" id="logoutbutton" value="Log Out">
			</p>
		</form>
		<p id="status">online</p>
		<div id="statusDiv">
			<%--<form method="post" action="Controller?action=ChangeStatus">
				<input type="radio" id="online" name="status" value="online" <c:if test="${sessionScope.get('status').equals('online')}">checked </c:if> >
				<label for="online">Online</label><br>
				<input type="radio" id="offline" name="status" value="offline" <c:if test="${sessionScope.get('status').equals('offline')}">checked </c:if>>
				<label for="offline">Offline</label><br>
				<input type="radio" id="away" name="status" value="away" <c:if test="${sessionScope.get('status').equals('away')}">checked </c:if>>
				<label for="away">Away</label><br>
				<input type="radio" id="other" name="status" value="other" <c:if test="${sessionScope.get('status').equals('other')}">checked </c:if>>
				<label for="other">Other</label>
				<input type="text" name="otherText" value="<c:if test="${sessionScope.get('status').equals('other')}"><c:out value="${sessionScope.otherText}"/></c:if>">
				<input type="submit" value="Change status">
			</form>--%>
		</div>
		<input type="button" name="statusButton" id="statusButton" onclick="setStatus()" value="Change status">
	</c:when>
	<c:otherwise>
		<form method="post" action="Controller?action=LogIn">
			<p>
				<label for="email">Your email </label>
				<input type="text" id="email" name="email" value="jan@ucll.be">
			</p>
			<p>
				<label for="password">Your password</label>
				<input type="password" id="password" name="password" value="t">
			</p>
			<p>
				<input type="submit" id="loginbutton" value="Log in">
			</p>
		</form>
	</c:otherwise>
</c:choose> </main>

	<jsp:include page="footer.jsp">
		<jsp:param name="title" value="Home" />
	</jsp:include>
</body>
</html>