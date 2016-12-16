<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User List</title>
</head>
<body>
    <div>
        <table>
            <thead>
                <tr>
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
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.name}</td>
                            <td>${user.age}</td>
                            <td>${user.admin}</td>
                            <td>${user.createdDate}</td>
                            <td><a href="/user/delete/${user.id}">Delete</a></td>
                            <td><a href="/user/edit">Edit</a></td>
                        </tr>
                    </c:forEach>
                </c:if>
            </tbody>
        </table>
    </div>
</body>
</html>
