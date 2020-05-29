<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" type="image/png" href="assets/images/logo.svg" />
    <title>Sobre</title>
    <link rel="stylesheet" href="assets/vendors/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/vendors/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="assets/vendors/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="assets/css/main.css">
</head>

<body>
    <c:import url="components/sobre.jsp" var="sobre" />
    <c:import url="components/footer.jsp" var="footer" />
    <div class="bg-default-dark">
        <div class="container">
            <div class="mt-4 mb-2">
                <nav class="row justify-content-between align-items-center navbar-content">
                    <div class="col-lg-3">
                        <div class="d-inline-block text-center">
                            <img src="assets/images/logo.svg" alt="" width="70" class="img-fluid" />
                            <strong class="text-uppercase m-0 title-logo d-block">pets hero</strong>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <nav class="nav justify-content-end">
                            <a class="nav-link text-white font-weight-bold active" href="contato.jsp">Contato</a>
                            <a class="nav-link text-white font-weight-bold" href="sobreFora.jsp">Sobre</a>
                            <span class="nav-link text-white font-weight-bold">|</span>
                            <span class="nav-link text-white pr-0">
                                <a href="login.jsp" class="btn btn-sm btn-menu-cadastrar text-uppercase text-white"
                                    style="border-color: #fff;">Login</a>
                                <a href="cadastrar.jsp" class="btn btn-sm btn-menu-cadastrar text-uppercase text-white"
                                    style="border-color: #fff;">cadastrar</a>
                            </span>
                        </nav>
                    </div>
                </nav>
            </div>
        </div>
    </div>
    ${sobre}
    ${footer}
</body>

</html>