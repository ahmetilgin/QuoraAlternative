<%@ include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="content">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3  class="panel-title"><a href="PostController?action=viewpost&AMP;postId=${post.id}" title="${post.question}">${post.question}</a></h3>
        </div>
        <div class="panel-body">
            ${post.content}<br><br>
            <p class="card-subtitle mb-2 text-muted"><small style="font-size:85%;"><strong>Oluşturulma Tarihi ${post.created_date} &nbsp;--&nbsp; Düzenlenme Tarihi ${post.modified_date} &nbsp;by&nbsp; ${post.user.user_name}</strong></small></p>
            <span class="label label-primary">${post.category.name}</span>
        </div>
        <div class="panel-footer text-primary">
            <div class="actionBox">
                <c:forEach var="comment" items="${comments}">
                    <ul class="commentList">
                        <li>
                            <div class="commenterImage">
                                <p class="media-heading user_name"><small style="font-size:85%;">${comment.user.user_name}</small></p>
                            </div><br>
                            <div class="commentText">
                                <p class="">${comment.content}</p> <span class="date sub-text">on ${comment.created_date}</span>
                                &nbsp; <a href="PostController?action=reportComment&AMP;comment=${comment.id}" class="card-link"><font color="red">Raporla</font></a>   
                        <c:choose>
                        <c:when test="${sessionScope.theUser.type == 'admin' }">
                         <a href="PostController?action=deleteComment&AMP;comment=${comment.id}" class="card-link"><font color="black">Sil</font></a></div>   &nbsp;  
                        </c:when>
                         </c:choose>
                            </div>
                        </li>
                    </ul>
                </c:forEach>
                <form class="form-inline" role="form" action="PostController?action=comment&AMP;postId=${post.id}" method="post">
                    <div class="form-group">
                        <input class="form-control" name="comment" type="text" placeholder="Your comments" />
                    </div>
                    <div class="form-group">
                        <button class="btn btn-default">Add</button>
                    </div>
                </form>
            </div>
        </div>

        </div> 
    </div>
