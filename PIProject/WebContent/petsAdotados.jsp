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
    <title>Pets Adotados e cadastrados</title>
    <link rel="stylesheet" href="assets/vendors/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/vendors/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="assets/vendors/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="assets/css/main.css">

<body>
    <% 
		@SuppressWarnings ("unchecked")
		ArrayList<Adocao> filterAdicionados = (ArrayList<Adocao>) session.getAttribute("filterAdicionados");
		
		@SuppressWarnings ("unchecked")
		ArrayList<Adocao> filterAdotados = (ArrayList<Adocao>) session.getAttribute("filterAdotados");
	%>
    <!-- IMPORTS PAGES -->
    <c:import var="menu" url="components/menu.jsp" />
    <c:import var="footer" url="components/footer.jsp" />
    <!--  -->
    ${ menu }
    <section class="container">

        <c:choose>
            <c:when test="${param.successUpdate eq true}">
                <div class="alert alert-success my-5 p-5 text-center" role="alert">
                    <h2 class="font-weight-bold"><i class="fas fa-check-circle"></i></h2>
                    <h3 class="font-weight-bold">Adoção atualizada com sucesso.</h3>
                    <a href="petsAdotados" class="btn btn-first">Ver pets adotados e cadastrados</a>
                </div>
            </c:when>
            <c:when test="${param.errorUpdate eq true}">
                <div class="alert alert-danger my-5 p-5 text-center" role="alert">
                    <h2 class="font-weight-bold"><i class="fas fa-times-circle"></i></h2>
                    <h3 class="font-weight-bold">Adoção não atualizada.</h3>
                    <a href="petsAdotados" class="btn btn-first">Tentar novamente</a>
                </div>
            </c:when>
            <c:when test="${param.deleteSuccess eq true}">
                <div class="alert alert-success my-5 p-5 text-center" role="alert">
                    <h2 class="font-weight-bold"><i class="fas fa-check-circle"></i></h2>
                    <h3 class="font-weight-bold">Adoção deletada com sucesso.</h3>
                    <a href="petsAdotados" class="btn btn-first">Ver pets adotados e cadastrados</a>
                </div>
            </c:when>
            <c:when test="${param.deleteError eq true}">
                <div class="alert alert-danger my-5 p-5 text-center" role="alert">
                    <h2 class="font-weight-bold"><i class="fas fa-times-circle"></i></h2>
                    <h3 class="font-weight-bold">Adoção não deletada.</h3>
                    <a href="petsAdotados" class="btn btn-first">Tentar novamente</a>
                </div>
            </c:when>
            <c:otherwise>
                <!--  -->
                <h2 class="mt-5 mb-3 font-weight-bold">Pets que você adotou.</h2>
                <hr class="line-title mt-0 mb-5" />
                <c:choose>
                    <c:when test="${not empty filterAdotados}">
                        <!-- DISPLAY DE TODOS OS PETS ADOTADOS -->
                        <div class="row">
                            <c:forEach var="item" items="${filterAdotados}">
                                <div class="col-lg-4">
                                    <div class="card mb-3">
                                        <img src="data:image/jpg;base64,${item.getBase64Image()}" class="card-img-top"
                                            alt="..." height="195px">
                                        <div class="card-body">
                                            <p class="card-text">
                                                <strong>Idade: </strong> ${item.idade}
                                            </p>
                                            <p class="card-text">
                                                <strong>Cor: </strong> ${item.cor}
                                            </p>
                                            <p class="card-text">
                                                <strong>Tamanho: </strong> ${item.tamanho}
                                            </p>
                                            <p class="card-text">
                                                <strong>Sexo: </strong>
                                                ${item.getSexoPet().getSexo()}
                                            </p>
                                            <p class="card-text">
                                                <strong>Adotado: </strong>
                                                ${item.getStatus().getNameStatus()}
                                            </p>
                                        </div>
                                        <div class="card-footer text-muted text-center">
                                            Data que você adotou
                                            <fmt:formatDate pattern="dd/MM/yyyy" value="${item.dataAdocao}" />
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <!--  -->
                    </c:when>
                    <c:otherwise>
                        <div class="text-center">
                            <h4 class="font-weight-bold text-center">Você não adotou nem um pet ainda. Começe agora
                            </h4>
                            <a href="adotarPet" class="btn btn-first">Adotar um pet</a>
                        </div>
                    </c:otherwise>
                </c:choose>
                <!--  -->
                <h2 class="mt-5 mb-3 font-weight-bold">Pets que você colocou na lista para adoção</h2>
                <hr class="line-title mt-0 mb-5" />
                <div class="mb-5">
                    <c:choose>
                        <c:when test="${not empty filterAdicionados}">
                            <!-- DISPLAY DE TODOS OS PETS ADOTADOS -->
                            <div class="row">
                                <c:forEach var="item" items="${filterAdicionados}">
                                    <div class="col-lg-4">
                                        <div class="card mb-3">
                                            <img src="data:image/jpg;base64,${item.getBase64Image()}"
                                                class="card-img-top" alt="..." height="195px">
                                            <div class="card-body">
                                                <p class="card-text">
                                                    <strong>Idade: </strong> ${item.idade}
                                                </p>
                                                <p class="card-text">
                                                    <strong>Cor: </strong> ${item.cor}
                                                </p>
                                                <p class="card-text">
                                                    <strong>Tamanho: </strong> ${item.tamanho}
                                                </p>
                                                <p class="card-text">
                                                    <strong>Sexo: </strong>
                                                    ${item.getSexoPet().getSexo()}
                                                </p>
                                                <p class="card-text">
                                                    <strong>Adotado: </strong>
                                                    ${item.getStatus().getNameStatus()}
                                                </p>
                                            </div>
                                            <c:set var="checkStatus" value="${item.getStatus().getNameStatus()}" />
											<c:choose>
												<c:when test="${checkStatus.toLowerCase() eq 'aberto'}">
													<div class="card-body">
                                                    <a class="btn btn-first btn-block" data-toggle="collapse"
                                                        href="#form-edit-${item.idAdocao}" role="button"
                                                        aria-expanded="false"
                                                        aria-controls="form-edit-${item.idAdocao}">Editar</a>

                                                    <div class="collapse" id="form-edit-${item.idAdocao}">
                                                        <div class="card card-body">
                                                            <form action="petsAdotados" class="form-edit" method="post"
                                                                accept-charset="UTF-8">
                                                                <div class="form-group">
                                                                    <label class="font-weight-bold">Idade</label>
                                                                    <c:set var="idade" value="${item.idade}" />
                                                                    <select name="idade" class="form-control" required
                                                                        data-selected="${idade.toLowerCase()}">
                                                                        <option value="" disabled>Selecione a idade
                                                                        </option>
                                                                        <option value="Filhote">Filhote</option>
                                                                        <option value="Adulto">Adulto</option>
                                                                    </select>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="font-weight-bold">Espécie</label>
                                                                    <input type="text" name="tipo_animal"
                                                                        class="form-control" value="${item.tipo}"
                                                                        required />
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="font-weight-bold">Sexo</label>
                                                                    <c:set var="sexo"
                                                                        value="${item.getSexoPet().getSexo()}" />
                                                                    <select name="sexo_animal" class="form-control"
                                                                        required data-selected="${sexo.toLowerCase()}">
                                                                        <option value="" disabled>Selecione o sexo
                                                                        </option>
                                                                        <option value="macho">Macho</option>
                                                                        <option value="femea">Fêmea</option>
                                                                        <option value="desconhecido">Desconhecido
                                                                        </option>
                                                                    </select>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="font-weight-bold">Tamanho</label>
                                                                    <c:set var="tamanho"
                                                                        value="${tamanho.toLoserCase()}" />
                                                                    <select name="tamanho" class="form-control" required
                                                                        data-selected="${tamanho}">
                                                                        <option value="" disabled>Selecione o tamanho
                                                                        </option>
                                                                        <option value="Pequeno">Pequeno</option>
                                                                        <option value="Médio">Médio</option>
                                                                        <option value="Grande">Grande</option>
                                                                    </select>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="font-weight-bold">Cor</label>
                                                                    <input type="text" name="cor" class="form-control"
                                                                        value="${item.cor}" required />
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="font-weight-bold">Descrição</label>
                                                                    <textarea rows="4" cols="4" class="form-control"
                                                                        name="descricao"
                                                                        required>${item.descricao}</textarea>
                                                                </div>
                                                                <input type="hidden" name="idAdocao"
                                                                    value="${item.idAdocao}" />
                                                                <div class="form-group">
                                                                    <button type="submit"
                                                                        class="btn btn-first btn-block">Salvar</button>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                    <form method="post" action="petsAdotados">
                                                        <input type="hidden" name="delete" value="${item.idAdocao}" />
                                                        <button type="submit"
                                                            class="btn btn-block btn-danger mt-3 font-roboto text-white font-weight-bold">
                                                            Deletar
                                                        </button>
                                                    </form>
                                                </div>	
												</c:when>
												<c:otherwise>
													<div class="card-body">
														<div class="alert alert-info" role="alert">
														  <strong>
														  	Data de adoção <fmt:formatDate pattern="dd/MM/yyyy" value="${item.dataAdocao}" />
														  </strong>
														</div>
													</div>
												</c:otherwise>
											</c:choose>
                                            <div class="card-footer text-muted text-center">
                                                Data de criação
                                                <fmt:formatDate pattern="dd/MM/yyyy" value="${item.dataCriacao}" />
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <!--  -->
                        </c:when>
                        <c:otherwise>
                            <div class="text-center">
                                <h4 class="font-weight-bold">Você não colocou nenhum pet apara adoção. Comece agora</h4>
                                <a href="adicionarPet.jsp" class="btn btn-first">Adicionar um pet</a>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
                <!--  -->
            </c:otherwise>
        </c:choose>


    </section>
    ${ footer }

    <script type="text/javascript" src="assets/vendors/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="assets/vendors/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="assets/vendors/jquery-validate/jquery.validate.min.js"></script>
    <script type="text/javascript" src="assets/vendors/jquery-validate/pt-BR.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            $.each($("select"), function () {
                var selected = $(this).data("selected");
                if (selected) {
                    $(this).find("option").each(function () {
                        var val = $(this).attr("value").toLowerCase();
                        if (val === selected) {
                            $(this).attr("selected", true);
                        }
                    });
                }
            });

            $(".collapse").collapse({
                toggle: false
            });
            $('.form-edit').on("submit", function () {
                if ($(this).valid()) {
                    var btn = $(this).find("button[type=submit]");
                    btn.attr("disabled", true);
                    btn.html(
                        'Salvando <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>'
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