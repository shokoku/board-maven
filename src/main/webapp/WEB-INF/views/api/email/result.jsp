<jsp:include page="../../common/navbar.jsp" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이메일 발송 내역</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <style>
      .container {
        max-width: 800px;
      }
    </style>
</head>
<body>
<section id="result">
    <h2 class="text-center mb-3">이메일 발송 내역</h2>
    <div class="container m-auto">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>발송</th>
            </tr>
            </thead>
            <tbody>
            <tr >
                <td>${status}</td>
            </tr>
            </tbody>
        </table>
    </div>
</section>
</body>
</html>