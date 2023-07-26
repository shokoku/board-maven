<jsp:include page="../common/navbar.jsp" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <style>
      .container {
        max-width: 580px;
      }
    </style>
</head>
<body>
<section id="info">
    <h2 class="text-center m-3">회원수정</h2>
    <div class="container m-auto">
        <form action="" method="post">
            <div class="form-floating mb-3">
                <input type="text" id="id" name="id" value="${member.id}" class="form-control bg-black bg-opacity-25" placeholder="아이디" readonly>
                <label for="id">아이디</label>
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
            <div class="mb-3 row">
                <span class="col"><button type="submit" class="btn btn-lg btn-dark w-100">저장</button></span>
                <span class="col"><button id="cancelButton" type="button" class="btn btn-lg btn-dark w-100">취소</button></span>
            </div>
        </form>
</div>
</section>

<script>
  const editButton = document.querySelector("#cancelButton");
  editButton.addEventListener("click", () =>{
    window.location.href ='/member/info';
  })
</script>
</body>
</html>
