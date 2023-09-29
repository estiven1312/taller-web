<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.util.Map" %>
<%
    Map<String, String> errors = (Map<String, String>) request.getAttribute("errors");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="<%=request.getContextPath()%>/assets/css/login.css" rel="stylesheet" />
    <link rel="icon" href="<%=request.getContextPath()%>/assets/img/Tesla_Logo.png">
    <title>Lambda Project</title>
</head>

<body>
    <div class="login-container card container m-auto container-md ">
        <form method="post" action="login">
            <div class="align-middle text-center">
                <h1 class="title-lambda  align-middle">LAMBDA</h1>
                <img class="logo-lambda" src="assets/img/lamda_logo.png">
            </div>
            <div class="mx-auto my-4 px-5 col-9">
                <div class="form-group">
                    <label class="label-text" for="exampleInputEmail">Usuario</label>
                    <input type="email" class="form-control input-box" id="exampleInputEmail" name="username" value="${param.get("username")}" aria-describedby="emailHelp"
                        placeholder="Ingrese Email">
                    <%
                    if(errors != null && errors.containsKey("usernameError")) {
                        out.println("<small style='color: red;'>" + errors.get("usernameError") + "</small>");
                    }
                    %>
                    <span>

                    </span>
                </div>
                <div class="form-group mt-3">
                    <label class="label-text" for="exampleInputPassword">Contraseña</label>
                    <input type="password" class="form-control input-box" name="password" id="exampleInputPassword" placeholder="Password">
                    <%
                        if(errors != null && errors.containsKey("passwordError")) {
                            out.println("<small style='color: red;'>" + errors.get("passwordError") + "</small>");
                        }
                    %>
                </div>
                <div class=" d-flex bd-highlight  mt-3">
                    <a href="#" class="recover-password">Recuperar contraseña</a>
                    <button type="submit" class=" ms-auto btn-login">Login</button>
                </div>
            </div>
            
            
        </form>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>

</body>

</html>