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
    <h2 class="text-center m-3">회원정보</h2>
    <div class="container m-auto">

        <form>
            <div class="form-floating mb-3">
                <input type="text" id="id" name="id" value="${member.id}" class="form-control" placeholder="아이디" readonly>
                <label for="id">아이디</label>
            </div>

            <div class="form-floating mb-3">
                <input type="tel" id="name" name="name" value="${member.name}" class="form-control" placeholder="이름" readonly>
                <label for="name">이름</label>
            </div>

            <div class="form-floating mb-3">
                <input type="text" id="mobile" name="mobile" value="${member.mobile}" class="form-control" placeholder="전화번호" readonly>
                <label for="mobile">전화번호</label>
            </div>

            <div class="form-floating mb-3">
                <input type="text" id="email" name="email" value="${member.email}" class="form-control" placeholder="이메일" readonly>
                <label for="email">이메일</label>
            </div>
            <div class="mb-3">
                <button id="editButton" type="button" class="btn btn-lg btn-dark w-100">수정</button>
            </div>
        </form>
</div>
</section>
<script>
    const editButton = document.querySelector("#editButton");
    editButton.addEventListener("click", () =>{
      window.location.href ='/member/edit';
    })
</script>
</body>
</html>
