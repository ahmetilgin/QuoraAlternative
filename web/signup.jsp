<%-- Include tag is used to import header page --%>
<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%--Code to signup form --%>
<div class="container">

    <form class="form-signin" action="UserController?action=create" method="post">
        <h2 class="form-signin-heading">Sign up</h2>
        <input type="hidden" name="action" value="signup" />
        <label class="sr-only">Username</label>
        <input type="text" name="username" id="inputEmail" class="form-control" placeholder="Kullanıcı Adı" required autofocus>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" name="email" id="inputEmail" class="form-control" placeholder="Email" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Şifre" required>
        <label for="inputPassword" class="sr-only">Confirm Password</label>
        <input type="password" name="confirm_password" id="inputPassword" class="form-control" placeholder="Şifre Onayla" required>
        <br>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Kayıt Ol</button>
        <h1 align="center">${requestScope.msg}</h1>
    </form><br>

</div> <!-- /container -->
