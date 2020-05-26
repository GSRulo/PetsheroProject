<%@page import="model.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil</title>
    <link rel="stylesheet" href="assets/vendors/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/vendors/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="assets/vendors/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="assets/css/main.css">
</head>

<body class="d-flex-column">

    <% Usuario usuario = (Usuario) session.getAttribute("usuario");%>

    <!-- IMPORTS PAGES -->
    <c:import var="menu" url="components/menu.jsp" />
    <c:import var="footer" url="components/footer.jsp" />
    <!--  -->
    ${menu}
    <section class="container flex-1">

        <c:choose>
            <c:when test="${param.success eq true}">
                <div class="alert alert-success text-center mt-5 py-5" role="alert">
                    <h2><i class="fas fa-id-badge"></i></h2>
                    <h4 class="font-weight-bold">Dados atualizados com sucesso!</h4>
                    <a href="perfil.jsp" class="btn btn-first">Ver dados atualizados</a>
                </div>
            </c:when>
            <c:when test="${param.error eq true}">
                <div class="alert alert-danger text-center mt-5 py-5" role="alert">
                    <h2><i class="fas fa-times-circle"></i></h2>
                    <h4 class="font-weight-bold">Houve um erro na atualização de dados!</h4>
                    <a href="perfil.jsp" class="btn btn-first">Tentar novamente</a>
                </div>
            </c:when>
            <c:otherwise>
                <h3 class="font-weight-bold mt-5">Dados do perfil</h3>
                <hr class="line-title mt-0 mb-5">
                <form action="salvarPerfil" accept-charset="UTF-8" method="POST">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label class="font-weight-bold">Nome</label>
                                <input type="text" name="nome" class="form-control" value="${usuario.nome}" readonly
                                    disabled required />
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label class="font-weight-bold">Tipo de usuário</label>
                                <c:choose>
                                    <c:when test="${usuario.tipoUsuario eq 2}">
                                        <c:set var="tipoUsuario" value="Ong"></c:set>
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="tipoUsuario" value="Pessoa física"></c:set>
                                    </c:otherwise>
                                </c:choose>
                                <input type="text" name="tipoUsuario" class="form-control" value="${tipoUsuario}"
                                    readonly disabled required />
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label class="font-weight-bold">E-mail</label>
                                <input type="email" name="email" class="form-control" value="${usuario.email}" readonly
                                    disabled required />
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label class="font-weight-bold" id="modificaDocumento">CNPJ</label>
                                <input type="tel" name="documento" class="form-control" value="${usuario.documento}"
                                    readonly disabled required />
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label class="font-weight-bold">Telefone</label>
                                <input type="tel" name="telefone" class="form-control" value="${usuario.tel}"
                                    required />
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label class="font-weight-bold">Alterar senha</label>
                                <input type="password" name="newPassword" id="newPassword" class="form-control" />
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label class="font-weight-bold">Repetir senha</label>
                                <input type="password" name="repeatPassword" class="form-control" />
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" name="checkSenha" type="checkbox" id="alterarSenha"
                                    value="false">
                                <label class="form-check-label" for="alterarSenha">Alterar senha ?</label>
                            </div>
                        </div>
                        <div class="col-lg-12 mt-3">
                            <button type="submit" class="btn btn-first">Salvar</button>
                        </div>
                    </div>
                </form>
            </c:otherwise>
        </c:choose>
    </section>
    ${footer}
    <script type="text/javascript" src="assets/vendors/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="assets/vendors/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="assets/vendors/jqueryMask/jquery.mask.min.js"></script>
    <script type="text/javascript" src="assets/vendors/jquery-validate/jquery.validate.min.js"></script>
    <script type="text/javascript" src="assets/vendors/jquery-validate/pt-BR.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('[name="telefone"]').mask("(00) 00000-0000");
			
            if ($('[name="documento"]').val() && $('[name="documento"]').val().length <= 11) {
                $("#modificaDocumento").html("CPF");
                $('[name="documento"]').mask('000.000.000-00');
            } else {
                $('[name="documento"]').mask('00.000.000/0000-00');
            }
            $("form").validate({
                focusInvalid: true,
                errorElement: "small",
                rules: {
                    password: "required",
                    repeatPassword: {
                        equalTo: "#newPassword"
                    }
                }
            });

            $('form').submit(function () {
                if ($(this).valid()) {
                    $(this).find("input").unmask();
                    var btn = $(this).find("button[type=submit]");
                    btn.attr("disabled", true);
                    btn.html(
                        'Atualizando <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>'
                        );
                }
            });

            $("#alterarSenha").change(function () {
                $(this).val($(this).is(":checked"));
                if ($(this).is(":checked")) {
                    $("[name=repeatPassword], [name=newPassword]").attr("required", true);
                } else {
                    $("[name=repeatPassword], [name=newPassword]").attr("required", false).val("");
                }
            });


        });
    </script>
</body>

</html>