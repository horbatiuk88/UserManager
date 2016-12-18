<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit User</title>

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
<h1 align="center">Edit User ${user.name}</h1>
<div class="container">
    <form action="${pageContext.request.contextPath}/user/save/${pageNumber}" method="post">
        <div class="form-group">
            <label for="id-line">ID: </label>
            <input class="form-control" name="id" type="number" readonly="readonly" value="${user.id}" id="id-line">
        </div>
        <div class="form-group">
            <label for="name-line">Name: </label>
            <input class="form-control" name="name" type="text" value="${user.name}" title="type at least 2 symbols" required="required"
                   id="name-line">
        </div>
        <div class="form-group">
            <label for="age-line">Age: </label>
            <input class="form-control" name="age" type="number" value="${user.age}" title="type a number" id="age-line" required="required">
        </div>
        <div class="check-box">
            <label for="admin-checkbox">ADMIN STATUS</label>
            <input name="admin" type="checkbox" checked="${user.admin}" title="choose user status" id="admin-checkbox">
        </div>
        <div class="form-group">
            <label for="createdDate">DATE OF CREATION: </label>
            <input class="form-control" name="createdDate" type="datetime" readonly="readonly" value="${user.createdDate}" typeof="TimeStamp"
                   id="createdDate">
        </div>
            <button class="btn btn-success" type="submit">Edit</button>
    </form>
</div>
<div>
    <form action="${pageContext.request.contextPath}/users/${pageNumber}" method="get">
        <button class="btn btn-link" type="submit">Back</button>
    </form>
</div>
</body>
</html>
