<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jonas
  Date: 12/03/2020
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<form method="post" action="Controller?action=ChangeStatus">
    <input type="radio" id="online" name="status" value="online" <c:if test="${sessionScope.get('status').equals('online')}">checked </c:if> >
    <label for="online">Online</label><br>
    <input type="radio" id="offline" name="status" value="offline" <c:if test="${sessionScope.get('status').equals('offline')}">checked </c:if>>
    <label for="offline">Offline</label><br>
    <input type="radio" id="away" name="status" value="away" <c:if test="${sessionScope.get('status').equals('away')}">checked </c:if>>
    <label for="away">Away</label><br>
    <input type="radio" id="other" name="status" value="other" <c:if test="${sessionScope.get('status').equals('other')}">checked </c:if>>
    <label for="other">Other</label>
    <input type="text" name="otherText" id="otherText" value="<c:if test="${sessionScope.get('status').equals('other')}"><c:out value="${sessionScope.otherText}"/></c:if>">
</form>
</html>
<%--
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
&lt;%&ndash;
  Created by IntelliJ IDEA.
  User: jonas
  Date: 12/03/2020
  Time: 21:29
  To change this template use File | Settings | File Templates.
&ndash;%&gt;
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<p id="chosenStatus"><c:out value="${sessionScope.status}"/></p>
<p id="chosenOtherText"><c:out value="${sessionScope.otherText}"/></p>
--%>

