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
    <h1 align="center">User List</h1>
</div>
<div class="container">
    <table class="table table-bordered">
        <thead>
        <tr class="active text-center lead">
            <td>ID</td>
            <td>NAME</td>
            <td>AGE</td>
            <td>USER STATUS</td>
            <td>DATE OF CREATION</td>
            <td>DELETE</td>
            <td>EDIT</td>
        </tr>
        </thead>
        <tbody>
        <c:if test="${!empty userList}">
            <c:forEach items="${userList}" var="user">
                <jsp:useBean id="user" class="ua.horbatiuk88.usermanager.model.User"/>
                <tr class="text-center">
                    <td>${user.id}</td>
                    <td>${user.name}</td>
                    <td>${user.age}</td>
                    <td>${user.admin}</td>
                    <td>${fn:substringBefore(user.createdDate, ".")}</td>
                    <td><a href="/user/delete/${user.id}">Delete</a></td>
                    <td><a href="/user/edit/${user.id}">Edit</a></td>
                </tr>
            </c:forEach>
        </c:if>
        </tbody>
    </table>
</div>
<div class="container">
    <div><h3 style="padding-left:140px;">ADD NEW USER</h3></div>
    <form class="form-inline" action="${pageContext.request.contextPath}/user/save" method="post">
        <div class="form-group">
            <label for="name-line">NAME: </label>
            <input class="form-control" name="name" type="text" title="enter at least 2 symbols" required="required"
                   id="name-line">
        </div>
        <div class="form-group">
            <label for="age-line">AGE: </label>
            <input class="form-control" name="age" type="number" title="enter a number" required="required"
                   id="age-line">
        </div>
        <div class="check-box">
            <label for="admin-checkbox">ADMIN STATUS: </label>
            <input name="admin" type="checkbox" title="choose user status" checked="true" id="admin-checkbox">
        </div>
        <button class="btn btn-success" type="submit"><strong>Add</strong></button>
    </form>
</div>
</body>
</html>
