<jsp:include page="../common/navbar.jsp" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <style>
        .container {
          max-width: 580px;
        }
    </style>
</head>
<body>
<section class="join">
    <h2 class="text-center m-3">회원가입</h2>
    <div class="container m-auto" >
        <form action="" method="post">
            <div class="form-floating mb-3">
                <input type="text" id="id" name="id" value="${member.id}" class="form-control" placeholder="아이디">
                <label for="id">아이디</label>
                <c:if test="${bindingResult.hasFieldErrors('id')}">
                    <span class="text-danger">${bindingResult.getFieldError('id').defaultMessage}</span><br>
                </c:if>
            </div>

            <div class="form-floating mb-3">
                <input type="password" id="pw" name="pw" value="${member.pw}" class="form-control" placeholder="비밀번호">
                <label for="pw">비밀번호</label>
                <c:if test="${bindingResult.hasFieldErrors('pw')}">
                    <span class="text-danger">${bindingResult.getFieldError('pw').defaultMessage}</span><br>
                </c:if>
            </div>


            <div class="form-floating mb-3">
                <input type="password" id="pw2" name="pw2" value="${member.pw2}" class="form-control" placeholder="비밀번호 확인">
                <label for="pw2">비밀번호 확인</label>
                <c:if test="${bindingResult.hasFieldErrors('pw2')}">
                    <span class="text-danger">${bindingResult.getFieldError('pw2').defaultMessage}</span><br>
                </c:if>
            </div>


            <div class="form-floating mb-3">
                <input type="tel" id="name" name="name" value="${member.name}" class="form-control" placeholder="이름">
                <label for="name">이름</label>
                <c:if test="${bindingResult.hasFieldErrors('name')}">
                    <span class="text-danger">${bindingResult.getFieldError('name').defaultMessage}</span><br>
                </c:if>
            </div>

            <div class="form-floating mb-3">
                <input type="text" id="mobile" name="mobile" value="${member.mobile}" class="form-control" placeholder="전화번호">
                <label for="mobile">전화번호</label>
                <c:if test="${bindingResult.hasFieldErrors('mobile')}">
                    <span class="text-danger">${bindingResult.getFieldError('mobile').defaultMessage}</span><br>
                </c:if>
            </div>

            <div class="form-floating mb-3">
                <input type="text" id="email" name="email" value="${member.email}" class="form-control" placeholder="이메일">
                <label for="email">이메일</label>
                <c:if test="${bindingResult.hasFieldErrors('email')}">
                    <span class="text-danger">${bindingResult.getFieldError('email').defaultMessage}</span><br>
                </c:if>
            </div>

            <button type="submit" class="btn btn-lg btn-dark w-100">가입</button>
    </form>
</div>
</section>
</body>
</html>
