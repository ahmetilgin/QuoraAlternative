<%-- Include tag is used to import header page --%>
<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%--Code to signup form --%>
<div class="container">

    <form class="form-signin" action="PostController?action=update&AMP;postId=${post.id}" method="post">
        <h2 class="form-signin-heading">Soruyu Düzenle</h2>
        <input type="hidden" name="action" value="update" />
        <label for="exampleTextarea" class="sr-only">Soru</label>
        <textarea name="question" class="form-control" id="exampleTextarea" rows="1" placeholder="Question" maxlength="150" required="">${post.question}</textarea>        <br>
        <label for="exampleTextarea" class="sr-only">Sorunun Detayları</label>
        <textarea name="question_details" class="form-control" id="exampleTextarea" rows="3" placeholder="Question Details" maxlength="300" required="">${post.content}</textarea>        <br>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Onayla</button>
        <h1 align="center">${requestScope.msg}</h1>
    </form><br>

</div> <!-- /container -->
