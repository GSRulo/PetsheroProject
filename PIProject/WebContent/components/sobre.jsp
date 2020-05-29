<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<section class="banner-sobre mask-bg d-flex align-items-center justify-content-center"></section>

<section class="bg-default-dark">
	<div class="container">
		<div class="py-5 text-white">
			<h3 class="font-weight-bold">Quem Somos</h3>
			<p>
			 Somos uma equipe de estudantes da Universidade São Judas, e durante o semestre corrente
			 trabalhamos nesta página, com o objetivo de concluir o projeto da matéria 
			 P.I(Projeto Interdisciplinar) coordenado pelo professor Roberto Kalili. 
			 Todos os seis integrantes  do nosso projeto tiveram funções variadas dentro 
			 do desenvolvimento do mesmo, Sendo as principais: Front-End, Back-End e Documentação, 
			 conforme será mostrado mais abaixo.
			</p>
			
			<h3 class="font-weight-bold mt-4">Sobre o Projeto</h3>
			<p>
			O Projeto tem como proposito criar um site, utilizando os conhecimentos adquiridos 
			durante o semestre, e esse deve ajudar em uma necessidade da sociedade. 
			Tendo isso em mente, levamos um tempo para decidir qual seria o tema, Porém, 
			depois de muitas conversas chegamos ao modelo no qual estamos agora, a "Pet's Hero".<br><br>
			A "Pet's Hero" é uma plataforma onde você pode adotar um animal, criar denúncias 
			de maus tratos a animais e caso seja uma ONG temos um perfil especifico para que 
			possam ser criadas contribuições, para assim, receber um apoio financeiro das pessoas.
			</p>
		</div>
	</div>
</section>

<section class="container">
	<h3 class="font-weight-bold mt-5" id="ancora">
        Alunos
    </h3>
    <hr class="line-title mt-0 mb-5">
    <div class="row" id="append-perfil"></div>
</section>

<script type="text/javascript" src="assets/vendors/jquery/jquery.min.js"></script>
<script type="text/javascript" src="assets/vendors/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$.getJSON("assets/js/sobre_info.json").then(function(res){
			var data = res["data"].sort(function(a,b){
				return a.nome < b.nome ? -1 : a.nome > b.nome ? 1 : 0;
			});
			data.forEach(function(val){
				var template = [
					'<div class="col-lg-6 mb-5">',
						'<div class="row align-items-center">',
							'<div class="text-center col-lg-4">',
								'<img src="assets/images/'+ val.foto +'" alt="" class="rounded-circle img-fluid thumb-perfil">',
							'</div>',
							'<div class="col text-center text-lg-left">',
								'<strong>'+val.nome+'</strong>',
								'<span class="d-block">RA: '+val.ra+'</span>',
								'<span class="d-block">Turma: '+val.turma+'</span>',
								'<p class="mt-3">Participação: '+val.descricao+'</p>',
							'</div>',
						'</div>',
					'</div>'
				];
				$("#append-perfil").append(template.join(""));
			});
		});
	});
</script>
