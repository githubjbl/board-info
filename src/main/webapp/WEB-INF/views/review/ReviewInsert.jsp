<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>커뮤니티 - 리뷰작성</title>
<%@ include file="../include/js/header.jsp" %>

  <style>

    @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 100;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.otf) format('opentype');}

    @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 300;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.otf) format('opentype');}

    @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 400;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.otf) format('opentype');}

    @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 500;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.otf) format('opentype');}

    @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 700;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.otf) format('opentype');}

    @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 900;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.otf) format('opentype');}

    * {
      font-family: 'Noto Sans KR', sans-serif;
      font-size: 15px;
    }

    html, body{
      margin: 0 0;
      padding: 0 0;
      min-height: 100%;
    }

    div, input, span{
      box-sizing: border-box;
    }

    #header{
      width: 100%;
      margin: 0 auto;
      position: fixed;
      left: 0;
      top: 0;
      background-color: white;
      z-index: 450;
      border-bottom: 1px solid #D9D9D9;      
    }

    #header-upper-box{
      background-color: #FFC61A;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 77px;
    }
    
    #header-upper-box > div{
	 display: flex;
     justify-content: space-between;
     align-items: center;
     height: 77px;
     flex-basis: 1120px;
     max-width: 1120px;
    }

    #header-left{
      display: flex;
      align-items: center;
    }

    #header-right {
      display: flex;
      justify-content: space-between;
      align-items: center;
      font-size: 15px;
    }

    form[name="gameSearch"] > div:first-of-type{
      background-color: white;
      position: relative;
      width: 320px;
      height: 34px;
      padding: 2px 10px;
      border: 2px black solid;
      border-radius: 20px;
    }

    form[name="gameSearch"] img{
      width: 20px;
      position: absolute;
      top: 5px;
      right: 12px;
      margin: 0;
      -webkit-user-drag: none;
    }

    #header-right input:first-of-type{
      width: 270px;
      height: 25px;
      padding-left: 20px;
      border: none;
      font-size: 16px;
      background-color: rgba(255, 255, 255, 0.5);
    }

    .sign{
      text-decoration: none;
      font-size: 15px;
      font-weight: bold;
      color: black;
    }

    #signIn{
      margin: 0 30px;
    }

    .nav{
      margin: 0 auto;
      max-width: 1120px;
      display: flex;
    }

    .menu {
      display: flex;
      justify-content: space-between;
      align-items: center;
      height: 45px;
      list-style: none;
      padding: 0;
      margin: 0;
    }

    .menu li {
      display: inline-block;
      flex: 0 0 25%;
      max-width: 25%;
      height: 100%;
      line-height: 45px;
    }

    .toMenu{
      display: flex;
      align-items: center;
      font-size: 16px;
      font-weight: bold;
      text-decoration: none;
      color: black;
      margin-right: 20px;
    }

    .toMenu > img{
      margin-left: -4px;
      -webkit-user-drag: none;
    }

    #contents{
      display: flex;
      flex-direction: column;
      margin: auto;
      max-width: 1120px;
      min-height: 100%;
      padding: 129px 0 0 0;
      font-size: 16px;
    }

    #contentsHeader{
      margin: 0;
      padding-top: 32px;
      padding-bottom: 5px;
      display: flex;
      flex-direction: column;
      justify-content: center;
    }

    #contentsHeader h2{
      font-size: 1.9em;
      margin-top: 0;
      margin-bottom: 5px;
    }

    #contentsLocation{
      margin-bottom: 30px;
    }

    #contentsMain{
      border-top: 2px solid black;
      margin-bottom: 80px;
      flex-grow: 1;
      min-height: 420px;
    }

    #postUpper{
      display: flex;
    }

    #postUpper > div:first-of-type{
      padding: 30px 0;
    }

    #tmpDiv, #map{
      width: 400px;
      height: 280px;
      border: 1px solid black;
      text-align: center;
      line-height: 280px;
    }

    #map{
      overflow: hidden;
      display: none;
    }

    #postUpper > div:nth-of-type(2){
      padding: 30px 0 30px 0;
      flex-grow: 1;
      display: flex;
      justify-content: space-between;
      flex-direction: column;
    }

    .labelAndItem{
      display: flex;
      flex-direction: row;
    }

    .labelAndItem > span:first-of-type{
      width: 90px;
      text-align: right;
      margin-right: 25px;
    }

    .labelAndItem input{
      padding-left: 8px;
    }

    .flex{
      flex-grow: 1;
    }

    #locationSearchBtn{
      cursor: pointer;
      width: 65px;
      margin-left: 5px;
    }

    .labelAndItem input[type="date"]{
      width: 190px;
    }

    .labelAndItem input[type="number"]{
      width:100px;
      margin-right: 5px;
    }


    input[name="question"]{
      width: 100%;
    }

    #hiddenQuestion{
      display: flex;
      flex-direction: column;
      visibility: hidden;
    }

    #postMain{
      padding: 20px 0;
      border-top: 2px dashed #D9D9D9;
      display: flex;
      flex-direction: column;
    }

    #postMain > div:last-of-type{
      text-align: center;
    }

    #description{
      padding: 20px;
      height: 300px;
      resize: none;
    }

    #postMain ul{
      list-style-position: inside;
      margin: 0;
      padding: 20px 10px 30px 10px;
    }

    button[id*="btn-"]{
      cursor: pointer;
      width: 82px;
      height: 34px;
      font-size: 16px;
      font-weight: bold;
      border-radius: 0;
    }

    #btn-attachGame{
      margin-bottom: 10px;
      background-color: #1432B1;
      border: 0;
      color: white;
    }

    #btn-submit{
      background-color: #F9841A;
      margin-right: 10px;
      color: white;
      border: 0;
    }

    #btn-reset{
      border: 1px solid black;
      background-color: white;
    }


    footer{
      font-size: 15px;
      color: #DFDFDF;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      height: 190px;
      background-color: #3D3D43;
      bottom: 0;
      clear: both;
    }
    
    
    footer > div{
      width: 100%;
      max-width: 1120px;
    }
  </style>

  <script type="text/javascript">
  function btnSaveClick() {
  alert("asdsadasd"); // 테스트
  document.reviewInsertSave.submit();
  }
  </script>

