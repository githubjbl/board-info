<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ page session="true"%>
<!-- 세션사용여부 -->
<link rel="stylesheet" href="${path}/include/css/style_table.css">

<div class="service_list_song">
    <h3>${param.filter}</h3>
    <table border="1" style="width:100%">

        <colgroup>
            <col style="width: 62px"><!-- 순서 & 순위 -->
            <col style="width: 50px"><!-- 순위등락 -->
            <col style="width: 80px"><!-- 이미지 -->
            <col><!-- 게임제목정보 -->
            <col style="width: 100px"><!-- 테마 -->
            <col style="width: 100px"><!-- 평점 -->
            <col style="width: 100px"><!-- 난이도 -->
            <col style="width: 100px"><!-- 조회수 -->
        </colgroup>


        <thead>

        <tr>
            <th scope="col" colspan="2">
                <div class="wrap t_center">순위</div>
            </th>
            <th scope="col">
                <div class="wrap none">이미지</div>
            </th>
            <th scope="col">
                <div class="wrap pd_l_12">게임명</div>
            </th>
            <th scope="col">
                <div class="wrap t_center">테마</div>
            </th>
            <th scope="col">
                <div class="wrap t_center">평점</div>
            </th>
            <th scope="col">
                <div class="wrap t_center">난이도</div>
            </th>
            <th scope="col">
                <div class="wrap t_center">조회수</div>
            </th>
        </tr>

        </thead>

        <tbody>


        <c:forEach var="row" items="${gameMap.glist}">

            <tr>

                <td><div class="wrap t_center"><span class="rank">${row.game_rank}</span><span class="none">위</span></div></td>

                <!-- 차트순위 추가 -->
                <td><div class="wrap">

			<span class="rank_wrap">
				<span class="none">순위 기능 구현가능할지..</span>
				<span class="none">0</span>
			</span>

                </div></td>

                <td><div class="wrap">
                    <c:choose>
                        <c:when test="${row.gamephoto_url != null}">
                            <img src="${path}/resources/uploaded_game${row.gamephoto_url}"  onerror="this.src='${path}/images/game/no-image-icon.png'" width="70px" height="70px">
                        </c:when>
                        <c:otherwise>
                            <c:choose>
                                <c:when test="${row.bgg_thumbnail != null}">
                                    <img class="img_photo" src="${row.bgg_thumbnail}" onerror="this.src='${path}/images/game/no-image-icon.png'" width="70px" height="70px" border="1px">
                                </c:when>
                                <c:otherwise>
                                    <img src="${path}/images/game/no-image-icon.png" width="70px" height="70px">
                                </c:otherwise>
                            </c:choose>
                        </c:otherwise>
                    </c:choose>
                </div></td>

                <td><div class="wrap">
                    <div class="wrap_song_info">
                        <div class="ellipsis rank01"><span>
					<a href="${path}/game/view.do?gnum=${row.gnum}">${row.gametitle}(${row.release_year})</a>
											</span></div><br>
                        <div class="ellipsis rank02">
                            <a href="${path}/game/view.do?gnum=${row.gnum}">${row.gametitle_eng}</a>
                        </div>
                    </div>
                </div></td>

                <td><div class="wrap t_center">
                    <div class="ellipsis rank03">
                        카테고리항목
                    </div>
                </div></td>

                <td><div class="wrap t_center">
                    <div class="ellipsis rank03">
                        <c:choose>
                            <c:when test="${row.rate == null}">
                                <strong>-</strong>
                            </c:when>
                            <c:otherwise>
                                <strong><fmt:formatNumber value="${row.rate}" pattern="0.0"/>(${row.tot})</strong>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div></td>

                <td><div class="wrap t_center">
                    <div class="ellipsis rank03">
                        <c:choose>
                        <c:when test="${row.weight == null}">
                            <strong>-</strong>
                        </c:when>
                        <c:otherwise>
                        <strong><strong><fmt:formatNumber value="${row.weight}" pattern="0.0"/>(${row.tot})</strong>
                            </c:otherwise>
                            </c:choose>
                    </div>
                </div></td>

                <td><div class="wrap t_center">
                    <div class="ellipsis rank03">
                            ${row.totalviewcount}
                    </div>
                </div></td>

            </tr>

        </c:forEach>
        </tbody>
    </table>

    <a href="${path}/search/totalSearchMore/${param.filter}/${gameKeyword}" style="display: inline-block; float: right;">더보기</a>
</div>
