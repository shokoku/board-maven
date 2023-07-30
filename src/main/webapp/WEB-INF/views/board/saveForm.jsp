<jsp:include page="../common/navbar.jsp" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글쓰기</title>
</head>
<body>
<section class="join">
    <h2 class="text-center m-3">글쓰기</h2>
    <div class="container m-auto" >
        <form action="" method="post">

            <div class="form-floating mb-3">
                <input type="text" id="title" name="title" value="${board.title}" class="form-control" placeholder="제목">
                <label for="title">제목</label>
                <c:if test="${bindingResult.hasFieldErrors('title')}">
                    <span class="text-danger">${bindingResult.getFieldError('title').defaultMessage}</span><br>
                </c:if>
            </div>

            <div class="mb-3">
                <textarea id="content" name="content" class="form-control" rows="25" placeholder="내용">${board.content}</textarea>
                <c:if test="${bindingResult.hasFieldErrors('content')}">
                    <span class="text-danger">${bindingResult.getFieldError('content').defaultMessage}</span><br>
                </c:if>
            </div>

            <button type="submit" class="btn btn-lg btn-dark w-100">글쓰기</button>
      </form>
    </div>
</section>
</body>
</html>
