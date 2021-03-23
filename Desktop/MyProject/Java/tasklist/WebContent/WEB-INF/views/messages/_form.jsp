<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<label>登録内容<br />
<input type="text" name="content" value="${message.content}"/>
<br /><br />
</label><br />
<input type="hidden" name="_token" value="${_token}"/>
<button type="submit">登録</button>