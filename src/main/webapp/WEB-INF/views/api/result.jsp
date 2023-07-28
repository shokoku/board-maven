<jsp:include page="../common/navbar.jsp" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메시지 발송 내역</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <style>
      .container {
        max-width: 800px;
      }
    </style>
</head>
<body>
<section id="result">
    <h2 class="text-center mb-3">SMS 발송 내역</h2>
    <div class="container m-auto">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>requestId</th>
                <th>요청 시간</th>
                <th>Status Code</th>
                <th>Status Name</th>
            </tr>
            </thead>
            <tbody>
            <tr >
                <td>${response.requestId}</td>
                <td>${response.requestTime}</td>
                <td>${response.statusCode}</td>
                <td>${response.statusName}</td>
            </tr>
            </tbody>
        </table>
    </div>
</section>
</body>
</html>