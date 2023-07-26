<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
</head>

<body>
<section id="nav" class="container-fluid">
    <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">SANUS</a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggler navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-upload">
                        <a class="nav-link">메뉴1</a>
                    </li>
                    <li class="nav-upload">
                        <a class="nav-link">메뉴2</a>
                    </li>
                    <li class="nav-upload">
                        <a class="nav-link">메뉴3</a>
                    </li>
                </ul>

                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <c:if test="${pageContext.request.isUserInRole('ROLE_ADMIN')}">
                        <li class="nav-upload">
                            <a class="nav-link" href="/admin">관리자</a>
                        </li>
                    </c:if>
                    <li class="nav-upload">
                        <c:if test="${pageContext.request.userPrincipal == null}">
                            <a class="nav-link" href="/member/join">회원가입</a>
                        </c:if>
                        <c:if test="${pageContext.request.userPrincipal != null}">
                            <a class="nav-link" href="/member/info">회원정보</a>
                        </c:if>

                    </li>

                    <li class="nav-upload">
                        <c:if test="${pageContext.request.userPrincipal == null}">
                            <a class="nav-link" href="/member/login">로그인</a>
                        </c:if>
                        <c:if test="${pageContext.request.userPrincipal != null}">
                            <a class="nav-link" href="/member/logout">로그아웃</a>
                        </c:if>
                    </li>
                </ul>

            </div>
        </div>
    </nav>
</section>
