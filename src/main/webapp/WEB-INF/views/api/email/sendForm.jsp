<jsp:include page="../../common/navbar.jsp" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메시지 발송</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <style>
      .container {
        max-width: 800px;
      }
    </style>
</head>
<body>
<section id="send">
    <h2 class="text-center mb-3">이메일 발송</h2>
    <div class="container m-auto">
        <form action="" method="post">
            <div class="form-floating mb-3">
                <input type="email" id="to" name="to" value="${email.to}" class="form-control" placeholder="이메일">
                <label for="to">이메일</label>
            </div>

            <div class="form-floating mb-3">
                <input type="text" id="subject" name="content" value="${email.subject}" class="form-control" placeholder="이메일 제목">
                <label for="subject">이메일 제목</label>
            </div>

            <div class="form-floating mb-3">
                <input type="text" id="content" name="content" value="${email.content}" class="form-control" placeholder="이메일 내용">
                <label for="content">이메일 내용</label>
            </div>

            <div class="mb-3">
                <button type="submit" class="btn btn-lg btn-dark w-100">발송</button>
            </div>
        </form>
    </div>
</section>

</body>
</html>