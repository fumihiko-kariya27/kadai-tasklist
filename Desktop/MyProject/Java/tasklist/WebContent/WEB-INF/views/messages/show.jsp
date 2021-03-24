<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="../layout/app.jsp">
	<c:param name="content">
		<h2>${message.id}番のタスクページ</h2>
		<p>業務内容：<c:out value="${message.content}" /></p><br>
		<p>完了日時：<fmt:formatDate value="${message.created_at}" pattern="yyyy-MM-dd HH:mm:ss"/></p><br>
		<p>更新日時：<fmt:formatDate value="${message.updated_at}" pattern="yyyy-MM-dd HH:mm:ss" /></p>

		<p><a href="${pageContext.request.contextPath}/index">一覧に戻る</a></p>
		<p><a href="${pageContext.request.contextPath}/edit?id=${message.id}">このメッセージを編集する</a></p>

	</c:param>
</c:import>
