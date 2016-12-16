<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit User ${user.name}</title>
    <div>
    <form name="edit-form" action="${pageContext.request.contextPath}/user/save" method="post">
        <label><input name="id" type="number" disabled="disabled" readonly="readonly" value="${user.id}"></label>
        <label><input name="name" type="text" value="${user.name}" title="type at least 2 symbols" required="required">Name: </label>
        <label><input name="age" type="number" value="${user.age}" title="type a number">Age: </label>
        <label><input name="admin" type="checkbox" value="${user.admin}" title="choose user status"></label>
        <label><input name="createdDate" type="text" value="${user.admin}" readonly="readonly" disabled="disabled"></label>
        <button name="edit" type="submit">Edit</button>
    </form>
    </div><br>
    <div>
        <form action="${pageContext.request.contextPath}/users" method="get">
            <input type="submit" value="Back"/>
        </form>
    </div>
</head>
<body>

</body>
</html>
