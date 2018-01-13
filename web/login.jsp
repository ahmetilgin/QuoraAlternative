<%-- Include tag is used to import header page --%>
<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%--Code to signup form --%>
<div class="container">

    <form class="form-signin" action="UserController?action=login" method="post">
        <h2 class="form-signin-heading">Giriş Yap</h2>
        <input type="hidden" name="action" value="login">
        <label for="inputEmail" class="sr-only">Email adresi</label>
        <input type="email" name="email" id="inputEmail" class="form-control" placeholder="Email Adresi" required autofocus>
        <label for="inputPassword" class="sr-only">Şifre</label>
        <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Şifre" required>
        <br>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Giriş Yap</button>
        <h1 align="center">${requestScope.msg}</h1>
    </form><br>
    
<!--    <%-- Code to go to Sign up for a new account  --%>
        <form class="form-signin" action="UserController?action=signup">
            <button type="submit" class="btn btn-primary" style="text-align: center">Signup</button>
        </form>

        <form class="form-signin" action="UserController?action=adminlogin">
            <button type="submit" class="btn btn-primary" style="text-align: center">Login as Admin</button>
        </form><br>-->

</div> <!-- /container -->
