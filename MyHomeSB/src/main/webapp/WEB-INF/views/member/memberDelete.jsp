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
	<title>회원탈퇴</title>
</head>
<body>

<div class="container">
	<form class="form-horizontal" method="post" action="/member/memberDelete">
		<div class="form-group">
			<div class="col-sm-2"></div>
			<div class="col-sm-6">
				<h2 align="left">회원탈퇴</h2>
			</div>		
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">아이디</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="userid" name="userid"
					value="${member.userid}" readonly="readonly"
					maxlength="16" placeholder="아이디 입력"/>
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
					value="${member.name}" readonly="readonly"
					maxlength="16" placeholder="이름 입력"/>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-4">
				<button class="btn btn-danger" type="submit" id="submit">회원탈퇴</button>
				<button class="btn btn-info cancel" type="button">취소</button>
			</div>
		</div>		
		<!-- 회원탈퇴 버튼을 눌렀는데 비밀번호가 맞지 않으면 메시지를 보여준다. -->
		<c:if test="${msg == false}">
			<div class="form-group">
				<div class="col-sm-8">
					<h3><span class="label label-danger">회원탈퇴에 실패하였습니다. 비밀번호를 확인하신 후에 다시 시도해주세요.</span></h3>
				</div>
			</div>
		</c:if>		
	</form>
</div>

<script>
$(document).ready(function() {
	//취소 버튼을 눌렀을 경우
	$(".cancel").on("click", function() {
		location.href="/member/login";
	});
	
	//회원탈퇴 버튼을 눌렀을 경우
	$("#submit").on("click", function() {
		if($("#passwd").val() == "") {
			alert("비밀번호를 입력하세요.");
			$("#passwd").focus();
			return false;
		}
		if(confirm("정말 탈퇴하시겠습니까?") == false){
			return false;
		}
	});	
});
</script>
	
</body>
</html>

</layoutTag:layout>