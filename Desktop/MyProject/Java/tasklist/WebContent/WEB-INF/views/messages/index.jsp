<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
	<c:param name="content">
		<h2>タスク完了一覧</h2>
		<ul>
			<c:forEach var="message" items="${message}">
				<a href="${pageContext.request.contextPath}/show?id=${message.id}">
                        <c:out value="${message.id}" />
                    </a>
                    ：<c:out value="${message.content}" /><br>
			</c:forEach>
		</ul>

		<p><a href="${pageContext.request.contextPath}/new">完了済みタスクの登録</a></p>
	</c:param>
</c:import>