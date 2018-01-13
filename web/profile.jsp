<%-- Include tag is used to import header page --%>
<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <div id="content">
        <div class="container">
            <h1>Profil Bilgileri</h1><br>
            <div class=table-responsive>
                    <table class="table table-condensed table-hover table-nonfluid">
                        <tbody>
                        <tr>
                            <th scope=row>Kullanici Adi:</th>
                            <td>${sessionScope.theUser.user_name}</td>
                        </tr>
                        <tr>
                            <th scope=row>Email:</th>
                            <td>${sessionScope.theUser.email}</td>
                        </tr>
                        <tr>
                            <th scope=row>Tipi:</th>
                            <td>${sessionScope.theUser.type}</td>
                        </tr>
                        <tr>
                            <th scope=row>Giris Tarihi:</th>
                            <td>${sessionScope.theUser.reg_date}</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                        </tr>

                        </tbody>
                    </table>
            </div>
        </div>
    </div>
