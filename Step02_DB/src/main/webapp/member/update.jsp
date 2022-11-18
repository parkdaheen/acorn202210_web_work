<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //1. 폼전송되는 수정할 회원의 정보를 읽어온다
   request.setCharacterEncoding("utf-8");
   int num=Integer.parseInt(request.getParameter("num"));
   String name=request.getParameter("name");
   String addr=request.getParameter("addr");
   
   //회원한명의 정보를 MemberDto 객체에 담는다.
   MemberDto dto=new MemberDto(num, name, addr);
   
   
   //2. MemberDao 객체를 이용해서 DB 에 저장한다.
   boolean isSuccess=MemberDao.getInstance().update(dto);
   
   //3. 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/update.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
   <%if(isSuccess){ %>
      <script>
         alert("<%=num%> 번 회원의 정보를 수정했습니다.");
         location.href="list.jsp";
      </script>
   <%}else{ %>
      <script>
         alert("수정 실패!");
         location.href="updateform.jsp?num=<%=num %>";
      </script>
   <%} %>
</body>
</html>















