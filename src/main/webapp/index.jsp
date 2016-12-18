<html>
<head>
    <title>User Manager</title>

    <style>
        .img-wrapper {
            position: relative;
        }

        .img-overlay {
            position: absolute;
            top: 0;
            bottom: 450px;
            left: 5px;
            right: 0;
            text-align: center;
        }

        .img-overlay:before {
            content: ' ';
            display: block;
            /* adjust 'height' to position overlay content vertically */
            height: 50%;
        }
    </style>


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
    <div class="container">
        <div align="center" class="img-wrapper">
            <img width="50%" src="http://www.publicdomainpictures.net/pictures/50000/velka/computer-silhouette.jpg" class="img-responsive" alt="User Manager">
            <div class="img-overlay">
                <button style="height: 260px; width: 370px; border-radius: 10%" class="btn btn-md btn-success" onclick="window.location.href='${pageContext.request.contextPath}/users/1'">
                    <span style="color: darkorange"><strong><h3>Horbatiuk88 presents</h3><br> <h4>CRUD WEB APPLICATION</h4><br>USER MANAGER V1</strong></span></button>
            </div>
        </div>
    </div>
</body>
</html>
