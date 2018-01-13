
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Soru Sor</title>

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="styles/main.css">
    </head>
    <body>
        <br>
        <div class="container">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                           <a class="navbar-brand" href="PostController?action=home">Quora</a>
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                                aria-expanded="false" aria-controls="navbar">
                            
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                
                        </button>		
     			               
                    </div>
                    
             
                        <c:choose>
                            <c:when test="${sessionScope.theUser != null}">
                                
                                <ul class="nav navbar-nav">
                                    <li><a href="PostController?action=home">Anasayfa</a></li>
                                </ul>

                                <c:choose>
                                    <c:when test="${sessionScope.theUser.type == 'user' }">
                                        
                                        <ul class="nav navbar-nav">
                                            
                                            <li><a href="PostController?action=add-post">Bir Soru Sor</a></li>
                                            <li><a href="PostController?action=profile">Profil</a></li>
                                            <li><a href="PostController?action=myposts">Gönderilerim</a></li>
                                        </ul>
                                    </c:when>
                                    
                                    <c:otherwise>
                                        <ul class="nav navbar-nav">
                                            <li><a href="PostController?action=moderate">Raporlanmış Gönderiler</a></li>
                                        </ul>
                                    </c:otherwise>
                                </c:choose>
                                                 <c:choose>
                              <c:when test="${sessionScope.theUser != null}">
                                  <form action="PostController?action=viewPostsCategory"  method="post">
                      
                      <div id="navbar" class="navbar-collapse collapse">
                                          <input id = "searchCategory" name ="searchCategory"  type="text" class="form-control pull-left" style="width: 250px;margin-left: 70px;margin-top: 8px; margin-right: 20px; border: 2px solid black;" placeholder="Kategori Ara">

                              <button  type="submit"  class="btn btn-default" style = "margin-top: 8px">
								<span class="glyphicon glyphicon-search">
									<span class="sr-only">Ara</span>
								</span>
					</button>
                                  </form>
                                                      <ul class="nav navbar-nav navbar-right">
                                    <li><a href="UserController?action=about">Hakkımızda</a></li>
                                    <li><a href="UserController?action=start-contact">İletişim</a></li>
                                </ul>

                                <ul class="nav navbar-nav navbar-right">
                                    <li><a href="UserController?action=logout">Çıkış</a></li>
                                </ul>
                      </div>
                                      
                     </c:when>      
                         </c:choose>    
            
                            </c:when>
                            <c:otherwise>
                                <ul class="nav navbar-nav navbar-right">
                                    <li><a href="UserController?action=start-login">Giriş</a></li>
                                    <li><a href="UserController?action=start-signup">Yeni Kayıt</a></li>
                                    <li><a href="UserController?action=about">Hakkımızda</a></li>
                                    <li><a href="UserController?action=start-contact">İletişim</a></li>
                                </ul>
                            </c:otherwise>
                        </c:choose>
                    </div><!--/.nav-collapse -->
                </div><!--/.container-fluid -->
            </nav>
        </div>