<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
	prefix : 접두사 
	uri(Uniform Resource Identifier) : 자원을 구분하는 식별자(주소 형태) DB의 primary key같은
--%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>3. JSTL</title>
</head>
<body>
    <h1>JSTL(Jsp Standard Tag Library</h1>

    <pre>
        JSP에서 자주 사용되거나 공통적으로 사용되는 Java코드의 
        표기법을 간단히 태그화하여 표준으로 제공하는 것.

        (if, for, 배열/컬렉션 길이, 문자열 치환, 숫자 데이터 형식 변경
        데이터 파싱, scope 변수 선언 등 )   
    </pre>
    
    <h3>JSTL 라이브러리 등록 방법</h3>
    <ol>
        <li>https://tomcat.apache.org/download-taglibs.cgi</li>

        <li>Jaf Files -> Impl, Spec, EL 다운로드 > tools폴더</li>
    </ol>

	<hr>
	
	<h3>JSTL 사용을 위한 선언 방법</h3>
	<pre>
		JSP 파일 최상단에 추가하고자 하는 JSTL tablib를 추가해야한다.
	
	</pre>
	
	<hr>
	
	<h1>1. 변수 선언 (c:set 태그)</h1>
	
	<pre>
		- 변수를 선언하고 값을 초기화하는 태그
		  (원하는 scope의 냊아 객체에 값 세팅)
		  
		- c:set 속성
		1) var : 변수명(setAttribute의 key 값)
		2) value : 대입될 값
		3) scope : 내장 객체 범위 (기본값 : page)
		
			
	</pre>
	
	
	<%-- scriptlet 작성법 --%>
	<% request.setAttribute("num1", 10); %> <%--이렇게 선언해야 el로 사용가능 --%>
	
	<%-- <% int num = 10; %>
	
	<%= num %> --%>
	
	<%-- JSTL 작성법 --%>
	<c:set var="num2" value="20" /> 
	<%--HTML코드처럼 작성하는 Java코드 --%>
	${num1 }  / ${num2 }  
	
	<c:set var="num2" value="300" scope="request"/>
	
	<h4> ${ num2 } </h4> <!-- 20 -->
	<h4> ${ requestScope.num2 } </h4> <!-- 300 -->
	
	<c:set var="temp" value="임시 값" scope="session"/>

	<h4>temp : ${temp}</h4>

	<hr>
	
	<h1>2. 변수 삭제 (c:remove)</h1>
	
	<pre>
		- c:set / setAttribute()로 추가된 값을 제거하는 
		
		- c: remove 속성
		 1) var   :  삭제할 변수명(key)
		 2) scope : 삭제할 내장 객체 범위(기본값 : 모든 범위)
	</pre>
	
	<p>
		<c:remove var="temp"/>
		temp 삭제 : ${temp}   <br>
		
		<c:set var="test" value="page" scope="page"/>
		<c:set var="test" value="request" scope="request"/>
		<c:set var="test" value="session" scope="session"/>
		<c:set var="test" value="application" scope="application"/>
		
		<%-- 특정 범위 삭제 / 모든 범위 삭제 --%>
		                    <%-- <c:remove var="test"/> --%> 
		 <c:remove var="test" scope="request"/>
		
		${pageScope.test } / ${requestScope.test }
		/ ${sessionScope.test } / ${applicationScope.test }
		
		
	</p>

		<hr>
		
		<h1>3. 조건문 - if(c:if 태그)</h1>
		
		<pre>
			- 단독 if문(else, else if문 없음)
			
			* 주의 사항 *
			1) test 속성 값 작성은 무조건 EL 구문이어야만 한다.
			2) test 속성 값 "" 안에는 공백이 존재해서는 안된다.
			
			
		</pre>
		
		<%-- Scriptlet 작성법 --%>
		<% if(1 == 1) { %>
			출력됩니다.
		<% } %>
		
		<%-- JSTL 작성법 --%>
		<c:if test= "${1 == 1}">
			JSTL 작성법
		</c:if>
		
		
		<!-- session 범위에 세팅된 test의 값이 "session"인 경우 -->
		<!-- 
			- 문자열 비교 시 (==) 비교연산자 사용 가능
			- 문자열임을 표기하는 리터럴 == ' '(홑따옴표) / ""(쌍따옴표)
			
			[동일함]
			html 태그 속성="속성값" -> 내부 문자열에 ' '
			html 태그 속성='속성값' -> 내부 문자열에 " " 사용하기
		-->
		<c:if test="${ sessionScope.test == 'session' }"> 
					<!-- 겉(속성값 : "" 안(문자열) : '' -->
			<h4>session)Scope.test == 'session'</h4>
	
		</c:if> 
		
	
		<!-- 단톡 if문읜 경우의 단점 : 
				else 상황에 대한 if문을 별도 작성을 해야한다. 
			+   효율성 감소 문제(∵ 모든 if문 검사 진행)
		-->	
		<c:if test="${ sessionScope.test == 'session' }"> 
			<h4>session)Scope.test == 'session'</h4>
	
		</c:if> 
		
		<hr>
		
		
		<h1>4. 조건문 - if ~ else if  ~ else ( c:choose, c:when, c:otherwise  )</h1>
		
		<pre>
			c:choose : when, otherwise를 감싸는 태그
					  (현재 태그 내부에 if ~ else if ~ else를 작성하겠다 선언하는 정도)
			
			c:when : if / else if 를 나타내는 태그
					속성은 test 밖에 없음. (조건 작성 속성)
			
			c:otherwise : else를 나타내는 태그
						  아무런 속성도 존재하지 않음
		</pre>
		
		<c:set var="temp2" value="50"/>
		
		<c:choose>
			<c:when test= "${temp2 >100 }">
				100보다 크다
			</c:when>
			
			<c:when test= "${temp2 <100 }">
				100보다 작다
			</c:when>
			
			<c:otherwise>
				100과 같다
			</c:otherwise>
		
		</c:choose>















</body>
</html>