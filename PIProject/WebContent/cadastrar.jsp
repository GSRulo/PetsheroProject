<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastrar</title>
    <link rel="stylesheet" href="assets/vendors/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="assets/vendors/fontawesome/css/fontawesome.min.css">
	<link rel="stylesheet" href="assets/css/main.css">
</head>

<body class="bg-default">
    <div class="h-100 overflow-auto">
        <div class="container">
            <div class="my-4">
                <nav class="row justify-content-between align-items-center navbar-content">
                    <div class="col-lg-3">
                    	<div class="d-inline-block text-center">
					 		<img src="assets/images/logo.svg" alt="" width="70" class="img-fluid" />
  							<strong class="text-uppercase m-0 title-logo d-block">pets hero</strong>
					 	</div>
                    </div>
                    <div class="col-lg-4">
                        <nav class="nav justify-content-end">
                            <a class="nav-link text-padrao-dark font-weight-bold active" href="contato.jsp">Contato</a>
						  <a class="nav-link text-padrao-dark font-weight-bold" href="sobre.jsp">Sobre</a>
                            <span class="nav-link text-padrao-dark font-weight-bold">|</span>
                            <span class="nav-link text-padrao-dark pr-0">
                                <a href="login.jsp"
                                    class="btn btn-sm btn-menu-cadastrar text-uppercase">login</a>
                            </span>
                        </nav>
                    </div>
                </nav>
            </div>
        </div>
        <div class="container mb-5">
            <div class="p-5 bg-white rounded">
                <div class="row align-items-center">
                    <div class="col-lg-6">
                        <div class="px-4">
                        	<img src="assets/images/cadastro.svg" alt="" class="img-fluid" />
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <form action="cadastrar" accept-charset="UTF-8" method="POST">
                            <h1 class="mb-4 mt-5 text-center text-uppercase font-weight-bold">Cadastrar</h1>
                            <div class="form-group">
                                <label class="font-weight-bold">Nome</label>
                                <input type="text" name="nome" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label class="font-weight-bold">Email</label>
                                <input type="email" name="email" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label class="font-weight-bold">Senha</label>
                                <input type="password" name="senha" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label class="font-weight-bold">Tipo de usuário</label>
                                <select class="form-control" name="tipo_usuario">
                                    <option value="1">Pessoa física</option>
                                    <option value="2">Ong</option>
                                </select>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="font-weight-bold">Telefone</label>
                                        <input type="tel" name="telefone" class="form-control" required>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label id="label-doc" class="text-uppercase font-weight-bold">CPF</label>
                                        <input type="tel" name="documento" class="form-control" required>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <button type="submit"
                                    class="text-uppercase btn-block btn-first rounded py-2">Cadastrar</button>
                            </div>
                            <div class="text-center">
                                <a href="login.jsp" class="nav-link text-dark">
                                    Entrar na sua conta 
                                    <i class="fas fa-arrow-right"></i>
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

<script type="text/javascript" src="assets/vendors/jquery/jquery.min.js"></script>
<script type="text/javascript" src="assets/vendors/jqueryMask/jquery.mask.min.js"></script>
<script type="text/javascript" src="assets/vendors/jquery-validate/jquery.validate.min.js"></script>
<script type="text/javascript" src="assets/vendors/jquery-validate/pt-BR.js"></script>
	
<script type="text/javascript">
	$(document).ready(function(){
		$('[name="telefone"]').mask("(00) 00000-0000");
		$('[name="documento"]').mask('000.000.000-00');
		$('[name="tipo_usuario"]').change(function(){
			var tipo = parseInt($(this).val());
			var doc = $('[name="documento"]');
			var label = $('#label-doc');
			doc.val("");
			if(tipo === 1){
				label.html("CPF");
				doc.mask('000.000.000-00');
			}else{
				label.html("cnpj");
				doc.mask('00.000.000/0000-00');
			}
		});
		
		$('form').submit(function(){
			if($(this).valid()){
				$(this).find("input").unmask();
	    		var btn = $(this).find("button[type=submit]");
				btn.attr("disabled",true);
				btn.html('Cadastrando <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>');
			}
		});
		
		$("form").validate({
			focusInvalid: true,
			errorElement: "small"
		});

	});
</script>
</html>