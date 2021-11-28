<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/WEB-INF/views/common/head.jsp" />
    <title>게시글 등록┃SEMO</title>
</head>
<body>
<!-- Navigation-->
<%
    String userID = null;
    if(session.getAttribute("userID") != null){
        userID = (String) session.getAttribute("userID");
    }

%>
<nav class="navbar navbar-expand-lg navbar-light fixed-top shadow-sm" id="mainNav">
    <div class="container px-5">
        <a class="navbar-brand fw-bold fs-4" href="main"><img src="images/favicon.png" style="width: 25px;"/>
            SEMO</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">영양제 소개</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="infoENS">현대인 필수 영양제</a></li>
                        <li><a class="dropdown-item" href="infoCNS">증상별 영양제 추천</a></li>
                        <li><a class="dropdown-item" href="infoNGNS">같이 섭취하면 좋지 않은 영양제</a></li>
                    </ul>
                </li>
                <li class="nav-item"><a class="nav-link me-lg-3" href="bbs2">방명록</a></li>
                <li class="nav-item"><a class="nav-link me-lg-3 active" href="bbs">게시판</a></li>
                <li class="nav-item"><a class="nav-link me-lg-3" href="newsVideo">NEWS & VIDEO</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">마이 페이지</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="myPage">회원 정보 수정</a></li>
                    </ul>
                </li>
            </ul>
            <%
                if (userID == null) {

            %>
            <ul class="navbar-nav ms-sm-5">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle btn btn-primary fw-bold" id="navbarDropdown" href="#"
                       role="button" data-bs-toggle="dropdown" aria-expanded="false">접속하기</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li class="active"><a class="dropdown-item" href="login">로그인</a></li>
                        <!-- active : 선택이 됨을 알려줌 -->
                        <li><a class="dropdown-item" href="join">회원가입</a></li>
                    </ul>
                </li>
            </ul>
            <%
            } else {
            %>
            <ul class="navbar-nav ms-sm-5">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle btn btn-primary" id="navbarDropdown" href="#" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">회원관리</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="logoutAction">로그아웃</a></li>
                    </ul>
                </li>
            </ul>
            <%

                }
            %>
        </div>
    </div>
</nav>
<!-- Navigation-->

<%--<div class="container">
    <h1 class="card-title text-center my-5 fw-bold fs-3">게시판</h1>
    <hr class="mt-2 mb-4">
    <div class="row">
        <form method="post" action="writeAction2" enctype="multipart/form-data">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th class="card-title" colspan="2">게시판 글쓰기</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="table-primary" style="vertical-align: middle;">제목</td>
                    <td class="table-secondary"><input type="text" class="form-control" placeholder="글 제목을 입력해주세요."
                                                       name="bbsTitle" maxlength="50"></td>
                </tr>
                <tr>
                    <td class="table-primary" style="vertical-align: middle;">내용</td>
                    <td class="table-secondary"><textarea type="text"class="form-control" placeholder="글 내용을 입력해주세요."
                                                          name="bbsContent" maxlength="2048" style="height: 350px"></textarea></td>
                </tr>
                <tr>
                    <td class="table-primary" style="vertical-align: middle;">첨부파일</td>
                    <td class="table-secondary" style="text-align: left;">
                        <input type="file" name="file_name"></td>
                </tr>
                </tbody>
            </table>
            <input type="submit" class="btn btn-primary float-end" value="글쓰기">
        </form>
    </div>
</div>--%>

