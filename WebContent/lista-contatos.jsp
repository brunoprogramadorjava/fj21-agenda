<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista contatos forEach</title>
</head>
<body>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

	<c:import url="cabecalho.jsp" />
	<!-- Cria o DAO 
	<jsp:useBean id="dao" class="br.com.caelum.agenda.dao.ContatoDao" /> -->

	<table>
		<tr>
			<td><b>Id</b></td>
			<td><b>Nome</b></td>
			<td><b>E-mail</b></td>
			<td><b>Endereco</b></td>
			<td><b>Data Nascimento</b></td>
		</tr>

		<!-- percorre contatos montando as linhas da tabela -->
		<c:forEach var="contato" items="${contatos}" varStatus="id">
			<tr bgcolor="#${id.count % 2 == 0 ? 'CCCCCC':'ffffff'}">
				<td>${id.count}</td>
				<td>${contato.nome}</td>

				<td><c:choose>
						<c:when test="${not empty contato.email}">
							<a href="mailto:${contato.email }">${contato.email }</a>
						</c:when>
						<c:otherwise>
							E-mail nao informado
						</c:otherwise>
					</c:choose></td>

				<td>${contato.endereco}</td>
				<td><fmt:formatDate value="${contato.dataNascimento.time }"
						pattern="dd/MM/yyyy" /></td>
				<td><a href="mvc?logica=RemoveContatoLogica&id=${contato.id}">Remover</a>
				</td>
			</tr>
		</c:forEach>
	</table>

	<c:import url="rodape.jsp" />
</body>
</html>