</head>

<body>
<div id="header">

  <div id="header-upper-box">
  <div>
    <div id="header-left">
      <a href="#" title="보드인포"><img src="${path}/images/boardinfo_logo.png" width="170px"></a>
    </div>
    <div id="header-right">
      <form name="gameSearch" id="gameSearch" method="get">
        <div>
          <input type="text" name="gameKeyword" placeholder="보드게임 찾기">
          <img src="${path}/images/search.png">
        </div>
      </form>
      <a href="#" title="로그인" class="sign" id="signIn">로그인</a>
      <a href="#" title="회원가입" class="sign" id="signUp">회원가입</a>
    </div>
  </div>
  </div>
  
  <div class="nav">
    <ul class="menu">
      <li><a href="#" class="toMenu" title="게임정보">게임정보<img src="${path}/images/dropdown.png" width="34px"></a></li>
      <li><a href="#" class="toMenu" title="커뮤니티">커뮤니티<img src="${path}/images/dropdown.png" width="34px"></a></li>
      <li><a href="#" class="toMenu" title="오프모임">오프모임<img src="${path}/images/dropdown.png" width="34px"></a></li>
      <li><a href="#" class="toMenu" title="중고장터">중고장터<img src="${path}/images/dropdown.png" width="34px"></a></li>
    </ul>
  </div>
</div>

<div id="contents">
  <div id="contentsHeader">
    <h2>리뷰 작성</h2>
  </div>
  <div id="contentsLocation">
    홈 &gt 커뮤니티 &gt 리뷰 작성
  </div>

  <div id="contentsMain">

    <form name="reviewInsertSave" method="get" action="${path}/review/reviewinsertsave.do">

      <p>카테고리 : <input type="text" name="category"></p>
      <p>제목 : <input type="text" name="title"></p>
      <p>임시입력_gnum, 게임ID : <input type="text" name="gnum"></p>
      <p>임시입력_gatheringId, 모임ID : <input type="text" name="gatheringId"></p>
      <p>리뷰점수 : <input type="text" name="reviewScore"></p>
      <p>난이도 : <input type="text" name="gameScore"></p>
      <p>임시입력_ID : <input type="text" name="createUser"></p>
      <p>리뷰작성 : <input type="text" name="reviewDetail"></p>

      <button type="button" id="btnsave" onclick="btnSaveClick()">값 보내기</button>

    </form>

  <%--    <form name="reviewlist" method="post" action="${path}/review/reviewlist.do">
      <table style="table-layout:fixed;">
        <tr><!-- 첫번째 줄 시작 -->
          <th style="width: 200px;">카테고리</th>
          <th style="width: 200px;">&#x1f495</th> &lt;%&ndash;하트&ndash;%&gt;
          <th style="width: 200px;">제목</th>
          <th style="width: 200px;">닉네임</th>
          <th style="width: 200px;">등록일자</th>
          <th style="width: 200px;">조회수</th>
          <th style="width: 200px;">댓글</th>
          <th style="width: 200px;">게임</th>
        </tr>
        <script>console.log(<c:out value="${list}"></c:out>) </script>
        <c:forEach items="${list}" var="vo">
          <tr>
            <td style="width: 200px; text-align: center;">${vo.category}</td>
            <td style="width: 200px; text-align: center;">${vo.good}</td>
            <td style="width: 200px; text-align: center;">${vo.title}</td>
            <td style="width: 200px; text-align: center;">${vo.nickName}</td>
            <td style="width: 200px; text-align: center;">${vo.createDate}</td>
            <td style="width: 200px; text-align: center;">${vo.views}</td>
            <td style="width: 200px; text-align: center;">/댓글 연결 예정/</td>
            <td style="width: 200px; text-align: center;">-게임 연결 예정-</td>
          </tr>
        </c:forEach>
      </table>
    </form>--%>



  </div>
</div>

<footer>
  <div>
    서울특별시 강남구 테헤란로14길 6 남도빌딩 2,3F<br>
    KH정보교육원 TEAM BOARDINFO
  </div>
</footer>

</body>
</html>