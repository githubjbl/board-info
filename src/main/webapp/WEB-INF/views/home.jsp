<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %> <!-- 세션사용여부 -->

<!doctype html>
<html>

<head>
    <meta charset="utf-8">

    <title>보드인포</title>

    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
            charset="utf-8"></script>
    <%@ include file="include/js/header.jsp" %>


    <style>

        #main_lower{
            display: flex;
            flex-direction: column;
        }

        #main_lower > div{
            display: flex;
            flex-direction: row;
        }

        .boxForList{
            min-width: 50%;
            max-width: 50%;
            display: flex;
            flex-direction: column;
        }

        div[class='boxForList']:first-of-type{
            padding-right: 35px;
        }

        div[class='boxForList']:nth-of-type(2){
            padding-left: 35px;
        }

        .more{
            padding: 5px 0 5px 10px;
            text-decoration: none;
            color: black;
        }


        #main_lower > div:first-of-type > .boxForList{
            margin-bottom: 50px;

        }

        .boxForList > div:first-of-type{
            height: 40px;
            border-bottom: 1px solid #d9d9d9;
            display: flex;
            justify-content: space-between;
        }

        .boxForList > div:first-of-type > span:first-of-type{
            font-size: 19px;
            font-weight: bold;
        }

        .boxForList > div:first-of-type > span:nth-of-type(2){
            display: flex;
            flex-direction: row;
            align-items: flex-start;
        }

        .boxForList > div:first-of-type > span:nth-of-type(2) > a{
            padding: 0;
            margin: 0;
        }

        .list{
            padding: 8px 0;
            display: flex;
            flex-direction: column;
            border-bottom: 2px solid #d9d9d9;
            min-height: 238px;
        }

        .list > div{
            padding: 3px 0;
            display: flex;
            align-items: center;
        }

        .list > div > div{
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }


        .list a{
            text-decoration: none;
            color: black;
        }

        .list a:hover{
            text-decoration: underline;
        }

        .cbadge{
            border-radius: 5px;
            padding: 0 15px;
            margin-right: 10px;
            background-color: #d9d9d9;
            display: inline-block;
            text-align: center;
        }

        .reply{
            min-width: 10px;

            margin-left: 10px;
            color: #C53A32;
            font-size: 0.8em;
        }

        #carouselDiv {
            margin-top: 24px;
            height: 561px;
            margin-bottom: 50px;
        }


    </style>


    <script>

        $(function() {

            $.ajax({
                type: "POST",
                url: "${path}/game/gameListMain.do/",
                success:function(result){
                    $("#carouselDiv").html(result);
                }
            });

            /*현재 편의상 조회수 2개이상, 댓글 1개이상, 좋아요 1개이상으로 구성*/
            $.ajax({
                type: "get",
                url : "${path}/review/hotList.do",
                data : {
                    "size" : 8
                },
                success: function(result){
                    if(result){
                        let list = result.list;
                        let hotList = $("#hotList");
                        let str = "";
                        for(var i=0; i<list.length; i++){
                            let category = list[i].category;
                            if(category == '자유게시판') category = '자유';
                            else if(category == '게임후기') category = '후기';

                            let reply = list[i].recnt == 0 ? "" : list[i].recnt;
                            str += "<div><div><span class='cbadge'>"+category+"</span>" +
                                "<a href='${path}/review/reviewdetail.do?reviewDetailKey=" + list[i].regNum + "'>"
                                +list[i].title +"</a></div><span class='reply'>"+reply+"</span></div>";
                        }
                        hotList.append(str);
                    }
                    else console.log("에러가 발생했습니다.");
                },
                error: function(){
                    console.log("에러가 발생했습니다.");
                }

            });

            $.ajax({
                type: "get",
                url : "${path}/review/homeList.do",
                data : {
                    "size" : 8
                },
                success: function(result){
                    if(result){
                        let list = result.list;
                        let communityList = $("#communityList");
                        let str = "";

                        for(var i=0; i<list.length; i++){
                            let reply = list[i].recnt == 0 ? "" : list[i].recnt;
                            let category = list[i].category;
                            if(category == '자유게시판') category = '자유';
                            else if(category == '게임후기') category = '후기';
                            str += "<div><div><span class='cbadge'>"+category+"</span>" +
                                "<a href='${path}/review/reviewdetail.do?reviewDetailKey=" + list[i].regNum + "'>"+list[i].title
                                +"</a></div><span class='reply'>"+reply+"</span></div>";
                        }
                        communityList.append(str);

                    }
                    else console.log("에러가 발생했습니다.");
                },
                error: function(){
                    console.log("에러가 발생했습니다.");
                }

            });

            $.ajax({
                type: "get",
                url : "${path}/gathering/homeList.do",
                data : {
                    "size" : 8
                },
                success: function(result){
                    if(result){
                        let list = result.list;
                        let gatheringList = $("#gatheringList");
                        let str = "";

                        for(var i=0; i<list.length; i++){
                            let reply = list[i].reply_count == 0 ? "" : list[i].reply_count;
                            str += "<div><div><span class='cbadge'>"+list[i].address1+"</span>" +
                                "<a href='${path}/gathering/view/" + list[i].gathering_id + "'>"+list[i].title
                                +"</a></div><span class='reply'>"+reply+"</span></div>";
                        }

                        gatheringList.append(str);

                    }
                    else console.log("에러가 발생했습니다.");
                },
                error: function(){
                    console.log("에러가 발생했습니다.");
                }

            });


            $.ajax({
                type: "get",
                url : "${path}/tboard/homeList.do",
                data : {
                    "size" : 8
                },
                success: function(result){
                    if(result){
                        let list = result.list;
                        let tboardList = $("#tboardList");
                        let str = "";

                        for(var i=0; i<list.length; i++){
                            let reply = list[i].re_count == 0 ? "" : list[i].re_count;
                            str += "<div><div><span class='cbadge'>"+list[i].category+"</span>" +
                                "<a href='${path}/tboard/view/" + list[i].tb_num + "'>"+list[i].title
                                +"</a></div><span class='reply'>"+reply+"</span></div>";
                        }


                        tboardList.append(str);

                    }
                    else console.log("에러가 발생했습니다.");
                },
                error: function(){
                    console.log("에러가 발생했습니다.");
                }

            });

        });


    </script>


</head>

<body>

<%@include file="include/top.jsp" %>

<div id="contents">
    <div id="contentsMain">

        <div id="carouselDiv"></div>

        <div id="main_lower">

            <div>
                <div class="boxForList">
                    <div><span>HOT! 보드인이 주목중인 게시글</span>
                        <span><a class="more" href="${path}/review/reviewlist.do?freeFlag=H">&gt</a></span></div>

                    <div class="list" id="hotList">
                    </div>
                </div>

                <div class="boxForList">
                    <div><span>커뮤니티</span>
                        <span><a class="more" href="${path}/review/reviewlist.do?freeFlag=A">&gt</a></span></div>
                    <div class="list" id="communityList">
                    </div>
                </div>

            </div>

            <div>
                <div class="boxForList">
                    <div><span>오프모임</span>
                        <span><a class="more" href="${path}/gathering/list.do">&gt</a></span></div>
                    <div class="list" id="gatheringList">
                    </div>
                </div>
                <div class="boxForList">
                    <div><span>중고장터</span>
                        <span><a class="more" href="${path}/tboard/list.do">&gt</a></span></div>
                    <div class="list" id="tboardList">
                    </div>
                </div>

            </div>


        </div>

    </div>
</div>
<%@include file="include/footer.jsp" %>
</body>

</html>