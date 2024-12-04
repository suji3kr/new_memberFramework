<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>

	<title>index</title>
	
<script
  src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous"></script>
<style>
@font-face {
    font-family: 'establishRetrosansOTF';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2112@1.0/establishRetrosansOTF.woff') format('woff');
    font-weight: normal;
    font-style: normal;}
</style>
</head>
<body>
	<form action="/member/save" method="post">
		
		<p>이 메 일  : <input type="text" name="memberEmail" placeholder="이메일"  id="memberEmail" onblur="emailCheck()"></p>
		<p id="check-result"></p>   <!-- checkresult 내용을 넣을 자리 -->
		<p>비밀번호 : <input type="text" name="memberPassword" placeholder="비밀번호"></p>
		<p>이   름 : <input type="text" name="memberName" placeholder="이름"></p>
		<p>나   이 : <input type="text" name="memberAge" placeholder="나이"></p>
		<p>전화번호 : <input type="text" name="memberMobile" placeholder="전화번호"></p>
		<input type="submit" value="🌼 회원가입 🌼">
	</form>
</body>
<script>
// 이메일 입력값을 가져오고,
// 입력값을 서버로 전송하고 똑같은 이메일이 있는지 체크한 후
// 사용 가능 여부를 이메일 입력창 아래에 표시
    const emailCheck = () => {
        const email = document.getElementById("memberEmail").value;
        const checkResult = document.getElementById("check-result");
        console.log("입력한 이메일", email);
        $.ajax({
            // 요청방식: post, url: "email-check", 데이터: 이메일
            type: "post",
            url: "/member/email-check",
            data: {
                "memberEmail": email
            },
            success: function(res) {
                console.log("요청성공", res);
                if (res == "ok") {
                	console.log("사용가능한 이메일");
                	checkResult.style.color = "green"; // 텍스트 색을 초록색으로 설정
                	checkResult.style.fontFamily = "establishRetrosansOTF"; // 폰트 패밀리를 설정
                	checkResult.innerHTML = "사용가능한 이메일 🌼"; // 텍스트를 업데이트

                } else {
                    console.log("이미 사용중인 이메일");
                    checkResult.style.color = "red";
                    checkResult.style.fontFamily = "establishRetrosansOTF"; // 폰트 패밀리를 설정
                    checkResult.innerHTML = "이미 사용중인 이메일 🥀";
                }
            },
            error: function(err) {
                console.log("에러발생", err);
            }
        });
    }
</script>

</html>