<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 폼</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <style>
        .container {
          max-width: 580px;
        }
    </style>
</head>
<body>
<h1 class="text-center m-3">회원가입</h1>
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


        <div class="form-floating mb-3">
            <input type="password" id="memberPw2" name="memberPw2" value="${member.memberPw2}" class="form-control" placeholder="비밀번호 확인">
            <label for="memberPw2">비밀번호 확인</label>
            <c:if test="${bindingResult.hasFieldErrors('memberPw2')}">
                <span style="color: red">${bindingResult.getFieldError('memberPw2').defaultMessage}</span><br>
            </c:if>
        </div>



        <div class="form-floating mb-3">
            <input type="tel" id="memberName" name="memberName" value="${member.memberName}" class="form-control" placeholder="이름">
            <label for="memberName">이름</label>
            <c:if test="${bindingResult.hasFieldErrors('memberName')}">
                <span style="color: red">${bindingResult.getFieldError('memberName').defaultMessage}</span><br>
            </c:if>
        </div>

        <div class="form-floating mb-3">
            <input type="text" id="memberMobile" name="memberMobile" value="${member.memberMobile}" class="form-control" placeholder="전화번호">
            <label for="memberMobile">전화번호</label>
            <c:if test="${bindingResult.hasFieldErrors('memberMobile')}">
                <span style="color: red">${bindingResult.getFieldError('memberMobile').defaultMessage}</span><br>
            </c:if>
        </div>

        <div class="form-floating mb-3">
            <input type="text" id="memberEmail" name="memberEmail" value="${member.memberEmail}" class="form-control" placeholder="이메일">
            <label for="memberEmail">이메일</label>
            <c:if test="${bindingResult.hasFieldErrors('memberEmail')}">
                <span style="color: red">${bindingResult.getFieldError('memberEmail').defaultMessage}</span><br>
            </c:if>
        </div>

        <input type="submit" value="가입" class="btn btn-lg btn-dark w-100">
</form>
</div>
</body>
</html>
