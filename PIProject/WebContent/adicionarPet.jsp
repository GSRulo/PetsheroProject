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
<title>Adoção</title>
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
	<section class="banner-adicionar-pet mask-bg d-flex align-items-center justify-content-center">
        <div class="container position-relative">
           <h2 class="text-white font-weight-bold text-center">
                 Adicione um pet para Adoção
             </h2>
             <c:if test="${param.success eq null or param.success eq false}">
             	<p class="text-white text-center">
	                Preencha os dados logo abaixo e cadastre um pet.
	             </p>
             </c:if>
        </div>
        <a href="#ancora" class="ancora-banner">
            <i class="fas fa-arrow-circle-down"></i>
        </a>
    </section>
	<section class="container" id="ancora">
		<c:choose>
			<c:when test="${param.success eq true}">
				<div class="row justify-content-center">
					<div class="col-lg-6">
						<div class="alert alert-success text-center mt-5" role="alert">
							<h5>Adoção criada com sucesso!</h5> 
							Obrigado, <strong><c:out value="${usuario.nome}" /></strong>, por participar dessa campanha <i class="far fa-smile-beam"></i>
							<h2 class="text-center"><i class="far fa-check-circle"></i></h2>
							<a href="adotarPet" class="btn btn-first">Ver pets</a>
						</div>
					</div>
				</div>
			</c:when>
			<c:when test="${param.error eq true}">
				<div class="row justify-content-center">
					<div class="col-lg-6 text-center">
						<div class="alert alert-danger text-center mt-5" role="alert">
							<h5>Houve algum erro</h5> 
							Desculpa, <strong><c:out value="${usuario.nome}" /></strong>, 
							algum erro aconteceu <i class="far fa-sad-tear"></i>
							<h2 class="text-center"><i class="far fa-times-circle"></i></h2>
						</div>
						<a href="adicionarPet.jsp" class="btn btn-first">Tentar novamente</a>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="my-5">
					<h3 class="font-weight-bold mt-5 pt-5" id="ancora">
                        Criar uma adoção
                     </h3>
                     <hr class="line-title mt-0 mb-5">
					<div class="row justify-content-center">
						<div class="col-lg-6">
							<form action="adicionarPet" method="POST" accept-charset="UTF-8" enctype="multipart/form-data">
								<div class="form-group">
									<label class="font-weight-bold">Idade</label>
									<select name="idade" class="form-control" required>
										<option value="" selected disabled>Selecione a idade</option>
										<option value="Filhote">Filhote</option>
										<option value="Adulto">Adulto</option>
									</select>
								</div>
								<div class="form-group">
									<label class="font-weight-bold">Espécie</label>
									<input type="text" name="tipo_animal" class="form-control" required />
								</div>
								<div class="form-group">
									<label class="font-weight-bold">Sexo</label>
									<select name="sexo_animal" class="form-control" required>
										<option value="" selected disabled>Selecione o sexo</option>
										<option value="macho">Macho</option>
										<option value="femea">Fêmea</option>
										<option value="desconhecido">Desconhecido</option>
									</select>
								</div>
								<div class="form-group">
									<label class="font-weight-bold">Tamanho</label>
									<select name="tamanho" class="form-control" required>
										<option value="" selected disabled>Selecione o tamanho</option>
										<option value="Pequeno">Pequeno</option>
										<option value="Médio">Médio</option>
										<option value="Grande">Grande</option>
									</select>
								</div>
								<div class="form-group">
									<label class="font-weight-bold">Cor</label>
									<input type="text" name="cor" class="form-control" required />
								</div>
								<div class="form-group">
									<label class="font-weight-bold">Descrição</label>
									<textarea rows="4" cols="4" class="form-control" name="descricao" required></textarea>
								</div>
								<div class="form-group mb-0">
									<h5 class="font-weight-bold">Visualizar foto</h5>
									<div class="p-4" id="render-img">
										<h2 class="text-center"><i class="far fa-image"></i></h2>
									</div>
								</div>
								<div class="form-group">
									<input type="file" id="imgPet" required class="invisible d-block" name="img" accept="image/x-png,image/gif,image/jpeg" />
									<label for="imgPet" class="img-file d-flex align-items-center justify-content-center">
										<span class="d-block">Carregar foto <i class="fas fa-upload ml-2"></i></span>
									</label>
									 <small id="emailHelp" class="form-text text-muted">Imagem deve conter menos de 2MB</small>
								</div>
								<div class="form-group">
									<button type="submit" class="text-uppercase btn-block btn-first rounded py-2">Adicionar</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</section>
	${footer}
	
	<script type="text/javascript" src="assets/vendors/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="assets/vendors/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="assets/vendors/jquery-validate/jquery.validate.min.js"></script>
	<script type="text/javascript" src="assets/vendors/jquery-validate/pt-BR.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
            $(".ancora-banner").click(function (e) {
                e.preventDefault();
                var alvo = $(this).attr("href");
                $('html, body').animate({
                    scrollTop: $(alvo).offset().top
                }, 500);
            });
            $('form').on("submit", function(){
            	if($(this).valid()){
            		var btn = $(this).find("button[type=submit]");
    				btn.attr("disabled",true);
    				btn.html('Adicionando <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>');
            	}
            });
			$("form").validate({
				focusInvalid: true,
				errorElement: "small"
			});
			function readURL(input) {
			  if (input.files && input.files[0]) {
			    var reader = new FileReader();
			    var fileSize = Math.round(input.files[0].size/1024);
			    var maxSize = 2000;
			    if(fileSize > maxSize){
			    	$("#imgPet").val("");
			    	var mb = parseFloat(fileSize/1000);
			    	var template = [
			    		'<div class="alert alert-danger" role="alert">',
						  'Imagem muito grande. ' + ( Number.isInteger(mb) ? mb : mb.toFixed(2) ) + "MB",
						'</div>'
			    	].join("");
			    	$("#render-img").html(template);
			    	return;	
			    }
			    
			    reader.onload = function(e) {
			    	var img = $('<img/>',{
				    	  "src": e.target.result,
				    	  "class": "img-fluid"
				      });
			      	$("#render-img").html(img);
			    }
			    reader.readAsDataURL(input.files[0]); // convert to base64 string
			  }
			}
			$("#imgPet").change(function() {
			  	readURL(this);
			});
		});
	</script>
</body>
</html>