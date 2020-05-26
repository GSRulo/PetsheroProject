<div class="bg-default-dark">
<div class="container">
	<nav class="navbar navbar-expand-lg navbar-light p-0">
	  <a class="navbar-brand text-center" href="home">
	  	<img src="assets/images/logo.svg" class="img-fluid" width="50" />  
	  	<strong class="text-uppercase m-0 title-logo d-block">pets hero</strong>
	  </a>
	  <button class="navbar-toggler text-white" type="button" 
	  data-toggle="collapse" data-target="#navbarText" 
	  aria-controls="navbarText" aria-expanded="false" 
	  aria-label="Toggle navigation" style="border: 0;">
	    <i class="fas fa-bars h2 m-0"></i>
	  </button>
	  <div class="collapse navbar-collapse" id="navbarText">
	    <ul class="navbar-nav mr-auto text-uppercase">
	      <li class="nav-item mx-3 my-3 my-lg-0 active">
	        <a class="nav-link px-0 d-inline-block d-lg-block" href="home">Home</a>
	      </li>
	      <li class="nav-item mx-3 mb-3 mb-lg-0">
	        <a class="nav-link px-0 d-inline-block d-lg-block" href="adotarPet" data-page="adotarPet.jsp">Adotar pet</a>
	      </li>
	      <li class="nav-item mx-3 mb-3 mb-lg-0">
	        <a class="nav-link px-0 d-inline-block d-lg-block" href="adicionarPet.jsp" data-page="adicionarPet.jsp">Adicionar pet</a>
	      </li>
	      <li class="nav-item mx-3 mb-3 mb-lg-0">
	        <a class="nav-link px-0 d-inline-block d-lg-block" href="contribuicoes" data-page="contribuicoes.jsp">Contribuições</a>
	      </li>
	      <li class="nav-item mx-3 mb-3 mb-lg-0">
	        <a class="nav-link px-0 d-inline-block d-lg-block" href="denuncia" data-page="denuncia.jsp">Denúncias</a>
	      </li>
	      <li class="nav-item mx-3 mb-3 mb-lg-0">
	        <a class="nav-link px-0 d-inline-block d-lg-block" href="sobreInterno.jsp" data-page="sobreInterno.jsp">Sobre</a>
	      </li>
	      <li class="nav-item mx-3 mb-3 mb-lg-0">
	        <a class="nav-link px-0 d-inline-block d-lg-block" href="contatoInterno.jsp" data-page="contatoInterno.jsp">Contato</a>
	      </li>
	    </ul>
	    <div class="navbar-text">
	    	<div class="btn-group">
			  <button type="button" class="btn bg-default-dark text-white dropdown-toggle" data-toggle="dropdown" data-display="static" aria-haspopup="true" aria-expanded="false">
			    <i class="fas fa-user-circle h4 m-0"></i>
			  </button>
			  <div class="dropdown-menu dropdown-menu-lg-right">
    			<h6 class="dropdown-header font-weight-bold">Bem-vindo ${usuario.nome}</h6>
			  	<div class="dropdown-divider"></div>
			    <span class="dropdown-item">
				    <a href="perfil.jsp" data-page="perfil.jsp">
				    	<i class="fas fa-id-badge"></i> Perfil
				    </a>
			    </span>
			    <span class="dropdown-item">
				    <a href="petsAdotados" data-page="petsAdotados.jsp">
				    	<i class="fas fa-dog"></i> Pets adotados/Cadastrados
				    </a>
			    </span>
			    <a href="auth?logout=true" class="dropdown-item">
			    	<i class="fas fa-sign-out-alt"></i> Sair
			    </a>
			  </div>
			</div>
	    </div>
	  </div>
	</nav>
</div>
</div>

<script type="text/javascript">
	/**
		FUNCAO PARA MUDAR O MENU DE ACORDO COM A PÁGINA ATUAL
	*/
	var checkPath = "<%= request.getServletPath()%>";
	checkPath = checkPath.replace(/(\/)/, "");
	var menu = document.getElementById("navbarText");
	var listItem = menu.querySelectorAll(".nav-item, .dropdown-item");

	if(!(checkPath.indexOf("index") != -1)){
		listItem.forEach(function(item){
			item.classList.remove("active");
		});
		menu.querySelector('a[data-page="' + checkPath + '"]').parentNode.classList.add("active");
	}
</script>