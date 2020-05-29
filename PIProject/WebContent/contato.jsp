<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" type="image/png" href="assets/images/logo.svg" />
    <title>Contato</title>
    <link rel="stylesheet" href="assets/vendors/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="assets/vendors/fontawesome/css/fontawesome.min.css">
	<link rel="stylesheet" href="assets/css/main.css">
</head>

<body>
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
						  	<a href="login.jsp" class="btn btn-sm btn-menu-cadastrar text-uppercase text-white" style="border-color: #fff;">Login</a>
						  	<a href="cadastrar.jsp" class="btn btn-sm btn-menu-cadastrar text-uppercase text-white" style="border-color: #fff;">cadastrar</a>
						  </span>
						  </nav>
					 </div>
				</nav>
			</div>
		</div>
	</div>
	<c:choose>
		<c:when test="${param.send eq true}">
			<!-- CASO SEJA ENVIADO -->
		   	<div class="h-100 w-100 d-flex align-items-center">
	   			<div class="d-block text-center m-auto">
	   				<img src="assets/images/sucesso-contato.svg" class="img-fluid" width="200" />
			  		<div class="alert alert-success" role="alert">
					  <h4 class="alert-heading">Mensagem enviada com sucesso!</h4>
					  <h5>Obrigado, ${request.getParameter("nome")}!</h5>
					  <p>
					  	Suas informações foram recebidas! Retornaremos seu contato o mais breve possível
					  </p>
				  	</div>
	   			</div>
			  </div>
		</c:when>
		<c:otherwise>
			<div class="container">
	    		<!-- MONTA O FORMULARIO  -->
	    		<div class="row justify-content-center">
		            <div class="col-lg-8">
		            	<div class="my-4">
		            		<h1 class="text-center">Contato</h1>
		            	</div>
		            	
		                <form action="enviarContato" method="POST" accept-charset="UTF-8">
		                    <div class="form-group">
		                        <label>Nome</label>
		                        <input type="text" class="form-control" name="nome" required>
		                    </div>
		                    <div class="form-group">
		                        <label>Email</label>
		                        <input type="email" class="form-control" name="email" required>
		                    </div>
		                    <div class="form-group">
		                        <label>Assunto</label>
		                        <select name="assunto" class="form-control" required>
		                            <option value="Elogio">Elogio</option>
		                            <option value="Reclamações">Reclamações</option>
		                            <option value="Dúvidas">Dúvidas</option>
		                            <option value="Outros">Outros</option>
		                        </select>
		                    </div>
		                    <div class="form-group">
		                        <label>Mensagem</label>
		                        <textarea name="mensagem" cols="30" rows="4" class="form-control" required></textarea>
		                    </div>
		                    <div class="form-group">
		                         <button type="submit"
		                             class="text-uppercase btn-block btn-first rounded py-2">Enviar</button>
		                     </div>
		                </form>
		            </div>
	        	</div>
	    	</div>
		</c:otherwise>
	</c:choose>
	${footer}
	
	<script type="text/javascript" src="assets/vendors/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="assets/vendors/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="assets/vendors/jquery-validate/jquery.validate.min.js"></script>
	<script type="text/javascript" src="assets/vendors/jquery-validate/pt-BR.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("form").validate({
				focusInvalid: true,
				errorElement: "small"
			});
			
			$('form').on("submit", function(){
				if($(this).valid()){
					var btn = $(this).find("button[type=submit]");
					btn.attr("disabled",true);
					btn.html('Enviando <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>');
				}
			});
		});
	</script>
</body>

</html>