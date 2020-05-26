<%@page import="model.Adocao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adoção</title>
    <link rel="stylesheet" href="assets/vendors/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/vendors/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="assets/vendors/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="assets/css/main.css">
</head>

<body>
    <% 
		@SuppressWarnings ("unchecked")
		ArrayList<Adocao> adocoes = (ArrayList<Adocao>) session.getAttribute("adocoes");
		Adocao adocao = (Adocao) session.getAttribute("adocao");
		int idUsuario = (int) session.getAttribute("idUsuario");
	%>
    <!-- IMPORTS PAGES -->
    <c:import var="menu" url="components/menu.jsp" />
    <c:import var="footer" url="components/footer.jsp" />
    <!--  -->
    ${menu}
    <section class="banner-adotar mask-bg d-flex align-items-center justify-content-center">
        <div class="container position-relative">
            <c:choose>
                <c:when test="${param.id ne null}">
                    <h2 class="text-white font-weight-bold text-center">
                        Obrigado por escolher um pet.
                    </h2>
                    <p class="text-white text-center">
                        Confirme os dados logo a baixo
                    </p>
                </c:when>
                <c:otherwise>
                    <h2 class="text-white font-weight-bold text-center">
                        Faça parte dessa campanaha e adote um pet
                    </h2>
                    <p class="text-white text-center">
                        Adote um pet e ajude
                    </p>
                </c:otherwise>
            </c:choose>

        </div>
        <a href="#ancora" class="ancora-banner">
            <i class="fas fa-arrow-circle-down"></i>
        </a>
    </section>

    <section class="container">
        <c:choose>
            <c:when test="${adocoes ne null }">
                <c:choose>
                    <c:when test="${adocoes.size() le 0 }">
                        <h2 class="mt-5">Nenhuma animal para adotar</h2>
                    </c:when>
                    <c:otherwise>
                        <h3 class="font-weight-bold mt-5 pt-5" id="ancora">
                            Lista de pets para adoção
                        </h3>
                        <hr class="line-title mt-0 mb-5" />

                        <form class="filtros">
                            <h5>Filtrar por: </h5>
                            <div class="row align-items-end">
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <label class="font-weight-bold">Idade: </label>
                                        <select name="idade" class="form-control" data-group="idade">
                                            <option value="" selected disabled>Selecione a idade</option>
                                            <option value="">Todos</option>
                                            <option value=".Filhote">Filhote</option>
                                            <option value=".Adulto">Adulto</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <label class="font-weight-bold">Sexo</label>
                                        <select name="sexo_animal" class="form-control" data-group="sexo">
                                            <option value="" selected disabled>Selecione o sexo</option>
                                            <option value="">Todos</option>
                                            <option value=".Macho">Macho</option>
                                            <option value=".Fêmea">Fêmea</option>
                                            <option value=".Desconhecido">Desconhecido</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <label class="font-weight-bold">Tamanho</label>
                                        <select name="tamanho" class="form-control" data-group="tamanho">
                                            <option value="" selected disabled>Selecione o tamanho</option>
                                            <option value="">Todos</option>
                                            <option value=".Pequeno">Pequeno</option>
                                            <option value=".Médio">Médio</option>
                                            <option value=".Grande">Grande</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <div class="grid mb-5">
                            <c:forEach items="${adocoes}" var="item">
                                <div class="my-5">
                                    <div
                                        class="row w-100 m-auto pets-filter ${item.idade} ${item.tamanho} ${item.getSexoPet().getSexo()}">
                                        <div class="col-lg-6">
                                            <img src="data:image/jpg;base64,${item.getBase64Image()}" alt=""
                                                class="img-fluid" />
                                        </div>
                                        <div class="col-lg-6">
                                            <nav>
                                                <div class="nav nav-tabs" id="nav-tab-${item.idAdocao}" role="tablist">

                                                    <a class="nav-item nav-link active"
                                                        id="nav-home-tab-${item.idAdocao}" data-toggle="tab"
                                                        href="#nav-home-${item.idAdocao}" role="tab"
                                                        aria-controls="nav-home-${item.idAdocao}" aria-selected="true">
                                                        Geral
                                                    </a>

                                                    <a class="nav-item nav-link" id="nav-descricao-tab-${item.idAdocao}"
                                                        data-toggle="tab" href="#nav-descricao-${item.idAdocao}"
                                                        role="tab" aria-controls="nav-descricao-${item.idAdocao}"
                                                        aria-selected="false">
                                                        Descrição
                                                    </a>
                                                    
                                                    
                                                    <a class="nav-item nav-link" id="nav-contato-tab-${item.idAdocao}"
                                                        data-toggle="tab" href="#nav-contato-${item.idAdocao}"
                                                        role="tab" aria-controls="nav-contato-${item.idAdocao}"
                                                        aria-selected="false">
                                                        Contato
                                                    </a>

                                                </div>
                                            </nav>
                                            <div class="tab-content" id="nav-tabContent">

                                                <div class="tab-pane fade show active" id="nav-home-${item.idAdocao}"
                                                    role="tabpanel" aria-labelledby="nav-home-tab">
                                                    <div class="py-3">
                                                        <p>
                                                            <strong>Idade: </strong> ${item.idade}
                                                        </p>
                                                        <p>
                                                            <strong>Cor: </strong> ${item.cor}
                                                        </p>
                                                        <p>
                                                            <strong>Tamanho: </strong> ${item.tamanho}
                                                        </p>
                                                        <p>
                                                            <strong>Data criação: </strong>
                                                            <fmt:formatDate pattern="dd/MM/yyyy"
                                                                value="${item.dataCriacao}" />
                                                        </p>
                                                        <p>
                                                            <strong>Sexo: </strong>
                                                            ${item.getSexoPet().getSexo()}
                                                        </p>
                                                        <p>
                                                            <strong>Adotado: </strong>
                                                            ${item.getStatus().getNameStatus()}
                                                        </p>
                                                    </div>
                                                </div>

                                                <div class="tab-pane fade" id="nav-descricao-${item.idAdocao}"
                                                    role="tabpanel" aria-labelledby="nav-descricao-tab">
                                                    <p class="py-3">${item.descricao}</p>
                                                </div>
                                                
                                                <div class="tab-pane fade" id="nav-contato-${item.idAdocao}"
                                                    role="tabpanel" aria-labelledby="nav-contato-tab">
                                                    <div class="py-3">
                                                    	<p><strong>Nome: </strong> ${item.nome}</p>
                                                    	<p><strong>Email: </strong> ${item.email}</p>
                                                    	<p><strong>Telefone: </strong> <span class="format-tel">${item.telefone}</span></p>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="mb-3">
                                                <c:choose>
                                                    <c:when test="${idUsuario eq item.fkUsuario }">
                                                        <div class="alert alert-info" role="alert">
                                                            <strong>
                                                                <i class="fas fa-info-circle"></i> Você não pode adotar
                                                                um
                                                                pet que você mesmo cadastrou!
                                                            </strong>
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a href="adotarPet?id=${item.idAdocao}"
                                                            class="btn btn-first">Adotar</a>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div id="error-filter"></div>
                    </c:otherwise>
                </c:choose>
            </c:when>
            <c:when test="${param.id ne null}">
                <div class="my-5">
                    <h3 class="font-weight-bold mt-5 pt-5" id="ancora">
                        Confirmar adoção
                    </h3>
                    <hr class="line-title mt-0 mb-5" />
                    <div class="row">
                        <div class="col-lg-6">
                            <img src="data:image/jpg;base64,${adocao.getBase64Image()}" alt="" class="img-fluid" />
                        </div>
                        <div class="col-lg-6">
                            <nav>
                                <div class="nav nav-tabs" id="nav-tab-${adocao.idAdocao}" role="tablist">

                                    <a class="nav-item nav-link active" id="nav-home-tab-${adocao.idAdocao}"
                                        data-toggle="tab" href="#nav-home-${adocao.idAdocao}" role="tab"
                                        aria-controls="nav-home-${adocao.idAdocao}" aria-selected="true">
                                        Geral
                                    </a>

                                    <a class="nav-item nav-link" id="nav-descricao-tab-${adocao.idAdocao}"
                                        data-toggle="tab" href="#nav-descricao-${adocao.idAdocao}" role="tab"
                                        aria-controls="nav-descricao-${adocao.idAdocao}" aria-selected="false">
                                        Descrição
                                    </a>
                                    
                                    <a class="nav-item nav-link" id="nav-contato-tab-${adocao.idAdocao}"
                                        data-toggle="tab" href="#nav-contato-${adocao.idAdocao}" role="tab"
                                        aria-controls="nav-contato-${adocao.idAdocao}" aria-selected="false">
                                        Contato
                                    </a>

                                </div>
                            </nav>
                            <div class="tab-content" id="nav-tabContent">

                                <div class="tab-pane fade show active" id="nav-home-${adocao.idAdocao}" role="tabpanel"
                                    aria-labelledby="nav-home-tab">
                                    <div class="py-3">
                                        <p>
                                            <strong>Idade: </strong> ${adocao.idade}
                                        </p>
                                        <p>
                                            <strong>Cor: </strong> ${adocao.cor}
                                        </p>
                                        <p>
                                            <strong>Tamanho: </strong> ${adocao.tamanho}
                                        </p>
                                        <p>
                                            <strong>Data criação: </strong>
                                            <fmt:formatDate pattern="dd/MM/yyyy" value="${adocao.dataCriacao}" />
                                        </p>
                                        <p>
                                            <strong>Sexo: </strong>
                                            ${adocao.getSexoPet().getSexo()}
                                        </p>
                                        <p>
                                            <strong>Adotado: </strong>
                                            ${adocao.getStatus().getNameStatus()}
                                        </p>
                                    </div>
                                </div>

                                <div class="tab-pane fade" id="nav-descricao-${adocao.idAdocao}" role="tabpanel"
                                    aria-labelledby="nav-descricao-tab">
                                    <p class="py-3">${adocao.descricao}</p>
                                </div>
                                
                                <div class="tab-pane fade" id="nav-contato-${adocao.idAdocao}" role="tabpanel"
                                    aria-labelledby="nav-contato-tab">
                                    <div class="py-3">
                                    	<p><strong>Nome: </strong> ${adocao.nome}</p>
                                    	<p><strong>Email: </strong> ${adocao.email}</p>
                                    	<p><strong>Telefone: </strong> <span class="format-tel">${adocao.telefone}</span></p>
                                    </div>
                                </div>

                            </div>
                            <div class="mb-3">
                                <c:choose>
                                    <c:when test="${idUsuario eq adocao.fkUsuario }">
                                        <div class="alert alert-info" role="alert">
                                            <strong>
                                                <i class="fas fa-info-circle"></i> Você não pode adotar um pet que você
                                                mesmo cadastrou!
                                            </strong>
                                        </div>
                                        <a href="adotarPet" class="btn btn-block btn-first">Voltar</a>
                                    </c:when>
                                    <c:otherwise>
                                        <form action="adotarPet" method="post">
                                            <input type="hidden" name="idUsuario" value="${idUsuario}" />
                                            <input type="hidden" name="idAdocao" value="${adocao.idAdocao}" />
                                            <button type="submit" class="btn btn-first">Confirmar</button>
                                            <a href="adotarPet" class="btn btn-first">Voltar</a>
                                        </form>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </c:when>
        </c:choose>
    </section>
    ${footer}

    <script type="text/javascript" src="assets/vendors/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="assets/vendors/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="assets/vendors/jqueryMask/jquery.mask.min.js"></script>
    <script src="assets/vendors/isotope/isotope.pkgd.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".ancora-banner").click(function (e) {
                e.preventDefault();
                var alvo = $(this).attr("href");
                $('html, body').animate({
                    scrollTop: $(alvo).offset().top
                }, 500);
            });
            // FILTROS
            var $grid = $('.grid').isotope({
                itemSelector: '.pets-filter'
            });
            
            $(".format-tel").mask("(00) 00000-0000");
            
            var filters = {};
            $('.filtros').find('select').on('change', function (event) {
                var $select = $(event.target);
                // get group key
                var filterGroup = $select.attr('data-group');
                // set filter for group
                filters[filterGroup] = event.target.value;
                // combine filters
                var filterValue = concatValues(filters);
                // set filter for Isotope
                $grid.isotope({
                    filter: filterValue
                });
                var visibleItemsCount = $grid.data('isotope').filteredItems.length;
               	if(visibleItemsCount <= 0){
               		var template = [
               			'<div class="text-center my-5">',
               			'<h3 class="font-weight-bold">Nenhum pet encontrado</h3>',
               			'<i class="fas fa-paw h1"></i>',
               			'</div>'
               		].join("");
               		$("#error-filter").html(template);
               	}else{
               		$("#error-filter").html("");
               	}
            });

            function concatValues(obj) {
                var value = '';
                for (var prop in obj) {
                    value += obj[prop];
                }
                return value;
            }
        });
    </script>
</body>

</html>