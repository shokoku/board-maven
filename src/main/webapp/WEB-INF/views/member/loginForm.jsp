<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <style>
        .container {
          max-width: 580px;
        }
    </style>
</head>
<body>
<h1 class="text-center m-3">로그인</h1>
<div class="container m-auto" >
    <form action="" method="post">
        <div class="form-floating mb-3">
            <input type="text" id="memberId" name="memberId" value="${member.memberId}" class="form-control" placeholder="아이디">
            <label for="memberId">아이디</label>
            <c:if test="${bindingResult.hasFieldErrors('memberId')}">
                <span style="color: red">${bindingResult.getFieldError('memberId').defaultMessage}</span><br>
            </c:if>
        </div>

        <div class="form-floating mb-3">
            <input type="password" id="memberPw" name="memberPw" value="${member.memberPw}" class="form-control" placeholder="비밀번호">
            <label for="memberPw">비밀번호</label>
            <c:if test="${bindingResult.hasFieldErrors('memberPw')}">
                <span style="color: red">${bindingResult.getFieldError('memberPw').defaultMessage}</span><br>
            </c:if>
        </div>

        <input type="submit" value="로그인" class="btn btn-lg btn-dark w-100">
    </form>
</div>
</body>
</html>
