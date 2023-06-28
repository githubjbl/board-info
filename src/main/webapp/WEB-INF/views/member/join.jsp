<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<title>회원 가입</title>
<%@ include file="../include/js/header.jsp" %>
<script type="text/javascript">
var isIdChecked = false;  // 아이디 중복 확인 여부를 체크하는 변수
var isNickChecked = false;// 닉네임 중복 확인 여부를 체크하는 변수

$(function() {
    $("#btnIdCheck").click(function() {
      var userid = $("#userid").val();
      if (userid == "") {
        alert("아이디를 입력하세요.");
        $("#userid").focus();
        return;
      }
	  //아이디 정규식
	  var exp = /^[a-z0-9]{4,15}$/;
	  if(!exp.test(userid)){
		  	alert("아이디는 영문소문자, 숫자를 포함해 4~15 사이로 입력하세요.");
		  	$("#userid").focus();
		  	return;
	  	}
      $.ajax({
        url: "${path}/member/check_id.do",
        type: "POST",
        data: {
          userid: userid
        },
        success: function(result) {
          if (result == "duplicate") {
            alert("이미 사용 중인 아이디입니다.");
            $("#userid").val("");
            $("#userid").focus();
            isIdChecked = false;
          } else if (result == "available") {
            alert("사용 가능한 아이디입니다.");
            isIdChecked = true;
            document.form1.userid.readOnly = true;
          }
        },
        error: function() {
          alert("서버와의 통신에 실패했습니다.");
        }
      });
    });
  });

$(function() {
    $("#btnNickCheck").click(function() {
      var nickname = $("#nickname").val();
      if (nickname == "") {
        alert("닉네임을 입력하세요.");
        $("#nickname").focus();
        return;
      }
      $.ajax({
        url: "${path}/member/check_nick.do",
        type: "POST",
        data: {
          nickname: nickname
        },
        success: function(result) {
          if (result == "duplicate") {
            alert("이미 사용 중인 닉네임입니다.");
            $("#nickname").val("");
            $("#nickname").focus();
            isNickChecked = false;
          } else if (result == "available") {
            alert("사용 가능한 닉네임입니다.");
            isNickChecked = true;
            document.form1.nickname.readOnly = true;
          }
        },
        error: function() {
          alert("서버와의 통신에 실패했습니다.");
        }
      });
    });
  });
function login_check() {
    if (window.event.keyCode === 13) {
      $("#btnJoin").click();
    }
  }
function duplication_check() {
    if (window.event.keyCode === 13) {
      $("#btnIdCheck").click();
    }
  }
function duplication_check2() {
    if (window.event.keyCode === 13) {
      $("#btnNickCheck").click();
    }
  }
function check() {
	//이름 체크
	var name = $("#name").val();
	if(name==""){
		alert("이름은 필수 입력입니다.");
		$("#name").focus();
		return;
	}

	//아이디 체크
	var userid = $("#userid").val();
	if(userid==""){
		alert("아이디는 필수 입력입니다.");
		$("#userid").focus();
		return;
	}

	//아이디 정규식
	var exp1 = /^[a-z0-9]{4,15}$/;
	if(!exp1.test(userid)){
		alert("아이디는 영문소문자, 숫자를 포함해 4~15 사이로 입력하세요.");
		$("#userid").focus();
		return;
	}
	//아이디 중복체크
	if (!isIdChecked) {
	    alert("아이디 중복 확인을 해주세요.");
	    $("#userid").focus();
	    return;
	}

	//비밀번호 체크
	var passwd = $("#passwd").val();
	var passwd2 = $("#passwd2").val();
	if(passwd==""){
		alert("비밀번호는 필수 입력입니다.");
		$("#passwd").focus();
		return;
	}
	//비밀번호 정규식
	var exp2 = /^[a-zA-Z0-9]{8,15}$/;
	if(!exp2.test(passwd)){
		alert("비밀번호는 영문 숫자 조합으로 8자 이상 입력하세요.");
		$("#passwd").focus();
		return;
	}
	if(passwd != passwd2){
		alert("비밀번호 불일치");
		$("#passwd2").focus();
		return;
	}
	// 닉네임 중복확인
	if (!isNickChecked) {
	    alert("닉네임 중복 확인을 해주세요.");
	    $("#nickname").focus();
	    return;
	}
	//이름 정규식
	var exp3 = /^[가-힣]+$/;
	if(!exp3.test(name)){
		alert("이름은 한글로 입력하세요.");
		$("#name").focus();
		return;
	}

	//이메일 체크
	var email = $("#email").val();
	if(email==""){
		alert("이메일은 필수 입력입니다.");
		$("#email").focus();
		return;
	}
	//이메일 정규식
	var exp4 = /^[a-z0-9]{2,15}@[a-z0-9]{2,9}\.[a-z]{2,}$/;
	if(!exp4.test(email)){
		alert("이메일 형식이 잘못되었습니다. ex)abc@abc.com");
		$("#email").focus();
		return;
	}
	//핸드폰번호 정규식
	var hp = $("#hp").val();
	var exp5 = /^[\d]{11,12}$/;
	if(!exp5.test(hp)){
		alert("11~12자리를 숫자로 입력해주세요.");
		$("#hp").focus();
		return;
	}

	document.form1.action="${path}/member/member_insert.do";
	document.form1.submit();
	alert("정상적으로 회원가입 되었습니다.")
}

</script>
</head>
<body>
<div class="container">
<div align="center">
<a href="${path}/"><img alt="로고" src="../resources/uploaded_image/boardinfo_logo.png"></a>
</div>
<form name="form1" method="post" enctype="multipart/form-data">
<div class="form-group">
프로필 <input class="form-control" name="profile_img" id="profile" type="file">
</div>
<div class="form-group">
이름 <input class="form-control" placeholder="이름" name="name"
id="name" type="text" onkeyup="login_check()">
</div>
<div class="form-group" >
아이디 <input class="form-control" placeholder="아이디" name="userid"
id="userid" type="text"maxlength='15' onkeyup="duplication_check()">
<div align="right">
<button type="button" class="btn btn-dark button" id="btnIdCheck" >중복확인</button>
</div>
<div class="form-group">
닉네임 <input class="form-control" placeholder="닉네임" name="nickname"
id="nickname" type="text" maxlength="12" onkeyup="duplication_check2()">
<div align="right">
<button type="button" class="btn btn-dark button" id="btnNickCheck" >중복확인</button>
</div>
</div>
</div>
<div class="form-group">
비밀번호 <input class="form-control" placeholder="비밀번호" name="passwd"
id="passwd" type="password" onkeyup="login_check()">
<div class="form-group">
비밀번호 확인 <input class="form-control" placeholder="비밀번호 확인" name="passwd2"
id="passwd2" type="password" >
</div>
</div>
<div class="form-group">
이메일 <input class="form-control" placeholder="이메일" name="email"
id="email" type="text" onkeyup="login_check()">
</div>
<div class="form-group">
휴대폰 <input class="form-control" placeholder="-빼고 입력하세요." name="hp"
id="hp" type="tel" maxlength='12' onkeyup="login_check()">
</div>
<div align="right">
<input type="button" class="btn btn-lg btn-success btn-block"
onclick="check()" value="확인" name="btnJoin" id="btnJoin">
</div>
</form>

</div>

</body>
</html>