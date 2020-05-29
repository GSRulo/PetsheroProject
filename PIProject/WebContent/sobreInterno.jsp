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
    <!-- IMPORTS PAGES -->
    <c:import var="menu" url="components/menu.jsp" />
    <c:import var="sobre" url="components/sobre.jsp" />
    <c:import var="footer" url="components/footer.jsp" />
    <!--  -->
    ${menu}
    ${sobre}
    ${footer}
</body>

</html>