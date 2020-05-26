<%@page import="model.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Página de contato</title>
<link rel="stylesheet" href="assets/vendors/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="assets/vendors/fontawesome/css/fontawesome.min.css">
<link rel="stylesheet" href="assets/css/main.css">
</head>
<body>
	<% Usuario usuario = (Usuario) session.getAttribute("usuario"); %>
	<!-- IMPORTS PAGES -->
	<c:import var="menu" url="components/menu.jsp" />
	<c:import var="footer" url="components/footer.jsp" />
	<!--  -->
	${menu}
	<c:choose>
		<c:when test="${param.send eq true}">
			<!-- CASO SEJA ENVIADO -->
		   	<div class="h-100 w-100 d-flex align-items-center py-5 py-5">
	   			<div class="d-block text-center m-auto">
	   				<img src="assets/images/sucesso-contato.svg" class="img-fluid" width="200" />
			  		<div class="alert alert-success" role="alert">
					  <h4 class="alert-heading font-weight-bold">Mensagem enviada com sucesso!</h4>
					  <h5 class="font-weight-bold">Obrigado, ${usuario.nome}</h5>
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
            	<h3 class="font-weight-bold mt-5">Contato</h3>
                <hr class="line-title mt-0 mb-5">
                     
	    		<div class="row justify-content-center">
	    			<div class="col-lg-12">
	    				<h5 class="text-center mb-5">
	    				Preencha os dados e entraremos em contato com você em breve!
	    				</h5>
	    			</div>
		            <div class="col-lg-8">
		                <form action="enviarContatoInterno" method="POST" accept-charset="UTF-8">
		                    <div class="form-group">
		                        <label>Nome</label>
		                        <input type="text" class="form-control" name="nome" value="${usuario.nome}" required>
		                    </div>
		                    <div class="form-group">
		                        <label>Email</label>
		                        <input type="email" class="form-control" name="email" value="${usuario.email}" required>
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