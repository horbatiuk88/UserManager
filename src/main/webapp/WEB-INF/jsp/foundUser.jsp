<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>found User</title>
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
<h1 align="center">Found users with name ${foundUsers[0].name}</h1>
<div class="container">
    <div class="container">
        <table class="table table-bordered">
            <thead>
            <tr class="active text-center lead">
                <td>ID</td>
                <td>NAME</td>
                <td>AGE</td>
                <td>ADMIN STATUS</td>
                <td>DATE OF CREATION</td>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${foundUsers}" var="user">
                <tr class="text-center">
                    <td>${user.id}</td>
                    <td>${user.name}</td>
                    <td>${user.age}</td>
                    <td>${user.admin}</td>
                    <td>${fn:substringBefore(user.createdDate, ".")}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <button class="btn btn-link" onclick="window.location.href='${pageContext.request.contextPath}/users/1'">Back to
        user list
    </button>
</div>
</body>
</html>
