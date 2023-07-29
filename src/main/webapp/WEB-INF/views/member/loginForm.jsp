<jsp:include page="../common/navbar.jsp" />
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

        .list-group-item.border-right::after {
          content: "|";
          position: absolute;
          right: 0;
          top: 50%;
          transform: translateY(-50%);
        }

        .custom-text {
          font-size: 0.9rem;
        }

        .custom-link {
          color: inherit;
          text-decoration: none;
        }

        .custom-link:hover {
          color: inherit;
          text-decoration: underline;
        }

    </style>
</head>
<body>
<section id="login">
    <h2 class="text-center m-3">로그인</h2>
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
            <c:if test="${not bindingResult.hasFieldErrors('id') and not bindingResult.hasFieldErrors('pw')}">
                <div class="text-center mb-3 text-danger" >
                    ${errorMessage}
                </div>
            </c:if>
            <button type="submit" class="btn btn-lg btn-dark w-100">로그인</button>
        </form>
    </div>
    <div class="text-center mt-3">
        <ul class="list-group list-group-horizontal-sm justify-content-center">
            <li class="list-group-item border-0 border-right text-muted custom-text">
                <a class="custom-link" href="/member/findPw">비밀번호 찾기</a>
            </li>
            <li class="list-group-item border-0 border-right text-muted custom-text">
                <a class="custom-link" href="/member/findId">아이디 찾기</a>
            </li>
            <li class="list-group-item border-0 text-muted custom-text">
                <a class="custom-link" href="/member/join">회원가입</a>
            </li>
        </ul>
    </div>

</section>

</body>
</html>
