<%-- Include tag is used to import header page --%>
<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%--Code to signup form --%>
<div class="container">

    <c:if test="${requestScope.contacted == 'true' }">
        <div class="alert alert-success" role="alert">
        <strong>Yolla!</strong> Tekrar Bekleriz :)
      </div>
    </c:if>
    
    <form class="form-signin" action="UserController?action=contact" method="post">
        <h2 class="form-signin-heading">İletişim</h2>
        <input type="hidden" name="action" value="contact" />
        <label class="sr-only">Username</label>
        <input type="text" name="username" id="inputEmail" class="form-control" placeholder="Kullanıcı Adı" required autofocus>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" name="email" id="inputEmail" class="form-control" placeholder="Email" required autofocus>
        <label for="exampleTextarea" class="sr-only">Message</label>
        <textarea name="message" class="form-control" id="exampleTextarea" rows="3" placeholder="Mesaj"></textarea>        <br>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Onayla</button>
        <h1 align="center">${requestScope.msg}</h1>
    </form><br>

</div> <!-- /container -->
