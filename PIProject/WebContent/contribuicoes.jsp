<%@page import="model.Necessidade"%>
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
    <title>Contribuições</title>
    <link rel="stylesheet" href="assets/vendors/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/vendors/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="assets/vendors/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="assets/vendors/selectize/selectize.bootstrap4.css" />
    <link rel="stylesheet" href="assets/css/main.css">
</head>

<body>
    <!-- IMPORTS PAGES -->
    <c:import var="menu" url="components/menu.jsp" />
    <c:import var="footer" url="components/footer.jsp" />
    <!--  -->
    ${menu}
    <section class="container">
        <c:choose>
            <c:when test="${param.successEdit eq true }">
                <div class="alert alert-success my-5 p-5 text-center" role="alert">
                    <h2 class="font-weight-bold"><i class="fas fa-check-circle"></i></h2>
                    <h3 class="font-weight-bold">Contribuição atualizada com sucesso.</h3>
                    <a href="contribuicoes" class="btn btn-first">Ver contribuições</a>
                </div>
            </c:when>
            <c:when test="${param.errorEdit eq true }">
                <div class="alert alert-danger my-5 p-5 text-center" role="alert">
                    <h2 class="font-weight-bold"><i class="fas fa-times-circle"></i></h2>
                    <h3 class="font-weight-bold">Contribuição não atualizada.</h3>
                    <a href="contribuicoes" class="btn btn-first">Atualizar novamente</a>
                </div>
            </c:when>
            <c:when test="${param.success eq true}">
                <div class="alert alert-success my-5 p-5 text-center" role="alert">
                    <h2 class="font-weight-bold"><i class="fas fa-check-circle"></i></h2>
                    <h3 class="font-weight-bold">Contribuição cadastrada com sucesso.</h3>
                    <p>Obrigado por ter essa iniciativa em ajudar um pet</p>
                    <a href="contribuicoes" class="btn btn-first">Ver contribuições</a>
                </div>
            </c:when>
            <c:when test="${param.error eq true}">
                <div class="alert alert-danger my-5 p-5 text-center" role="alert">
                    <h2 class="font-weight-bold"><i class="fas fa-times-circle"></i></h2>
                    <h3 class="font-weight-bold">Contribuição não cadastrada.</h3>
                    <p>Por favor, tente novamente.</p>
                    <a href="contribuicoes" class="btn btn-first">Cadastrar novamente</a>
                </div>
            </c:when>
            <c:when test="${param.successDelete eq true}">
                <div class="alert alert-success my-5 p-5 text-center" role="alert">
                    <h2 class="font-weight-bold"><i class="fas fa-check-circle"></i></h2>
                    <h3 class="font-weight-bold">Contribuição deletada com sucesso.</h3>
                    <a href="contribuicoes" class="btn btn-first">Ver contribuições</a>
                </div>
            </c:when>
            <c:when test="${param.errorDelete eq true}">
                <div class="alert alert-danger my-5 p-5 text-center" role="alert">
                    <h2 class="font-weight-bold"><i class="fas fa-times-circle"></i></h2>
                    <h3 class="font-weight-bold">Contribuição não deletada.</h3>
                    <a href="contribuicoes" class="btn btn-first">Tentar novamente</a>
                </div>
            </c:when>
            <c:otherwise>
                <h3 class="font-weight-bold mt-5">Contribuições disponíveis</h3>
                <hr class="line-title mt-0 mb-5">
                <!-- DISPONIVEIS -->
                <c:choose>
                    <c:when test="${necessidades.size() le 0}">
                        <h4 class="text-center">Nenhuma Contribuição criada</h4>
                        <span class="icon-empty d-flex justify-content-center align-items-center rounded-circle">
                            <i class="fas fa-folder-open"></i>
                        </span>
                    </c:when>
                    <c:otherwise>
                        <div class="row">
                            <c:forEach items="${necessidades}" var="item">
                                <div class="col-lg-4">
                                    <div class="card">
                                        <div class="card-body">
                                            <c:set var="status" value="${item.getStatus().getNameStatus()}" />
                                            <h5 class="card-title">${item.titulo}</h5>
                                            <h6 class="card-subtitle mb-2 text-muted">
                                                Data criação
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

                                            <c:if test="${item.fkUsuario ne idUsuario}">
                                                <div class="card-text mb-3">
                                                    <strong class="d-block">Dados para contato: </strong>
                                                    <hr class="line-title mt-0 mb-2">
                                                    <div class="mt-2 mb-0">
                                                        <p class="m-0">
                                                            <strong>Nome</strong> ${item.nome}
                                                        </p>
                                                        <p class="m-0">
                                                            <strong>CNPJ</strong>
                                                            <span class="format-documento">
                                                                ${item.documento}
                                                            </span>
                                                        </p>
                                                        <p class="m-0">
                                                            <strong>E-mail</strong> ${item.email}
                                                        </p>
                                                        <p class="m-0">
                                                            <strong>Telefone</strong>
                                                            <span class="format-celular">
                                                                ${item.telefone}
                                                            </span>
                                                        </p>
                                                    </div>
                                                </div>
                                            </c:if>

                                            <div class="card-text">
                                                <strong class="d-block">Dados bancários: </strong>
                                                <hr class="line-title mt-0 mb-2">
                                                <p class="mt-2 mb-0">
                                                    <strong>Banco</strong> ${item.banco}
                                                </p>
                                                <p class="mb-0">
                                                    <strong>Agência</strong> ${item.agencia}
                                                </p>
                                                <p class="mb-0">
                                                    <strong>Conta</strong> ${item.conta}
                                                </p>
                                                <p>
                                                    <strong>Valor para arrecadar</strong> 
                                                    R$ <span class="format-valor">
                                                    <fmt:formatNumber value="${item.vlArrecadar}" 
                                                    minFractionDigits="0" maxFractionDigits="0" />
                                                    </span>
                                                </p>
                                            </div>

                                            <c:if test="${item.fkUsuario eq idUsuario}">
                                                <a class="btn btn-first btn-block" data-toggle="collapse"
                                                    href="#form-edit-${item.fkNeces}" role="button"
                                                    aria-expanded="false"
                                                    aria-controls="form-edit-${item.fkNeces}">Editar</a>

                                                <div class="collapse" id="form-edit-${item.fkNeces}">
                                                    <div class="card card-body">
                                                        <form class="form-edit" action="contribuicoes" method="post"
                                                            accept-charset="UTF-8">
                                                            <h5 class="font-weight-bold">Editar o formulário</h5>
                                                            <hr class="line-title mt-0 mb-3">
                                                            <div class="form-group">
                                                                <label class="font-weight-bold">
                                                                    Título
                                                                </label>
                                                                <input type="text" class="form-control" name="titulo"
                                                                    value="${item.titulo}" required />
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="font-weight-bold">
                                                                    Descrição
                                                                </label>
                                                                <textarea rows="5" cols="4" class="form-control"
                                                                    name="descricao"
                                                                    required>${item.descricao}</textarea>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="font-weight-bold">
                                                                    Status
                                                                </label>
                                                                <select class="form-control" name="status" required>
                                                                    <option value="Aberto" ${ status eq 'Aberto'
                                                                        ? 'selected' : '' }>Aberto</option>
                                                                    <option value="Encerrado" ${ status eq 'Encerrado'
                                                                        ? 'selected' : '' }>Encerrado</option>
                                                                </select>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="font-weight-bold">
                                                                    Banco
                                                                </label>
                                                                <select name="banco" class="form-control load-banks"
                                                                    required data-val="${item.banco}"></select>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="font-weight-bold">
                                                                    Agência
                                                                </label>
                                                                <input type="tel" class="form-control" name="agencia"
                                                                    required value="${item.agencia}" />
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="font-weight-bold">
                                                                    Conta
                                                                </label>
                                                                <input type="tel" class="form-control" name="conta"
                                                                    required value="${item.conta}" />
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="font-weight-bold">
                                                                    Valor para arrecadar
                                                                </label>
                                                                
                                                                <input type="tel" class="form-control"
                                                                    name="valor_arrecadar" required
                                                                    value="<fmt:formatNumber value="
                                                                    ${item.vlArrecadar}" minFractionDigits="0"
                                                                    maxFractionDigits="0" />" />

                                                            </div>
                                                            <input type="hidden" value="${item.fkNeces}" name="edit"
                                                                required />
                                                            <div class="form-group">
                                                                <button type="submit"
                                                                    class="btn btn-first btn-block">Salvar</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                                <form action="contribuicoes" method="post">
                                                    <input type="hidden" name="delete" value="${item.fkNeces}">
                                                    <button type="submit"
                                                        class="mt-2 btn btn-danger btn-block font-roboto font-weight-bold text-white">Excluir</button>
                                                </form>
                                            </c:if>
                                        </div>
                                        <c:if test="${item.fkUsuario eq idUsuario}">
                                            <div class="card-footer text-muted text-center">
                                                Criado por você.
                                            </div>
                                        </c:if>

                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:otherwise>
                </c:choose>
                <!-- ENCERRADAS -->
                <h3 class="font-weight-bold mt-5">Contribuições Encerradas</h3>
                <hr class="line-title mt-0 mb-5">
                <c:choose>
                    <c:when test="${necEncerrada.size() le 0}">
                        <h4 class="text-center">Nenhuma Contribuição foi encerrada</h4>
                        <span class="icon-empty d-flex justify-content-center align-items-center rounded-circle">
                            <i class="fas fa-folder-open"></i>
                        </span>
                    </c:when>
                    <c:otherwise>
                        <div class="row">
                            <c:forEach items="${necEncerrada}" var="item">
                                <div class="col-lg-4">
                                    <div class="card">
                                        <div class="card-body">
                                            <c:set var="status" value="${item.getStatus().getNameStatus()}" />
                                            <h5 class="card-title">${item.titulo}</h5>
                                            <h6 class="card-subtitle mb-2 text-muted">
                                                Data criação
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

                                            <c:if test="${item.fkUsuario ne idUsuario}">
                                                <div class="card-text mb-3">
                                                    <strong class="d-block">Dados para contato: </strong>
                                                    <hr class="line-title mt-0 mb-2">
                                                    <div class="mt-2 mb-0">
                                                        <p class="m-0">
                                                            <strong>Nome</strong> ${item.nome}
                                                        </p>
                                                        <p class="m-0">
                                                            <strong>E-mail</strong> ${item.email}
                                                        </p>
                                                        <p class="m-0">
                                                            <strong>Telefone</strong>
                                                            <span class="format-celular">
                                                                ${item.telefone}
                                                            </span>
                                                        </p>
                                                    </div>
                                                </div>
                                            </c:if>

                                            <div class="card-text">
                                                <strong class="d-block">Dados bancários: </strong>
                                                <hr class="line-title mt-0 mb-2">
                                                <p class="mt-2 mb-0">
                                                    <strong>Banco</strong> ${item.banco}
                                                </p>
                                                <p class="mb-0">
                                                    <strong>Agência</strong> ${item.agencia}
                                                </p>
                                                <p class="mb-0">
                                                    <strong>Conta</strong> ${item.conta}
                                                </p>
                                                <p>
                                                    <strong>Valor para arrecadar</strong> 
                                                    R$ <span class="format-valor">
                                                    <fmt:formatNumber value="${item.vlArrecadar}" 
                                                    minFractionDigits="0" maxFractionDigits="0" />
                                                    </span>
                                                </p>
                                            </div>

                                            <c:if test="${item.fkUsuario eq idUsuario}">
                                                <a class="btn btn-first btn-block" data-toggle="collapse"
                                                    href="#form-edit-${item.fkNeces}" role="button"
                                                    aria-expanded="false"
                                                    aria-controls="form-edit-${item.fkNeces}">Editar</a>

                                                <div class="collapse" id="form-edit-${item.fkNeces}">
                                                    <div class="card card-body">
                                                        <form class="form-edit" action="contribuicoes" method="post"
                                                            accept-charset="UTF-8">
                                                            <h5 class="font-weight-bold">Editar o formulário</h5>
                                                            <hr class="line-title mt-0 mb-3">
                                                            <div class="form-group">
                                                                <label class="font-weight-bold">
                                                                    Título
                                                                </label>
                                                                <input type="text" class="form-control" name="titulo"
                                                                    value="${item.titulo}" required />
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="font-weight-bold">
                                                                    Descrição
                                                                </label>
                                                                <textarea rows="5" cols="4" class="form-control"
                                                                    name="descricao"
                                                                    required>${item.descricao}</textarea>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="font-weight-bold">
                                                                    Status
                                                                </label>
                                                                <select class="form-control" name="status" required>
                                                                    <option value="Aberto" ${ status eq 'Aberto'
                                                                        ? 'selected' : '' }>Aberto</option>
                                                                    <option value="Encerrado" ${ status eq 'Encerrado'
                                                                        ? 'selected' : '' }>Encerrado</option>
                                                                </select>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="font-weight-bold">
                                                                    Banco
                                                                </label>
                                                                <select name="banco" class="form-control load-banks"
                                                                    required data-val="${item.banco}"></select>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="font-weight-bold">
                                                                    Agência
                                                                </label>
                                                                <input type="tel" class="form-control" name="agencia"
                                                                    required value="${item.agencia}" />
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="font-weight-bold">
                                                                    Conta
                                                                </label>
                                                                <input type="tel" class="form-control" name="conta"
                                                                    required value="${item.conta}" />
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="font-weight-bold">
                                                                    Valor para arrecadar
                                                                </label>
                                                                <input type="tel" class="form-control"
                                                                    name="valor_arrecadar" required
                                                                    value="<fmt:formatNumber value="
                                                                    ${item.vlArrecadar}" minFractionDigits="0"
                                                                    maxFractionDigits="0" />" />

                                                            </div>
                                                            <input type="hidden" value="${item.fkNeces}" name="edit"
                                                                required />
                                                            <div class="form-group">
                                                                <button type="submit"
                                                                    class="btn btn-first btn-block">Salvar</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                                <a href="contribuicoes?delete=${item.fkNeces}"
                                                    class="mt-2 btn btn-danger btn-block font-roboto font-weight-bold text-white">Excluir</a>
                                            </c:if>
                                        </div>
                                        <c:if test="${item.fkUsuario eq idUsuario}">
                                            <div class="card-footer text-muted text-center">
                                                Criado por você.
                                            </div>
                                        </c:if>

                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:otherwise>
                </c:choose>
                <!-- FIM -->
            </c:otherwise>
        </c:choose>

        <c:set var="checkSuccess" value="${param.success eq null or param.success eq false }" />
        <c:set var="checkError" value="${param.error eq null or param.error eq false }" />
        <c:set var="checkEditSuccess" value="${param.successEdit eq null or param.successEdit eq false }" />
        <c:set var="checkEditError" value="${param.errorEdit eq null or param.errorEdit eq false }" />
        <c:set var="checkDeleteSuccess" value="${param.successDelete eq null or param.successDelete eq false }" />
        <c:set var="checkDeleteError" value="${param.errorDelete eq null or param.errorDelete eq false }" />

        <c:if
            test="${ checkSuccess and checkError and checkEditSuccess and checkEditError and checkDeleteSuccess and checkDeleteError}">
            <div class="my-5">
                <!-- CASO O USUARIO SEJA ONG-->
                <c:if test="${usuario.tipoUsuario eq 2}">
                    <div class="row justify-content-between">
                        <div class="col-lg-8">
                            <h3>Crie uma contribuição para ajudar um pet.</h3>
                        </div>
                        <div class="col-lg-3 text-right">
                            <button class="btn btn-first" type="button" data-toggle="collapse"
                                data-target="#collapseForm" aria-expanded="false" aria-controls="#collapseForm">Criar
                                contribuição</button>
                        </div>
                    </div>
                    <div class="collapse mt-3" id="collapseForm">
                        <div class="card card-body">

                            <form action="contribuicoes" method="post" accept-charset="UTF-8" id="form-principal">
                                <div class="form-group">
                                    <label class="font-weight-bold">Título</label>
                                    <input type="text" class="form-control" name="titulo" required />
                                </div>
                                <div class="form-group">
                                    <label>Descrição</label>
                                    <textarea rows="5" cols="5" name="descricao" class="form-control"
                                        required></textarea>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="form-group">
                                                <label class="font-weight-bold">Banco</label>
                                                <select class="form-control" id="listaBancos" name="banco"
                                                    required></select>
                                            </div>
                                        </div>
                                        <div class="col-lg-2">
                                            <div class="form-group">
                                                <label class="font-weight-bold">Agênica</label>
                                                <input type="tel" name="agencia" class="form-control" required />
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label class="font-weight-bold">Conta</label>
                                                <input type="tel" name="conta" class="form-control" required />
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label class="font-weight-bold">Valor para arrecadar</label>
                                                <input type="tel" name="valor_arrecadar" class="form-control"
                                                    required />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-first">Cadastrar</button>
                                </div>
                            </form>

                        </div>
                    </div>
                </c:if>
            </div>
		<!-- FIM -->
        </c:if>

    </section>
    ${footer}

    <script type="text/javascript" src="assets/vendors/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="assets/vendors/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="assets/vendors/jqueryMask/jquery.mask.min.js"></script>
    <script type="text/javascript" src="assets/vendors/jquery-validate/jquery.validate.min.js"></script>
    <script type="text/javascript" src="assets/vendors/jquery-validate/pt-BR.js"></script>
    <script type="text/javascript" src="assets/vendors/selectize/selectize.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#form-principal').submit(function () {
                if ($(this).valid()) {
                    $(this).find("input").unmask();
                    var btn = $(this).find("button[type=submit]");
                    btn.attr("disabled", true);
                    btn.html(
                        'Criando <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>'
                        );
                }
            });

            $("#form-principal").validate({
                focusInvalid: true,
                errorElement: "small"
            });

            $(".form-edit").validate({
                focusInvalid: true,
                errorElement: "small"
            });

            $(".form-edit").submit(function () {
                if ($(this).valid()) {
                    $(this).find("input").unmask();
                    var btn = $(this).find("button[type=submit]");
                    btn.attr("disabled", true);
                    btn.html(
                        'Salvando <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>'
                        );
                }
            });

            $('.collapse').collapse({
                toggle: false
            });


            $(".format-celular").mask("(00) 00000-0000");
            $(".format-documento").mask('00.000.000/0000-00');


            $("[name=valor_arrecadar]").mask('#.##0,00', {
                reverse: true
            });
            $(".format-valor").mask('#.##0,00');
            $("[name=agencia], [name=conta]").mask("0#");
            var selectBank = $("#listaBancos");
            $.getJSON("assets/js/banco_codigo.json").then(function (res) {
                var data = $.map(res, function (data, idx) {
                    return {
                        banco: data.value,
                        nome: data.label
                    };
                });

                var objSelectize = {
                    placeholder: 'Selecione o banco',
                    valueField: 'nome',
                    labelField: 'banco',
                    options: data,
                    searchField: ['nome', 'banco'],
                    sortField: "text",
                    render: {
                        item: function (item, escape) {
                            return '<div>' +
                                (item.nome ? '<span class="banco">' + escape(item.banco) +
                                    ' |&nbsp;</span>' : '') +
                                (item.banco ? '<span class="nome">' + escape(item.nome) +
                                    '</span>' : '') +
                                '</div>';
                        },
                        option: function (item, escape) {
                            var label = item.nome || item.banco;
                            var caption = item.nome ? item.banco : null;
                            return '<div class="container py-2">' +
                                '<div class="row">' +
                                '<div class="col-2 text-right">' +
                                '<span class="badge badge-info">' + escape(caption) +
                                '</span>' +
                                '</div>' +
                                '<div class="col-10">' +
                                (caption ? '<span class="label">' + escape(label) + '</span>' :
                                    '') +
                                '</div>' +
                                '</div>' +
                                '</div>';
                        }
                    }
                }

                selectBank.selectize(objSelectize);

                $.each($('.load-banks'), function () {
                    var data = $(this).data("val");
                    $(this).val(data);
                    $.extend(true, objSelectize, {
                        onInitialize: function () {
                            var selectize = this;
                            selectize.setValue(data);
                        }
                    });
                    $(this).selectize(objSelectize);
                });
            });

        });
    </script>
</body>

</html>