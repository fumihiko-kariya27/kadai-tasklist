<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h2>登録タスク内容</h2>

        <form method="POST" action="${pageContext.request.contextPath}/create">
            <label>登録内容<br />
			<input type="text" name="content" value="${message.content}"/>
			<br /><br />
			</label><br />
			<input type="hidden" name="_token" value="${_token}"/>
			<button type="submit">登録</button>
        </form>

        <p><a href="${pageContext.request.contextPath}/index">一覧に戻る</a></p>

    </c:param>
</c:import>