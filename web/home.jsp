<%@ include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--Check if there was a reporting action in the flow-->
<c:choose>
    <c:when test="${requestScope.reported != null}">
        <div id="content">
            <div class="alert alert-success" role=alert> <strong>Soru reportlandı</strong> Admin bakacak. </div>
        </div>
    </c:when>
    <c:when test="${sessionScope.theUser != null}">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <c:forEach var="post" items="${posts}">
     <div class="centered">  

         <div class="columns">

            <div id="content">
             <div onclick="location.href='PostController?action=up&AMP;postId=${post.id}'" class="arrow" style="cursor: pointer;"></div>

                <div class="panel panel-primary">
                    
                    <div  class="panel-heading">
          
                        <h3 class="panel-title"><a href="PostController?action=viewpost&AMP;postId=${post.id}" title="${post.question}">${post.question}</a></h3>
                    </div>
                    <div class="panel-body">
                        ${post.content}<br><br>
                        <p class="card-subtitle mb-2 text-muted"><small style="font-size:85%;">Oluşturulma Tarihi ${post.created_date} &nbsp;--&nbsp; Düzenlenme Tarihi ${post.modified_date} &nbsp;&nbsp; ${post.user.user_name}&nbsp;&nbspTarafından Oluşturuldu.&nbsp</small></p>
                        <span class="label label-primary">${post.category.name}</span>
                    </div>
                     
                    <div class="panel-footer text-primary">
                        &nbsp; <a href="PostController?action=report&AMP;postId=${post.id}" class="card-link"><font color="red">Raporla</font></a>
                      <a href="PostController?action=viewpost&AMP;postId=${post.id}" class="card-link"><font color="black">Cevapla</font></a></div>  

                        <c:choose>
                        <c:when test="${sessionScope.theUser.type == 'admin' }">
                         <a href="PostController?action=delete&AMP;postId=${post.id}" class="card-link"><font color="black">Sil</font></a></div>   
                        </c:when>
                         </c:choose>

                </div>
                         <div onclick="location.href='PostController?action=down&AMP;postId=${post.id}'" class="arrowdown" style="cursor: pointer;"></div>

            </div>
                </div>
             </div>
            <br> &nbsp;
        </c:forEach>
    </c:when>
    <c:otherwise>
        <div class="container">
            <p>
            <p class="text-center"><h1 class="text-center">Quora'ya Hoşgeldiniz!</h1>
            <br>

            <img src="images/rsz_quora_1.png" alt="..." class="img-responsive center-block" />
            <br>
            <h3>Amacımız Bilginin Paylaşılması...</h3>
            <br>

            <br>
        </div>
    </c:otherwise>
</c:choose>
