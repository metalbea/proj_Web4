<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
    <jsp:param name="title" value="Home"/>
</jsp:include>
<body onload="setStatus();openSocket();getFriendList();">
<jsp:include page="header.jsp">
    <jsp:param name="title" value="Home"/>
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
        <input type="hidden" id="userName" value="${user.getFirstName()}">
        <p id="status">online</p>
        <form method="post" action="Controller?action=LogOut">
            <p>
                <input type="submit" id="logoutbutton" value="Log Out" onclick="closeSocket();">
            </p>
        </form>
        <div class="container" id="statusDiv" style="float: left;width: 100%">
            <div id="formDiv">
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
            </div>
            <input type="button" name="statusButton" id="statusButton" onclick="setStatus()" value="Change status">
        </div>

        <div class="container" style="float: left;width: 100%">
            <table>
                <thead>
                <tr>
                    <td>Name</td>
                    <td>Status</td>
                </tr>
                </thead>
                <tbody id="friendListTable">

                </tbody>
            </table>
        </div>
            <label for="friendId">new friend</label>
            <input type="text" name="friendId" id="friendId">
            <input type="button" name="addFriendButton" onclick="addNewFriend()" value="add">
        <%--posts--%>
        <div class="container" style="float: left;width: 100%">
            <div class="row">
                <div class="col-md-6 col-md-offset-3 post" style="margin-left: 0px">
                    <h2>Waarom mogen er niet meer dan 3 Russen in 1 auto zitten</h2>
                    <p>Anders krijg je vierrussen</p>


                    <!-- comments section -->

                    <!-- comment form -->
                    <form class="clearfix" id="comment_form">
                        <textarea name="comment_text" id="comment_text1" class="form-control" cols="30"
                                  rows="3"></textarea>
                        <a>Score: </a><input type="text" id="points1">
                        <input type="button" value="Submit comment" id="submit_comment" onclick="send(1)"/>
                    </form>

                    <!-- Display total number of comments on this post  -->

                    <hr>
                    <!-- comments wrapper -->
                    <div id="comments-wrapper1" style="margin-left: 0px" id="com1">
                        <div class="comment clearfix">
                            <div class="comment-details">
                                <span class="comment-name">Melvine</span>
                                <span class="comment-date">7/10</span>
                                <p>This is the first reply to this post on this website.</p>

                            </div>
                        </div>
                        <div class="comment clearfix">
                            <div class="comment-details">
                                <span class="comment-name">John</span>
                                <span class="comment-date">6/10</span>
                                <p>Lmao</p>
                            </div>
                        </div>
                    </div>
                    <!-- // comments wrapper -->
                </div>
                <!-- // comments section -->
            </div>
        </div>

        <div class="container" style="float: left;width: 100%">
            <div class="row">
                <div class="col-md-6 col-md-offset-3 post" style="margin-left: 0px">
                    <h2>Ik ben de quarantaine beu</h2>
                    <p>Ik wil contact met mensen</p>


                    <!-- comments section -->

                    <!-- comment form -->
                    <form class="clearfix" id="comment_form">
                        <textarea name="comment_text" id="comment_text2" class="form-control" cols="30"
                                  rows="3"></textarea>
                        <a>Score: </a><input type="text" id="points2" name="points">
                        <input type="button" value="Submit comment" id="submit_comment" onclick="send(2)">
                    </form>

                    <!-- Display total number of comments on this post  -->

                    <hr>
                    <!-- comments wrapper -->
                    <div id="comments-wrapper2" style="margin-left: 0px">
                        <div class="comment clearfix">
                            <div class="comment-details">
                                <span class="comment-name">Melvine</span>
                                <span class="comment-date">Apr 24, 2018</span>
                                <p>This is the first reply to this post on this website.</p>

                            </div>
                        </div>
                    </div>
                </div>
                <!-- // comments wrapper -->
            </div>
            <!-- // comments section -->
        </div>

        <div class="container" style="float: left;width: 100%">
            <div class="row">
                <div class="col-md-6 col-md-offset-3 post" style="margin-left: 0px">
                    <h2>Kan iemand me helpen met web4</h2>
                    <p>Hoe werken websockets?</p>


                    <!-- comments section -->

                    <!-- comment form -->
                    <form class="clearfix" id="comment_form">
                        <textarea name="comment_text" id="comment_text3" class="form-control" cols="30"
                                  rows="3"></textarea>
                        <a>Score: </a><input type="text" id="points3">
                        <input type="button" value="Submit comment" id="submit_comment" onclick="send(3)"/>
                    </form>

                    <!-- Display total number of comments on this post  -->

                    <hr>
                    <!-- comments wrapper -->
                    <div id="comments-wrapper3" style="margin-left: 0px">
                        <div class="comment clearfix">
                            <div class="comment-details">
                                <span class="comment-name">Melvine</span>
                                <span class="comment-date">Apr 24, 2018</span>
                                <p>This is the first reply to this post on this website.</p>

                            </div>
                        </div>
                    </div>
                </div>
                <!-- // comments wrapper -->
            </div>
            <!-- // comments section -->
        </div>

        <div class="container" style="float: left;width: 100%">
            <div class="row">
                <div class="col-md-6 col-md-offset-3 post" style="margin-left: 0px">
                    <h2>Ik heb een manier gevonden om snel geld te verdienen</h2>
                    <p>Klik op <a href="https://www.youtube.com/watch?v=dQw4w9WgXcQ">deze link</a> om meer te weten te
                        komen</p>


                    <!-- comments section -->

                    <!-- comment form -->
                    <form class="clearfix" id="comment_form">
                        <textarea name="comment_text" id="comment_text4" class="form-control" cols="30"
                                  rows="3"></textarea>
                        <a>Score: </a><input type="text" id="points4">
                        <input type="button" value="Submit comment" id="submit_comment" onclick="send(4)"/>
                    </form>

                    <!-- Display total number of comments on this post  -->

                    <hr>
                    <!-- comments wrapper -->
                    <div id="comments-wrapper4" style="margin-left: 0px">
                        <div class="comment clearfix">
                            <span class="comment-name">Melvine</span>
                            <span class="comment-date">Apr 24, 2018</span>
                            <p>This is the first reply to this post on this website.</p>

                        </div>
                    </div>
                </div>
            </div>
            <!-- // comments wrapper -->
        </div>
        <!-- // comments section -->
        </div>

        <div class="container" style="float: left;width: 100%">
            <div class="row">
                <div class="col-md-6 col-md-offset-3 post" style="margin-left: 0px">
                    <h2>Iemand die mee op vakantie wilt</h2>
                    <p>Ik ga naar Boedapest, hoe meer zielen hoe meer vreugde.</p>


                    <!-- comments section -->

                    <!-- comment form -->
                    <form class="clearfix" id="comment_form">
                        <textarea name="comment_text" id="comment_text5" class="form-control" cols="30"
                                  rows="3"></textarea>
                        <a>Score: </a><input type="text" id="points5">
                        <input type="button" value="Submit comment" id="submit_comment" onclick="send(5)"/>
                    </form>

                    <!-- Display total number of comments on this post  -->

                    <hr>
                    <!-- comments wrapper -->
                    <div id="comments-wrapper5" style="margin-left: 0px">
                        <div class="comment clearfix">
                            <div class="comment-details">
                                <span class="comment-name">Melvine</span>
                                <span class="comment-date">Apr 24, 2018</span>
                                <p>This is the first reply to this post on this website.</p>

                            </div>
                        </div>
                    </div>
                </div>
                <!-- // comments wrapper -->
            </div>
            <!-- // comments section -->
        </div>

        <%--posts--%>
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
</c:choose></main>

<jsp:include page="footer.jsp">
    <jsp:param name="title" value="Home"/>
</jsp:include>
</body>
</html>