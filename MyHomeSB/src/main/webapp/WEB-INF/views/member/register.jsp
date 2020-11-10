<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="layoutTag" 	tagdir="/WEB-INF/tags" %>

<layoutTag:layout>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
</head>
<body>

<div class="container">
	<form class="form-horizontal" method="post" action="/member/register">
		<div class="form-group">
			<div class="col-sm-2"></div>
			<div class="col-sm-6">
				<h2 align="left">회원가입</h2>
			</div>		
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">아이디</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="userid" name="userid"
					maxlength="16" placeholder="아이디 입력"/>
			</div>
			<div class="col-sm-2">
				<button class="btn btn-warning idCheck" type="button" id="idCheck" 
					onclick="dupCheck();" value="N">중복검사</button>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">비밀번호</label>
			<div class="col-sm-3">
				<input type="password" class="form-control" id="passwd" name="passwd" 
					maxlength="16" placeholder="비밀번호 입력"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">이름</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="name" name="name" 
					maxlength="16" placeholder="이름 입력"/>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-4">
				<button class="btn btn-success" type="submit" id="submit">회원가입</button>
				<button class="btn btn-danger cancel" type="button">취소</button>
			</div>
		</div>
	</form>
</div>

<script>
$(document).ready(function() {
	//취소 버튼이 눌렸을 경우
	$(".cancel").on("click", function() {
		location.href="/member/login";
	});

	//회원가입 버튼이 눌렸을 경우 => 입력 필드
	$("#submit").on("click", function() {
		if($("#userid").val() == "") {
			alert("아이디를 입력하세요.");
			$("#userid").focus();
			return false;
		}
		if($("#passwd").val() == "") {
			alert("비밀번호를 입력하세요.");
			$("#passwd").focus();
			return false;
		}
		if($("#name").val() == "") {
			alert("이름을 입력하세요.");
			$("#name").focus();
			return false;
		}
	});
});
//아이디 중복 검사
//입력한 아이디에 해당하는 정보가 있는지 검사하고, 결과값(정수)을 리턴 받는다.
function dupCheck() {
	if($("#userid").val() == "") {
		alert("아이디를 입력하세요.");
		$("#userid").focus();
		return false;
	}
	//alert("중복검사.....");
	$.ajax({
		url: 		"/member/idCheck",
		type: 		"post",
		dataType: 	"json",
		data: 		{"userid" : $("#userid").val()},
		success: 	
			function(data) {
				if(data == 1) {
					alert("이미 사용중인 아이디입니다.\n다른 아이디를 입력하세요.");
				} else if(data == 0) {
					$("#idCheck").attr("value", "Y");
					alert("사용가능한 아이디입니다.");
				}
			}
	});
}
</script>

</body>
</html>

</layoutTag:layout>