<div class="container">
    <h1 class="card-title text-center my-5 fw-bold fs-3">게시판</h1>
    <hr class="mt-2 mb-4">
    <div class="row">
        <input id="board_idx" type="hidden" value="board.idx"/>
        <input id="board_create_date" type="hidden" value="board.createdDate"/>
            <table class="table table-hover">
                <thead>
                <tr>
                    <th class="card-title" colspan="2">게시판 글쓰기</th>
                </tr>
                </thead>
            <div>
            <div class = "board" style="padding:13px 0 0 15px;"/> 게시판 선택 </div>
            <td>
                <div class="pull-left">
                    <select class="form-control input-sm" id="board_type">
                        <option>--분류--</option>
                        <option value="notice">공지사항</option>
                        <option value="free">자유게시판</option>
                    </select>
                </div>
            </td>
        </tr>

        <tr>
            <th style="padding:13px 0 0 15px;">생성날짜</th>
            <td><input type="text" class="col-md-1 form-control input-sm" readonly="readonly" value="${board.createdDate} ? ${temporals.format(board.createdDate,'yyyy-MM-dd HH:mm')} : ${board.createdDate}"/></td>
        </tr>
        <tr>
            <th style="padding:13px 0 0 15px;">제목</th>
            <td><input id="board_title" type="text" class="col-md-1 form-control input-sm" value="${board.title}"/></td>
        </tr>
        <tr>
            <th style="padding:13px 0 0 15px;">부제목</th>
            <td><input id="board_sub_title" type="text" class="col-md-1 form-control input-sm" value="${board.subTitle}"/></td>
        </tr>
        <tr>
            <th style="padding:13px 0 0 15px;">내용</th>
            <td><textarea id="board_content" class="col-md-1 form-control input-sm" maxlength="140" rows="7" style="height: 200px;"
                          text="${board.content}"></textarea><span class="help-block"></span>
            </td>
        </tr>
        <tr>
            <td></td>
            <td></td>
        </tr>
    </table>
    <div class="pull-left">
        <a href="list" class="btn btn-primary float-start">글 목록</a>

    <div class="pull-right">
        <button type="submit" class="btn btn-primary float-end" id="insert">저장</button>
        <button type="submit" class="btn btn-primary float-end" id="update">수정</button>
        <button type="submit" class="btn btn-primary float-end" id="delete">삭제</button>
        <!--
        <button if="!${board.idx}" type="button" class="btn btn-primary" id="insert">저장</button>
        <button if="${board.idx}" type="button" class="btn btn-info" id="update">수정</button>
        <button if="${board.idx}" type="button" class="btn btn-danger" id="delete">삭제</button> -->
    </div>
    </div>
</div>

<footer> <jsp:include page="/WEB-INF/views/common/footer.jsp" /> </footer>
<!-- 스크립트 -->
<script src="@{/js/jquery.min.js}"></script>
<script if="!${board.idx}">
    $('#insert').click(function () {
        var jsonData = JSON.stringify({
            title: $('#board_title').val(),
            subTitle: $('#board_sub_title').val(),
            content: $('#board_content').val(),
            boardType: $('#board_type option:selected').val()
        });
        $.ajax({
            url: "http://localhost:8384/boards",
            type: "POST",
            data: jsonData,
            contentType: "application/json",
            headers: {
                "Authorization": "Basic " + btoa("havi" + ":" + "test")
            },
            dataType: "json",
            success: function () {
                alert('저장 성공!');
                location.href = 'list';
            },
            error: function () {
                alert('저장 실패!');
            }
        });
    });
</script>
<script if="${board.idx}">
    $('#update').click(function () {
        var jsonData = JSON.stringify({
            title: $('#board_title').val(),
            subTitle: $('#board_sub_title').val(),
            content: $('#board_content').val(),
            boardType: $('#board_type option:selected').val(),
            createdDate: $('#board_create_date').val()
        });
        $.ajax({
            url: "http://localhost:8384/boards/" + $('#board_idx').val(),
            type: "PUT",
            data: jsonData,
            contentType: "application/json",
            dataType: "json",
            success: function () {
                alert('수정 성공!');
                location.href = 'list';
            },
            error: function () {
                alert('수정 실패!');
            }
        });
    });
    $('#delete').click(function () {
        $.ajax({
            url: "http://localhost:8384/api/boards/" + $('#board_idx').val(),
            type: "DELETE",
            success: function () {
                alert('삭제 성공!');
                location.href = 'list';
            },
            error: function () {
                alert('삭제 실패!');
            }
        });
    });
</script>
</body>
</html>