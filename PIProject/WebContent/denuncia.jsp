<%@page import="model.Reports"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" type="image/png" href="assets/images/logo.svg" />
    <title>Denúncias</title>
    <link rel="stylesheet" href="assets/vendors/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/vendors/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="assets/vendors/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="assets/css/main.css">
</head>

<body>
    <!-- IMPORTS PAGES -->
    <c:import var="menu" url="components/menu.jsp" />
    <c:import var="footer" url="components/footer.jsp" />
    <!--  -->
    ${menu}
    <section class="banner-reports mask-bg d-flex align-items-center justify-content-center">
        <div class="container position-relative">
            <h2 class="text-white font-weight-bold text-center">
                Denuncie maus-tratos ou crueldade contra animais.
            </h2>
        </div>
    </section>
    <section class="container">

        <c:choose>
            <c:when test="${param.successEdit eq true }">
                <div class="alert alert-success my-5 p-5 text-center" role="alert">
                    <h2 class="font-weight-bold"><i class="fas fa-check-circle"></i></h2>
                    <h3 class="font-weight-bold">Denúncia atualizada com sucesso.</h3>
                    <a href="denuncia" class="btn btn-first">Ver denúncias</a>
                </div>
            </c:when>
            <c:when test="${param.errorEdit eq true }">
                <div class="alert alert-danger my-5 p-5 text-center" role="alert">
                    <h2 class="font-weight-bold"><i class="fas fa-times-circle"></i></h2>
                    <h3 class="font-weight-bold">Denúncia não atualizada.</h3>
                    <a href="denuncia" class="btn btn-first">Atualizar novamente</a>
                </div>
            </c:when>
            <c:when test="${param.success eq true}">
                <div class="alert alert-success my-5 p-5 text-center" role="alert">
                    <h2 class="font-weight-bold"><i class="fas fa-check-circle"></i></h2>
                    <h3 class="font-weight-bold">Denúncia cadastrada com sucesso.</h3>
                    <p>Obrigado por denúnciar, seus dados serão mantidos em sigilo.</p>
                    <a href="denuncia" class="btn btn-first">Ver denúncias</a>
                </div>
            </c:when>
            <c:when test="${param.error eq true}">
                <div class="alert alert-danger my-5 p-5 text-center" role="alert">
                    <h2 class="font-weight-bold"><i class="fas fa-times-circle"></i></h2>
                    <h3 class="font-weight-bold">Denúncia não cadastrada.</h3>
                    <p>Por favor, tente novamente.</p>
                    <a href="denuncia" class="btn btn-first">Cadastrar novamente</a>
                </div>
            </c:when>
            <c:when test="${param.successDelete eq true}">
                <div class="alert alert-success my-5 p-5 text-center" role="alert">
                    <h2 class="font-weight-bold"><i class="fas fa-check-circle"></i></h2>
                    <h3 class="font-weight-bold">Denúncia deletada com sucesso.</h3>
                    <a href="denuncia" class="btn btn-first">Ver Denúncias</a>
                </div>
            </c:when>
            <c:when test="${param.errorDelete eq true}">
                <div class="alert alert-danger my-5 p-5 text-center" role="alert">
                    <h2 class="font-weight-bold"><i class="fas fa-times-circle"></i></h2>
                    <h3 class="font-weight-bold">Denúncia não deletada.</h3>
                    <a href="denuncia" class="btn btn-first">Tentar novamente</a>
                </div>
            </c:when>
            <c:otherwise>
                <!-- TEXTO INTRODUTORIO -->
                <div class="titulo">
                    <h2 class="font-weight-bold mt-5 mb-2">Conhece algum animalzinho sendo maltratado?</h2>
                    <hr class="line-title mt-0 mb-5">
                </div>
                <p>Quando o assunto é denúncia de maus-tratos ou crueldade contra animais, o Brasil possui legislação
                    pertinente
                    e autoridades competentes que são responsáveis pela manutenção da lei e punição de crimes</p>

                <p> Caso você presencie maus-tratos a animais de quaisquer espécies, sejam domésticos, domesticados,
                    silvestres
                    ou exóticos – como abandono, envenenamento, presos constantemente em correntes ou cordas muito
                    curtas, manutenção em lugar anti-higiênico, mutilação, presos em espaço incompatível ao porte do
                    animal ou
                    em local sem iluminação e ventilação, utilização em shows que possam lhes causar lesão, pânico ou
                    estresse,
                    agressão
                    física, exposição a esforço excessivo e animais debilitados (tração), rinhas, etc.
                    –, vá à delegacia de polícia mais próxima para lavrar o Boletim de Ocorrência (BO), ou compareça à
                    Promotoria de Justiça do Meio Ambiente.</p>

                <p>A denúncia de maus-tratos é legitimada pelo Art. 32, da Lei Federal nº. 9.605, de 12.02.1998 (Lei de
                    Crimes
                    Ambientais) e pela Constituição Federal Brasileira, de 05 de outubro de 1988.</p>

                <p>É possível denunciar também ao órgão público competente de seu município.</p>

                <div class="titulo">

                    <h2 class="font-weight-bold mt-5 mb-2">Lei de Crimes Ambientais</h2>
                    <hr class="line-title mt-0 mb-5">
                </div>

                <p>“Art. 32. Praticar ato de abuso, maus-tratos, ferir ou mutilar animais silvestres, domésticos ou
                    domesticados, nativos ou exóticos:</p>

                <p>Pena - detenção, de três meses a um ano, e multa.</p>

                <p>§ 1º. Incorre nas mesmas penas quem realiza experiência dolorosa ou cruel em animal vivo, ainda que
                    para fins
                    didáticos ou científicos, quando existirem recursos alternativos.</p>

                <p>§ 2º. “A pena é aumentada de um sexto a um terço, se ocorre morte do animal.”
                    prevaricação, previsto no Art. 329 do Código Penal Brasileiro (retardar ou deixar de praticar
                    indevidamente,
                    ato de ofício, ou praticá-lo contra disposição expressa de lei para satisfazer interesse ou
                    sentimento
                    pessoal).
                    (Leve esse artigo por escrito.)</p>

                <div class="titulo">
                    <h2 class="font-weight-bold mt-5 mb-2">Endereços úteis</h2>
                    <hr class="line-title mt-0 mb-5">
                </div>

                <p>Não se cale frente aos crimes contra os animais e o meio ambiente, e exija das autoridades
                    responsáveis às
                    providências previstas por lei.</p>

                <p>Em São Paulo, você pode realizar a denuncia através da Divisão de investigações sobre Infrações de
                    Maus
                    Tratos a Animais e demais Infrações
                    contra o Meio Ambiente.</p>

                <p><strong>Endereço: Av. São João, 1247 - 7º andar - Centro, das 9 às 19h. Tel.: (11) 3224-8208, (11)
                        3224-8480
                        e (11) 3331-8969.</strong></p>
                <p>As denúncias também podem ser feitas no site da Delegacia Eletrônica de Proteção Animal (DEPA):
                    <a href="http://www.ssp.sp.gov.br/depa" target="_blank"> http://www.ssp.sp.gov.br/depa</a>
                    No Rio de Janeiro, você pode realizar a denuncia através da DEMA - Delegacia de Proteção ao Meio
                    Ambiente.
                </p>

                <p><strong>Endereço: Rua S. Luiz, 265 - São Cristóvão. Tel.: (21) 3399-3290, (21) 3399-3298 e (21)
                        2589-3133.
                        Fax.: (21) 3860-9030 e (21) 3860-3293.</strong></p>

                <a href="#ancora" class="btn btn-danger ancora">Não se cale, denúncie. <i
                        class="fas fa-exclamation-circle"></i></a>

                <!-- LISTA DISPONIVEIS -->
                <h3 class="font-weight-bold mt-5">Denúncias abertas</h3>
                <hr class="line-title mt-0 mb-5">

                <c:choose>
                    <c:when test="${denunciasAbertas.size() eq 0}">
                        <h4 class="text-center">Nenhuma Denúncia</h4>
                        <span class="icon-empty d-flex justify-content-center align-items-center rounded-circle">
                            <i class="fas fa-folder-open"></i>
                        </span>
                    </c:when>
                    <c:otherwise>
                        <div class="row">
                            <c:forEach var="item" items="${denunciasAbertas}">
                                <div class="col-lg-4">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="card-title">${item.titulo}</h5>
                                            <h6 class="card-subtitle mb-2 text-muted">
                                                Data criação
                                                <c:set var="status" value="${item.getStatus().getNameStatus()}" />
                                                <fmt:formatDate pattern="dd/MM/yyyy" value="${item.dataCriacao}" />
                                                <c:if test="${status.toLowerCase() eq 'aberto' }">
                                                    <span class="badge badge-pill badge-success float-right">
                                                        ${status}
                                                    </span>
                                                </c:if>

                                                <c:if test="${status.toLowerCase() eq 'encerrado' }">
                                                    <span class="badge badge-pill badge-danger float-right">
                                                        ${status}
                                                    </span>
                                                </c:if>
                                            </h6>
                                            <p class="card-text">${item.descricao}</p>
                                            <c:if test="${item.fkUsuario eq idUsuario}">
                                                <a class="btn btn-first btn-block" data-toggle="collapse"
                                                    href="#form-edit-${item.idReports}" role="button"
                                                    aria-expanded="false"
                                                    aria-controls="form-edit-${item.idReports}">Editar</a>

                                                <div class="collapse" id="form-edit-${item.idReports}">
                                                    <div class="card card-body">
                                                        <form class="form-edit" action="denuncia" method="post"
                                                            accept-charset="UTF-8">
                                                            <h5 class="font-weight-bold">Editar o formulário</h5>
                                                            <hr class="line-title mt-0 mb-3">

                                                            <div class="form-group">
                                                                <label class="font-weight-bold">
                                                                    Título
                                                                </label>
                                                                <input class="form-control" name="titulo_reports"
                                                                    value="${item.titulo}" required />
                                                            </div>

                                                            <div class="form-group">
                                                                <label class="font-weight-bold">
                                                                    Descrição
                                                                </label>
                                                                <textarea rows="5" cols="5" name="descricao"
                                                                    class="form-control"
                                                                    required>${item.descricao}</textarea>
                                                            </div>

                                                            <div class="form-group">
                                                                <c:set var="status"
                                                                    value="${item.getStatus().getNameStatus()}" />
                                                                <label class="font-weight-bold">
                                                                    Status
                                                                </label>
                                                                <select name="status_report" class="form-control"
                                                                    required>
                                                                    <option value="Aberto" ${ status eq 'Aberto'
                                                                        ? 'selected' : '' }>Aberto</option>
                                                                    <option value="Encerrado" ${ status eq 'Encerrado'
                                                                        ? 'selected' : '' }>Encerrado</option>
                                                                </select>
                                                            </div>
                                                            <input type="hidden" name="editar" value="${item.idReports}"
                                                                required />
                                                            <div class="form-group">
                                                                <button type="submit"
                                                                    class="btn btn-first btn-block">Salvar</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                                <form class="mt-2" action="denuncia" method="post">
                                                    <input type="hidden" name="delete" value="${item.idReports}"
                                                        required />
                                                    <button
                                                        class="btn btn-danger btn-block text-white font-weight-bold">
                                                        Deletar
                                                    </button>
                                                </form>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:otherwise>
                </c:choose>
                <!-- FIM -->
                <!-- LISTA ENCERRADA -->
                <h3 class="font-weight-bold mt-5">Denúncias finalizadas</h3>
                <hr class="line-title mt-0 mb-5">
                <c:choose>
                    <c:when test="${denunciasEncerradas.size() eq 0}">
                        <h4 class="text-center">Nenhuma Denúncia</h4>
                        <span class="icon-empty d-flex justify-content-center align-items-center rounded-circle">
                            <i class="fas fa-folder-open"></i>
                        </span>
                    </c:when>
                    <c:otherwise>
                        <div class="row">
                            <c:forEach var="item" items="${denunciasEncerradas}">
                                <div class="col-lg-4">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="card-title">${item.titulo}</h5>
                                            <h6 class="card-subtitle mb-2 text-muted">
                                                Data criação
                                                <c:set var="status" value="${item.getStatus().getNameStatus()}" />
                                                <fmt:formatDate pattern="dd/MM/yyyy" value="${item.dataCriacao}" />
                                                <c:if test="${status.toLowerCase() eq 'aberto' }">
                                                    <span class="badge badge-pill badge-success float-right">
                                                        ${status}
                                                    </span>
                                                </c:if>

                                                <c:if test="${status.toLowerCase() eq 'encerrado' }">
                                                    <span class="badge badge-pill badge-danger float-right">
                                                        ${status}
                                                    </span>
                                                </c:if>
                                            </h6>
                                            <p class="card-text">${item.descricao}</p>
                                            <c:if test="${item.fkUsuario eq idUsuario}">
                                                <a class="btn btn-first btn-block" data-toggle="collapse"
                                                    href="#form-edit-${item.idReports}" role="button"
                                                    aria-expanded="false"
                                                    aria-controls="form-edit-${item.idReports}">Editar</a>

                                                <div class="collapse" id="form-edit-${item.idReports}">
                                                    <div class="card card-body">
                                                        <form class="form-edit" action="denuncia" method="post"
                                                            accept-charset="UTF-8">
                                                            <h5 class="font-weight-bold">Editar o formulário</h5>
                                                            <hr class="line-title mt-0 mb-3">

                                                            <div class="form-group">
                                                                <label class="font-weight-bold">
                                                                    Título
                                                                </label>
                                                                <input class="form-control" name="titulo_reports"
                                                                    value="${item.titulo}" required />
                                                            </div>

                                                            <div class="form-group">
                                                                <label class="font-weight-bold">
                                                                    Descrição
                                                                </label>
                                                                <textarea rows="5" cols="5" name="descricao"
                                                                    class="form-control"
                                                                    required>${item.descricao}</textarea>
                                                            </div>

                                                            <div class="form-group">
                                                                <c:set var="status"
                                                                    value="${item.getStatus().getNameStatus()}" />
                                                                <label class="font-weight-bold">
                                                                    Status
                                                                </label>
                                                                <select name="status_report" class="form-control"
                                                                    required>
                                                                    <option value="Aberto" ${ status eq 'Aberto'
                                                                        ? 'selected' : '' }>Aberto</option>
                                                                    <option value="Encerrado" ${ status eq 'Encerrado'
                                                                        ? 'selected' : '' }>Encerrado</option>
                                                                </select>
                                                            </div>
                                                            <input type="hidden" name="editar" value="${item.idReports}"
                                                                required />
                                                            <div class="form-group">
                                                                <button type="submit"
                                                                    class="btn btn-first btn-block">Salvar</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                                <form class="mt-2" action="denuncia" method="post">
                                                    <input type="hidden" name="delete" value="${item.idReports}"
                                                        required />
                                                    <button
                                                        class="btn btn-danger btn-block text-white font-weight-bold">
                                                        Deletar
                                                    </button>
                                                </form>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:otherwise>
                </c:choose>

                <!-- FIM -->
                <h3 class="font-weight-bold mt-5" id="ancora">Fazer uma Denúncia</h3>
                <hr class="line-title mt-0 mb-5">
                <form action="denuncia" method="POST" accept-charset="UTF-8" id="cadastrar">
                    <div class="form-group">
                        <label class="font-weight-bold">Título</label>
                        <input type="text" class="form-control" name="titulo_reports" required />
                    </div>
                    <div class="form-group">
                        <label class="font-weight-bold">Descrição</label>
                        <textarea rows="5" cols="5" class="form-control" name="descricao" required></textarea>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-first">Cadastrar</button>
                    </div>
                </form>
            </c:otherwise>
        </c:choose>
    </section>
    ${footer}
    <script type="text/javascript" src="assets/vendors/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="assets/vendors/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="assets/vendors/jquery-validate/jquery.validate.min.js"></script>
    <script type="text/javascript" src="assets/vendors/jquery-validate/pt-BR.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".ancora").click(function (e) {
                e.preventDefault();
                var alvo = $(this).attr("href");
                $('html, body').animate({
                    scrollTop: $(alvo).offset().top
                }, 500);
            });

            $('#cadastrar').on("submit", function () {
                if ($(this).valid()) {
                    var btn = $(this).find("button[type=submit]");
                    btn.attr("disabled", true);
                    btn.html(
                        'Cadastrando <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>'
                        );
                }
            });
            $("#cadastrar").validate({
                focusInvalid: true,
                errorElement: "small"
            });
            $(".collapse").collapse({
                toggle: false
            });

            $(".form-edit").on("submit", function () {
                if ($(this).valid()) {
                    var btn = $(this).find("button[type=submit]");
                    btn.attr("disabled", true);
                    btn.html(
                        'Atualizando <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>'
                        );
                }
            });

            $(".form-edit").validate({
                focusInvalid: true,
                errorElement: "small"
            });

        });
    </script>
</body>

</html>