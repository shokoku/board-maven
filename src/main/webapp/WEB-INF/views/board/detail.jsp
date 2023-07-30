<jsp:include page="../common/navbar.jsp" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글 상세</title>
</head>
<body>
<section class="join">
    <h2 class="text-center m-3">글 상세</h2>
    <div class="container m-auto" >
        <form>
            <div class="form-floating mb-3">
                <input type="text" id="title" name="title" value="${board.title}" class="form-control" placeholder="제목" readonly>
                <label for="title">제목</label>
            </div>

            <div class="form-floating mb-3">
                <input type="text" id="writer" name="writer" value="${board.writer}" class="form-control" placeholder="작성자" readonly>
                <label for="writer">작성자</label>
            </div>

            <div class="form-floating mb-3">
                <input type="text" id="updatedDate" name="updatedDate" value="<fmt:formatDate value='${board.updatedDate}' pattern='yyyy-MM-dd' />" class="form-control" placeholder="수정일" readonly>
                <label for="updatedDate">수정일</label>
            </div>

            <div class="mb-3">
                <textarea id="content" name="content" class="form-control" rows="25" placeholder="내용" readonly>${board.content}</textarea>
            </div>

            <button type="button" class="btn btn-lg btn-dark w-100">수정</button>
      </form>
    </div>
</section>
</body>
</html>
