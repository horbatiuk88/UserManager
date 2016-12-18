<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User List</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
</head>
<body>
<div>
    <h1 class="text-center">User List</h1>
</div>

<c:url var="firstUrl" value="${pageContext.request.contextPath}/users/${1}"/>
<c:url var="lastUrl" value="${pageContext.request.contextPath}/users/${userList.totalPages}"/>
<c:url var="prevUrl" value="${pageContext.request.contextPath}/users/${currentIndex - 1}"/>
<c:url var="nextUrl" value="${pageContext.request.contextPath}/users/${currentIndex + 1}"/>

<div class="container">
    <ul class="pagination">
        <c:choose>
            <c:when test="${currentIndex == 1}">
                <li class="disabled"><a href="#">&lt;&lt;</a></li>
                <li class="disabled"><a href="#">&lt;</a></li>
            </c:when>
            <c:otherwise>
                <li><a href="${firstUrl}">&lt;&lt;</a></li>
                <li><a href="${prevUrl}">&lt;</a></li>
            </c:otherwise>
        </c:choose>
        <c:forEach var="i" begin="${beginIndex}" end="${endIndex}">
            <c:url var="pageUrl" value="/users/${i}"/>
            <c:choose>
                <c:when test="${i == currentIndex}">
                    <li class="active"><a href="${pageUrl}"><c:out value="${i}"/></a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="${pageUrl}"><c:out value="${i}"/></a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:choose>
            <c:when test="${currentIndex == userList.totalPages}">
                <li class="disabled"><a href="#">&gt;</a></li>
                <li class="disabled"><a href="#">&gt;&gt;</a></li>
            </c:when>
            <c:otherwise>
                <li><a href="${nextUrl}">&gt;</a></li>
                <li><a href="${lastUrl}">&gt;&gt;</a></li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>
<div class="container">
    <table class="table table-bordered">
        <thead>
        <tr class="active text-center lead">
            <td>ID</td>
            <td>NAME</td>
            <td>AGE</td>
            <td>ADMIN STATUS</td>
            <td>DATE OF CREATION</td>
            <td>DELETE</td>
            <td>EDIT</td>
        </tr>
        </thead>
        <tbody>
        <c:if test="${!empty userList}">
            <c:forEach items="${userList.content}" var="user">
                <tr class="text-center">
                    <td>${user.id}</td>
                    <td>${user.name}</td>
                    <td>${user.age}</td>
                    <td>${user.admin}</td>
                    <td>${fn:substringBefore(user.createdDate, ".")}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/user/delete/${user.id}/${userList.numberOfElements - 1 == 0 ? currentIndex - 1 : currentIndex}">Delete</a>
                    </td>
                    <td><a href="${pageContext.request.contextPath}/user/edit/${user.id}/${currentIndex}">Edit</a></td>
                </tr>
            </c:forEach>
        </c:if>
        </tbody>
    </table>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-6"><h3 style="padding-left:140px;">ADD NEW USER</h3>
            <div class="center-block">
                <form class="form-inline"
                      action="${pageContext.request.contextPath}/user/save/${userList.numberOfElements == 10 ? currentIndex + 1 : currentIndex}"
                      method="post">
                    <div class="form-group">
                        <label for="name-line">NAME: </label>
                        <input class="form-control" name="name" type="text" title="enter at least 2 symbols"
                               required="required"
                               id="name-line">
                    </div>
                    <div class="form-group">
                        <label for="age-line">AGE: </label>
                        <input class="form-control" name="age" type="number" title="enter a number" required="required"
                               id="age-line">
                    </div>
                    <div class="check-box">
                        <label for="admin-checkbox">ADMIN STATUS: </label>
                        <input name="admin" type="checkbox" title="choose if user has admin status" checked="true"
                               id="admin-checkbox">
                    </div>
                    <button class="btn btn-success" type="submit"><strong>Add</strong></button>
                </form>
            </div>
        </div>
        <div class="col-md-6">
            <div class="center-block">
                <h3 style="padding-left:90px;">SEARCH BY NAME</h3>
                <form class="form-inline"
                      action="${pageContext.request.contextPath}/user/findUser"
                      method="get">
                    <div class="form-group">
                        <label for="search-line">NAME: </label>
                        <input class="form-control" name="name" type="text" title="enter at least 2 symbols"
                               required="required"
                               id="search-line">
                    </div>
                    <button class="btn btn-success" type="submit"><strong>Search</strong></button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
