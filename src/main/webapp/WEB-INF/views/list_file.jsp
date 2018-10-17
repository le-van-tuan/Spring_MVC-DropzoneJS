<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" name="viewport"
          content="width=device-width, initial-scale=1">
    <title>Upload files</title>

    <link rel="stylesheet" type="text/css"
          href='<c:url value="/web-resources/libs/bootstrap-3.1.1/css/bootstrap.min.css"/>'>
    <link rel="stylesheet" type="text/css"
          href='<c:url value="/web-resources/libs/bootstrap-dialog/css/bootstrap-dialog.min.css"/>'>
    <link rel="stylesheet" type="text/css"
          href='<c:url value="/web-resources/css/style.css"/>'>

</head>
<body>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading text-center">
            <h3>Spring MVC Upload file Example</h3>
        </div>
        <div class="panel-body">

            <a class="btn btn-primary" href="home">
                <span class="glyphicon glyphicon-chevron-left"></span> Go Back For Re-Upload</a> <br>
            <br>
            <h4>List of All Uploaded Files</h4>

        </div>
        <table class="table table-hover table-condensed">
            <thead>
            <tr>
                <th width="5%">S.N</th>
                <th width="40%">File Name</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${filesName}" var="name" varStatus="loopCounter">
                <tr>
                    <td><c:out value="${loopCounter.count}" /></td>
                    <td><c:out value="${name.toString()}" /></td>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script type="text/javascript"
        src='<c:url value="/web-resources/libs/jquery/jquery-2.1.1.js"/>'></script>
<script type="text/javascript"
        src='<c:url value="/web-resources/libs/bootstrap-3.1.1/js/bootstrap.js"/>'></script>
</body>

</html>