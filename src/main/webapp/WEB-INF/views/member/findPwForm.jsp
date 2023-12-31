<jsp:include page="../common/navbar.jsp" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <style>
      .container {
        max-width: 580px;
      }
    </style>
</head>
<body>
<section id="info">
    <h2 class="text-center m-3">비밀번호 찾기</h2>
    <div class="container m-auto">
        <form action="" method="post">
            <div class="form-floating mb-3">
                <input type="tel" id="id" name="id" value="${member.id}" class="form-control" placeholder="아이디">
                <label for="id">아이디</label>
                <c:if test="${bindingResult.hasFieldErrors('id')}">
                    <span class="text-danger">${bindingResult.getFieldError('id').defaultMessage}</span><br>
                </c:if>
            </div>

            <div class="form-floating mb-3">
                <input type="text" id="name" name="name" value="${member.name}" class="form-control" placeholder="이름">
                <label for="name">이름</label>
                <c:if test="${bindingResult.hasFieldErrors('name')}">
                    <span class="text-danger">${bindingResult.getFieldError('name').defaultMessage}</span><br>
                </c:if>
            </div>

            <div class="row">
                <div class="col-9">
                    <div class="form-floating mb-3">
                        <input type="text" id="email" name="email" value="${member.email}" class="form-control" placeholder="이메일">
                        <label for="email">이메일</label>
                        <c:if test="${bindingResult.hasFieldErrors('email')}">
                            <span class="text-danger">${bindingResult.getFieldError('email').defaultMessage}</span><br>
                        </c:if>
                        <div id="errorContainer"></div>
                        <div id="timerContainer"></div>
                    </div>
                </div>
                <div class="col-3 mb-3">
                    <div class="d-flex h-100 flex-column justify-content-center align-items-end">
                        <button class="btn btn-outline-dark w-50" type="button" id="sendEmail">발송</button>
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-9">
                    <div class="form-floating mb-3">
                        <input type="text" id="certification" name="certification" class="form-control" placeholder="인증번호" disabled>
                        <label for="certification">인증번호</label>
                        <c:if test="${bindingResult.hasFieldErrors('certification')}">
                            <span class="text-danger">${bindingResult.getFieldError('certification').defaultMessage}</span><br>
                        </c:if>
                    </div>
                </div>

                <div class="col-3 mb-3">
                    <div class="d-flex h-100 flex-column justify-content-center align-items-end">
                        <button class="btn btn-outline-dark w-50" type="button" id="certificationButton" disabled>확인</button>
                    </div>
                </div>
                <div id="certificationResult"></div>
            </div>

            <div class="form-floating mb-3">
                <input type="password" id="pw" name="pw" class="form-control" placeholder="변경 비밀번호" disabled>
                <label for="pw">변경 비밀번호</label>
            </div>

            <div class="mb-3 row">
                <span class="col"><button id="changeButton" type="button" class="btn btn-lg btn-dark w-100">비밀번호 변경</button></span>
            </div>
        </form>
</div>
</section>

<script defer>
  const sendEmailButton = document.getElementById('sendEmail');
  const idInput = document.getElementById('id');
  const nameInput = document.getElementById('name');
  const emailInput = document.getElementById('email');
  const errorContainer = document.getElementById('errorContainer');
  const certificationInput = document.getElementById('certification');
  const certificationButton = document.getElementById('certificationButton');
  const certificationResult = document.getElementById('certificationResult');
  const pwInput = document.getElementById('pw');
  const changeButton = document.getElementById('changeButton');

  sendEmailButton.addEventListener('click', () => {
    const name = nameInput.value;
    const email = emailInput.value;
    const id = idInput.value;

    fetch("/member/sendEmail", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({"id":id, "name": name, "email": email }),
    })
    .then(response => response.json())
    .then(data => {
      if (data === true) {
        errorContainer.textContent = "인증번호를 발송하였습니다.";
        certificationInput.removeAttribute('disabled');
        certificationButton.removeAttribute('disabled');

      } else {
        errorContainer.textContent = "일치하는 회원정보를 찾을수 없습니다.";
      }
    })
    .catch(error => {
      errorContainer.textContent = "관리자에게 문의해주세요.";
    });
  });

  certificationButton.addEventListener('click', () => {
    const certification = certificationInput.value;
    const email = emailInput.value;
    console.log(certification);

    fetch("/member/checkNumber", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ "email": email, "certification": certification }),
    })
    .then(response => response.text())
    .then(data => {
      if (data) {
        certificationResult.textContent = "인증이 완료되었습니다.";
        changeButton.type = "submit";
        changeButton.action = "/member/findPw";
        changeButton.method = "post";
        changeButton.removeAttribute('disabled');
        pwInput.removeAttribute('disabled');

      } else {
        certificationResult.textContent = "인증번호가 일치하지 않습니다..";
      }
    })
    .catch(error => {
      certificationResult.textContent = "관리자에게 문의해주세요.";
    });
  });

</script>
</body>
</html>
