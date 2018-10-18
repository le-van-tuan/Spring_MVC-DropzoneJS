<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                           <h3>Spring MVC Upload File Example</h3>
                     </div>
                     <div class="panel-body">
                           <div>
                                  <form id="dropzone-form" class="dropzone"
                                         enctype="multipart/form-data">

                                         <div class="dz-default dz-message file-dropzone text-center well col-sm-12">
                                                 <span class="glyphicon glyphicon-paperclip"></span> <span>
                                                       To attach files, drag and drop here</span><br>
                                                <span>OR</span><br>
                                                <span>Just Click</span>
                                         </div>

                                         <div class="dropzone-previews"></div>
                                  </form>
                                  <hr>
                                  <button id="upload-button" class="btn btn-primary">
                                         <span class="glyphicon glyphicon-upload"></span> Upload To Server
                                  </button>
                                  <a class="btn btn-primary pull-right" href="list-file"> <span
                                         class="glyphicon glyphicon-eye-open"></span> View All Uploads
                                  </a>
                           </div>
                     </div>
              </div>
               <div class="panel-body">
                    <h4>Your Uploaded Images</h4>
                    <img src="data:image/jpeg;base64,${image}" alt="..." width="200" height="200">
                    <img src="data:image/jpg;base64,<c:out value='${bean.imageByteArrayString}'/>" />

                    https://stackoverflow.com/questions/10066349/spring-display-image-on-jsp-file
                    https://stackoverflow.com/questions/10510416/convert-base64-byte-array-to-an-image
                    https://stackoverflow.com/questions/4112686/how-to-use-servlets-and-ajax

                    http://api.jquery.com/serialize/

                        <table>
                                <c:forEach items="${products}" var="product">
                                    <tr>
                                        <td>${product.id}</td>
                                        <td><c:out value="${product.name}" /></td>
                                        <td><fmt:formatNumber value="${product.price}" type="currency" currencyCode="USD" /></td>
                                    </tr>
                                </c:forEach>
                            </table>

                       //TODO show the uploaded image here : using jstl foreach
                       //TODO delete image here : using ajax and jquery (delete cache and delete html)
               </div
       </div>

       <script type="text/javascript"
              src='<c:url value="/web-resources/libs/jquery/jquery-2.1.1.js"/>'></script>
       <script type="text/javascript"
              src='<c:url value="/web-resources/libs/bootstrap-3.1.1/js/bootstrap.js"/>'></script>
       <script type="text/javascript"
              src='<c:url value="/web-resources/libs/bootstrap-dialog/js/bootstrap-dialog.min.js"/>'></script>
       <script type="text/javascript"
              src='<c:url value="/web-resources/libs/dropzone.js"/>'></script>
       <script type="text/javascript"
              src='<c:url value="/web-resources/js/app.js"/>'></script>
</body>
</html>