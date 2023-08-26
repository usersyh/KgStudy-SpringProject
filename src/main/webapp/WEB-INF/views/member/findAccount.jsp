<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정정보 찾기</title>

<!-- css 파일 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/findAccount.css?after">

</head>
<body>

	<%@include file="../include/header.jsp"%>

	<section class="modify" id="modify">

		<div class="modify-mg">

			<ul class="modifyList">
				<li class="modify_name">
					<h3>계정정보 찾기</h3>
				</li>
			</ul>


			<nav class="find-account-tab">
				<ul class="find-account-list">
					<li class="find-account-id">
						<a class="fa-id" href='findAccountPageView.do'>아이디 찾기</a>
					</li>
				</ul>
				<ul class="find-account-list">
					<li class="find-account-pw">
						<a class="fa-pw" href='findAccountPwPageView.do'>비밀번호 찾기</a>
					</li>
				</ul>
			</nav>

			<ul class="modifyList">

				<li class="modifyView">

					<div class="modify-form">
						<form id="f1" action="findId.do" method="post">

							<p class="modify-msg">회원님의 이름과 전화번호로 본인확인을 진행합니다.</p>

							<table class="modify-table">

								<tr>
									<th>이름</th>
									<td><input type="text" name="user_name" id="user_name" required></td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td><input type="text" name="user_tel" id="user_tel" required></td>
								</tr>

							</table>

							<div class="modify-button">
								<button type="submit" class="btn_design">아이디찾기</button>
								<button type="button" class="btn_design" id="go-back">취소</button>
							</div>

						</form>
					</div>

				</li>

			</ul>

		</div>

	</section>

	<%@include file="../include/footer.jsp"%>

	<script>
		document.getElementById('go-back').addEventListener('click', () => {
			window.history.back();
		});
	</script>
	<script>
		let findIdMsg = "${findIdMsg}";
		
		if (findIdMsg) {
			alert(findIdMsg);
		}
	</script>
	
</body>
</html>