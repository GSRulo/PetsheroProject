<%@page import="model.Adocao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" type="image/png" href="assets/images/logo.svg" />
    <title>Home</title>
    <link rel="stylesheet" href="assets/vendors/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/vendors/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="assets/vendors/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="assets/vendors/slick/css/slick.min.css">
    <link rel="stylesheet" href="assets/vendors/slick/css/slick-theme.min.css">
    <link rel="stylesheet" href="assets/css/main.css">
</head>

<body>
    <!-- IMPORTS PAGES -->
    <c:import var="menu" url="components/menu.jsp" />
    <c:import var="footer" url="components/footer.jsp" />
    <!--  -->
    <!-- USUARIO LOGADO -->
    ${menu}
    <div class="main-carousel banner-home">
        <div class="banner banner_01 mask-bg molde-banner">
            <div class="container h-100">
                <div class="row h-100 justify-content-end align-items-center">
                    <div class="col-lg-6">
                        <h2 class="text-uppercase text-white font-weight-bold">Sobre o Projeto</h2>
                        <p class="my-4 text-white">
                            A "Pet's Hero" é uma plataforma onde você pode adotar um animal, criar denúncias de maus
                            tratos a animais e caso seja uma ONG temos um perfil especifico para que possam ser criadas
                            contribuições, para assim, receber um apoio financeiro das pessoas.
                        </p>
                        <a href="sobreInterno.jsp" class="btn btn-first rounded-pill">Saiba mais</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- CONTEUDO -->
    <section class="container">
        <div class="mt-5 mb-3">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <img src="assets/images/thumb-gato.jpg" class="img-fluid" alt="" />
                </div>
                <div class="col-lg-6">
                    <h3 class="mt-5 text-uppercase font-weight-bold">Por que eu devo adotar um animal?</h3>
                    <p class="my-4">
                        Adotar um animal é valorizar a vida. Um cão ou gato é capaz de sentir emoções
                        como dor, alegria e excitação, por isso, sofre tanto quanto nós, humanos.
                        É recuperar uma vida, literalmente, jogada fora. Ao adotar um animal carente,
                        você ensina ao seu filho, às crianças com quem você convive, verdadeiros
                        valores de responsabilidade, comprometimento e, sobretudo, humanidade.
                    </p>
                    <a href="adotarPet" class="btn btn-first">Adotar um pet</a>
                </div>
            </div>
        </div>
        <div class="mt-5 mb-3">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <h3 class="mt-5 text-uppercase font-weight-bold">Denuncie maus tratos de animais</h3>
                    <p class="my-4">
                        Você sabia que maus tratos aos animais é crime? Você sabia que esses
                        crimes podem dar de três meses a um ano de detenção?
                        Não deixe que os maus tratos passem batido, denuncie e cuide dos pets amados.
                    </p>
                    <a href="denuncia" class="btn btn-danger font-roboto text-white">Denuncie</a>
                </div>
                <div class="col-lg-6">
                    <img src="assets/images/thumb-dog.jpeg" class="img-fluid" alt="" />
                </div>
            </div>
        </div>
    </section>

    <!-- SLIDER -->
    <c:choose>
        <c:when test="${adocoesLimit.size() gt 0}">
            <div class="shape-dark mb-5">
                <div class="container">
                    <div class="mt-5">
                        <div class="row justify-content-between align-items-center">
                            <div class="col-lg-6">
                                <h3 class="font-weight-bold">Lista de pets para adoção</h3>
                            </div>
                            <div class="col-lg-2">
                                <a href="adotarPet" class="btn btn-block btn-gradiente">Ver mais <i
                                        class="fas fa-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="my-5 position-relative carousel-pets">
                        <span class="prev h2 m-0 text-default arrows">
                            <i class="fas fa-arrow-circle-left"></i>
                        </span>
                        <span class="next h2 m-0 text-default arrows">
                            <i class="fas fa-arrow-circle-right"></i>
                        </span>
                        <div class="multiple-items">
                            <c:forEach items="${adocoesLimit}" var="item">
                                <div class="mr-2">
                                    <div class="thumb-slider"
                                        style="background-image: url('data:image/jpg;base64,${item.getBase64Image()}')">
                                    </div>
                                    <div class="my-2">
                                        <div class="font-roboto">
                                            <p class="mb-0">
                                                <strong>Idade: </strong>
                                                <c:out value="${item.idade}" />
                                            </p>
                                            <p class="mb-0">
                                                <strong>Sexo: </strong>
                                                <c:out value="${item.getSexoPet().getSexo()}" />
                                            </p>
                                            <p class="mb-0">
                                                <strong>Tipo: </strong>
                                                <c:out value="${item.tipo}" />
                                            </p>
                                        </div>
                                        <div class="my-2">
                                            <c:choose>
                                                <c:when test="${idUsuario eq item.fkUsuario }">
                                                    <div class="alert alert-info" role="alert">
                                                        <strong class="small font-weight-bold">
                                                            <i class="fas fa-info-circle"></i> Você não pode adotar um
                                                            pet que você mesmo cadastrou!
                                                        </strong>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="adotarPet?id=${item.idAdocao}"
                                                        class="btn btn-first btn-block">Adotar</a>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </c:when>
    </c:choose>

    <!--  -->

    ${footer}
    <!-- FIM -->

    <script type="text/javascript" src="assets/vendors/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="assets/vendors/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="assets/vendors/slick/js/slick.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.main-carousel').slick();

            $('.multiple-items').slick({
                dots: true,
                infinite: true,
                speed: 300,
                slidesToShow: 4,
                prevArrow: $(".prev"),
                nextArrow: $(".next"),
                responsive: [{
                        breakpoint: 1024,
                        settings: {
                            slidesToShow: 3,
                            slidesToScroll: 3,
                            infinite: true,
                            dots: true
                        }
                    },
                    {
                        breakpoint: 600,
                        settings: {
                            slidesToShow: 2,
                            slidesToScroll: 2
                        }
                    },
                    {
                        breakpoint: 480,
                        settings: {
                            slidesToShow: 1,
                            slidesToScroll: 1
                        }
                    }
                ]
            });
        });
    </script>
</body>

</html>