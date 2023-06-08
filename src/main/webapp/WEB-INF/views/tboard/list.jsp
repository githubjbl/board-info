<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <%@ include file="../include/js/header.jsp" %>
    <script src="${path}/include/js/jquery-3.6.3.min.js"></script>
    <link rel="stylesheet" href="${path}/include/css/trade/list.css">
    <script type="text/javascript">
        $(function () {
            $("#btnWrite").on("click", function () {
                location.href = "${path}/tboard/write.do";
            });

            function list(page) {
                location.href = "${path}/tboard/list.do?curPage=" + page;
            }
        });

        function view(tb_num) {
            location.href = "${path}/tboard/view/" + tb_num;
        }
    </script>
</head>
<body>
<header>
    <%@include file="../include/top.jsp" %>
</header>
<div id="contents">
    <div id="contentsHeader">
        <div id="searchFormSection">
            <span class="h2">
                중고거래 게시판
            </span>
            <div class="searchFormMain">
                <form id="searchForm" name="searchForm" method="post"
                      action="${path}/tboard/list.do">
                    <div class="search">
                        <select name="select_category">
                            <option value="all" selected="selected">전체</option>
                            <option value="s">판매중</option>
                            <option value="b">구매</option>
                            <option value="n">나눔</option>
                            <option value="f">완료</option>
                        </select>
                        <select name="search_option" id="searchType">
                            <option value="all" selected="selected">제목+내용+작성자</option>
                            <option value="title">제목</option>
                            <option value="description">내용</option>
                            <option value="writer">작성자</option>
                        </select>
                        <input name="keyword" id="keyword" value="${map.keyword}" maxlength="70">
                        <div class="button">
                            <button>검색</button>
                        </div>
                        <div class="dot"></div>
                        <div class="class">
                            <button type="button" id="btnWrite">글쓰기</button>
                        </div>
                    </div>
                </form>
            </div>

        </div>

        <div>총 게시물 수 : ${map.count}</div>

        <div class="categories">
            <div class="category" title="전체">
                <a href="${path}/tboard/list.do">전체</a>
            </div>
            <div class="category" title="판매">
                <a href="${path}/tboard/list.do?select_category=s">판매</a>
            </div>
            <div class="category" title="구매">
                <a href="${path}/tboard/list.do?select_category=b">구매</a>
            </div>
            <div class="category" title="나눔">
                <a href="${path}/tboard/list.do?select_category=n">나눔</a>
            </div>
            <div class="category" title="완료">
                <a href="${path}/tboard/list.do?select_category=f">완료</a>
            </div>
        </div>
    </div>
    <section id="contentsMain">
        <article class="itemList">
            <c:forEach var="row" items="${map.list}">
                <c:choose>
                    <c:when test="${row.del == 'N'}">
                        <div class="itemCard">
                            <a href="#" target="_blank">
                                <div class="imgCard-thumbnail">
                                    <img src="" alt="이미지 자리">
                                </div>
                            </a>
                            <div class="info">
                                <div class="title">
                                    <span class="text">
                                        <a href="#" onclick="view(${row.tb_num})">${row.title}</a>
                                    </span>
                                    <span class="category">
                                        <c:choose>
                                            <c:when test="${row.category == 's'}">
                                                <div class="category" title="판매">
                <a href="${path}/tboard/list.do?select_category=s">판매</a>
            </div>
                                            </c:when>
                                            <c:when test="${row.category == 'b'}">
                                                <div class="category" title="구매">
                <a href="${path}/tboard/list.do?select_category=b">구매</a>
            </div>
                                            </c:when>
                                            <c:when test="${row.category == 'n'}">
                                                <div class="category" title="나눔">
                <a href="${path}/tboard/list.do?select_category=n">나눔</a>
            </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="category" title="완료">
                <a href="${path}/tboard/list.do?select_category=f">완료</a>
            </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                    <div class="place">
                                        직거래 장소, 없으면 택배거래 라고 표시하고
                                    </div>
                                    <div class="price">
                                        ${row.price}
                                    </div>
                                    <div class="subInfo">
                                        <div class="viewCount">
                                            <%--조회수 눈알모양, 사이즈 조절은 css로 함--%>
                                            <svg aria-hidden="true" focusable="false" data-prefix="far" data-icon="eye"
                                                 class="svg-inline--fa fa-eye fa-w-18" role="img" xmlns="http://www.w3.org/2000/svg"
                                                 viewBox="0 0 576 512">
                                                <path fill="currentColor"
                                                      d="M288 144a110.94 110.94 0 0 0-31.24 5 55.4 55.4 0 0 1 7.24 27 56 56 0 0 1-56 56 55.4 55.4 0 0 1-27-7.24A111.71 111.71 0 1 0 288 144zm284.52 97.4C518.29 135.59 410.93 64 288 64S57.68 135.64 3.48 241.41a32.35 32.35 0 0 0 0 29.19C57.71 376.41 165.07 448 288 448s230.32-71.64 284.52-177.41a32.35 32.35 0 0 0 0-29.19zM288 400c-98.65 0-189.09-55-237.93-144C98.91 167 189.34 112 288 112s189.09 55 237.93 144C477.1 345 386.66 400 288 400z"></path>
                                            </svg>
                                                ${row.view_count}
                                        </div>
                                        <div class="dot"></div>
                                        <div class="interestCount">
                                        </div>
                                        <div class="reCount">${row.re_count}</div>
                                        <div class="dot"></div>
                                        <div class="createDate">
                                            <fmt:formatDate value="${row.create_date}"
                                                            pattern="yyyy-MM-dd HH:mm:ss"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <a href="#" onclick="view(${row.tb_num})">삭제된 게시물입니다.</a>
                        <div class="delInfo">
                            ${row.update_user} <br>
                            <fmt:formatDate value="${row.update_date}"
                                        pattern="yyyy-MM-dd HH:mm:ss"/>
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </article>
    </section>
    <%--페이지네이션--%>
    <section class="pagenation">
        <c:if test="${map.pager.curBlock > 1}">
            <a href="#" onclick="list('1')">[처음]</a>
        </c:if>
        <c:if test="${map.pager.curBlock > 1}">
            <a href="#" onclick="list('${map.pager.prevPage}')">
                [이전]</a>
        </c:if>
        <c:forEach var="num"
                   begin="${map.start}"
                   end="${map.end}">
            <c:choose>
                <c:when test="${num == map.pager.curPage}">
                    <!-- 현재 페이지인 경우 하이퍼링크 제거 -->
                    <span style="color:red;">${num}</span>
                </c:when>
                <c:otherwise>
                    <a href="#" onclick="list('${num}')">${num}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:if test="${map.pager.curBlock < map.pager.totBlock}">
            <a href="#"
               onclick="list('${map.pager.nextPage}')">[다음]</a>
        </c:if>
        <c:if test="${map.pager.curPage < map.pager.totPage}">
            <a href="#"
               onclick="list('${map.pager.totPage}')">[끝]</a>
        </c:if>
    </section>



