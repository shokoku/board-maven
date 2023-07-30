<jsp:include page="../common/navbar.jsp" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글목록</title>
    <style>
        a{
            text-decoration: none;
            color: black;
        }

        a:hover{
          color: black;
        }

        th{
            text-align: center;
            font-weight: bold;
        }

        th:first-child{
            width: 10%;
        }
        th:nth-child(2) {
          width: 50%;
        }
        th:nth-child(3) {
            width: 20%;
        }
        th:nth-child(4) {
            width: 20%;
        }

        #writeButton{
          width: 100px;
        }
        td{
          text-align: center;
        }

        td:nth-child(2){
          text-align: start;
          padding-left: 1em;
        }

    </style>
</head>
<body>
<section class="join">
    <h2 class="text-center m-3">글목록</h2>
    <div class="container m-auto" >
        <table class="table">
            <thead>
            <tr>
                <th>No</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
            </tr>
            </thead>
            <tbody>
            <tr>
            <c:forEach items="${boards}" var="board" varStatus="no">
                <td>${boards.size() - no.index}</td>
                <td>
                    <a href="/board/detail/${board.id}">${board.title}</a>
                </td>
                <td>${board.writer}</td>
                <td><fmt:formatDate value="${board.createdDate}" pattern="yyyy-mm-dd"/></td>
            </tr>
            </c:forEach>

            </tbody>
        </table>

        <div>
            <ul class="pagination justify-content-center">
                <c:set var="startPage" value="${currentPage - 5 > 0 ? currentPage - 5 : 1}"/>
                <c:set var="endPage" value="${startPage + 9 <= totalPages ? startPage + 9 : totalPages}"/>

                <c:forEach var="i" begin="${startPage}" end="${endPage}">
                    <c:choose>
                        <c:when test="${i == currentPage}">
                            <li class="page-item active">
                                <a class="page-link" onclick="location.href='list?page=${i}'">${i}</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item">
                                <a class="page-link" onclick="location.href='list?page=${i}'">${i}</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

            </ul>
        </div>

        <div class="mb-3 text-center">
            <button id="writeButton" type="button" class="btn btn-lg btn-dark" >글쓰기</button>
        </div>
    </div>

</section>
<script defer>
  const writeButton = document.querySelector("#writeButton");
  writeButton.addEventListener("click", () =>{
    window.location.href ='/board/add';
  })
</script>
</body>
</html>
