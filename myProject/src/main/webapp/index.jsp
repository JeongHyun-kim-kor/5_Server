<%-- JSP라는 것을 알려주는 코드 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- jsp 액션 태그 --%>

<jsp: forward page="main"/>
<%-- 
메인 페이지(index.jsp) 요청이 왔을 때 
요청이 /main인 servlet으로 요청 위임
    -> Servelt == Back-end -> DB연결 가능
    -> 다시 JSP 위임 가능
--%>