<%--        <table>--%>
<%--            <c:forEach var="row" items="${map.list}">--%>
<%--                <c:choose>--%>
<%--                    <c:when test="${row.del == 'N'}">--%>
<%--                        <tr>--%>
<%--                            <td>--%>
<%--                                <span>--%>
<%--                                    <c:choose>--%>
<%--                                        <c:when test="${row.category == 's'}">--%>
<%--                                            <img src="${path}/images/trade/sell.png" alt="판매">--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${row.category == 'b'}">--%>
<%--                                        <img src="${path}/images/trade/buy.png" alt="구매">--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${row.category == 'n'}">--%>
<%--                                            <img src="${path}/images/trade/nanum.png" alt="나눔">--%>
<%--                                        </c:when>--%>
<%--                                        <c:otherwise>--%>
<%--                                            <img src="${path}/images/trade/trade_fin.png" alt="거래완료">--%>
<%--                                        </c:otherwise>--%>
<%--                                    </c:choose>--%>
<%--                                </span>--%>
<%--                                <a href="#" onclick="view(${row.tb_num})">${row.title}</a>--%>
<%--                            </td>--%>
<%--                            <td>${row.price}</td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td>--%>
<%--                                <table border="1">--%>
<%--                                    <tr>--%>
<%--                                        <td>${row.create_user}</td>--%>
<%--                                        <td><fmt:formatDate value="${row.create_date}"--%>
<%--                                                            pattern="yyyy-MM-dd HH:mm:ss"/></td>--%>
<%--                                        <td>${row.view_count}</td>--%>
<%--                                        <td>${row.re_count}</td>--%>
<%--                                    </tr>--%>
<%--                                </table>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
<%--                    </c:when>--%>
<%--                    <c:otherwise>--%>
<%--                        <tr>--%>
<%--                            <td>--%>
<%--                                <a href="#" onclick="view(${row.tb_num})">삭제된 게시물입니다.</a>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td>--%>
<%--                                <table border="1">--%>
<%--                                    <tr>--%>
<%--                                        <td>${row.update_user}</td>--%>
<%--                                        <td><fmt:formatDate value="${row.update_date}"--%>
<%--                                                            pattern="yyyy-MM-dd HH:mm:ss"/></td>--%>
<%--                                    </tr>--%>
<%--                                </table>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
<%--                    </c:otherwise>--%>
<%--                </c:choose>--%>
<%--            </c:forEach>--%>
<%--        </table>--%>


    </div>
</div>
<footer>
    <%@include file="../include/footer.jsp" %>
</footer>
</body>
</html>
