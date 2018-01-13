<%-- Include tag is used to import header page --%>
<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%--Code to signup form --%>
<div class="container">

    <form class="form-signin" action="PostController?action=add" method="post">
        <h2 class="form-signin-heading">Soru Sor !</h2>
        <input type="hidden" name="action" value="addpost" />
        <label for="exampleTextarea" class="sr-only">asdas</label>
        <textarea name="question" class="form-control" id="exampleTextarea" rows="1" placeholder="Soru Başlığı" maxlength="150" required=""></textarea>        <br>
        <label for="exampleTextarea" class="sr-only">Question Details</label>
        <textarea name="question_details" class="form-control" id="exampleTextarea" rows="3" placeholder="Soru Detayları" maxlength="300" required=""></textarea>        <br>
        <label class="sr-only">Category</label>
        <input type="text" name="category" id="inputEmail" class="form-control" placeholder="Kategori" required autofocus> <br>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Yolla!</button>
        <h1 align="center">${requestScope.msg}</h1>
    </form><br>

</div> <!-- /container -->
