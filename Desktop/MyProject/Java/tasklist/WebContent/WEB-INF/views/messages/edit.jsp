<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
	<c:param name="content">
		<c:if test="${errors != null}">
    		<div id="flush_error">
       		 入力内容にエラーがあります。<br />
       			 <c:forEach var="error" items="${errors}">
           			 <c:out value="${error}" /><br />
      			 </c:forEach>
   			</div>
   		</c:if>
		<c:choose>
			<c:when test="${message!=null}">
				<h2>${message.id}番のタスク編集ページ</h2>
				<form method="post" action="${pageContext.request.contextPath}/update">
					<label>編集内容<br />
					<input type="text" name="content" value="${message.content}"/>
					<br /><br />
					</label><br />
					<input type="hidden" name="_token" value="${_token}"/>
					<button type="submit">登録</button>
				</form>

				<p><a href="${pageContext.request.contextPath}/index">・一覧へ戻る</a></p>
				<p><a href="#" onclick="confirmDestroy();">・このメッセージを削除する</a></p>
				<form method="post" action="${pageContext.request.contextPath}/destroy">
					<input type="hidden" name="_token" value="${_token}" />
				</form>
				<script>
      			  function confirmDestroy() {
       			     if(confirm("本当に削除してよろしいですか？")) {
       			         document.forms[1].submit();
       				     }
    		    	}
    		    </script>
     	   </c:when>
     	   <c:otherwise>
     		   <h3>お探しのデータは見つかりませんでした</h3>
      	  </c:otherwise>
        </c:choose>
	</c:param>
</c:import>