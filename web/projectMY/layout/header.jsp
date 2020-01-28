<%@ page pageEncoding="UTF-8" %>

<%
    boolean islogin = false;

    if(session.getAttribute("userid") != null){
        islogin = true;
    }
%>
<style>
    p { margin:20px 0px; }
</style>
   <header>
     <div>
        <h2 style="text-align: center; margin: 30px 0; font-size: 35px">착한아이</h2>
        <div class="text-right">
            <% if(islogin) {%>
        <button type="button" class="btn btn-primary" id="logoutbtn">로그아웃</button>
            <% } else {%>
        <button type="button" class="btn btn-primary" id="mloginbtn">로그인</button>
        <button type="button" class="btn btn-danger" id="joinbtn">회원가입</button>
            <% } %>
        </div>
        <hr color="#000000" >
         <div class="col">

             <ul class="nav nav-tabs">
                 <li class="nav-item">
                     <a class="nav-link active" href="#">메뉴바</a>
                 </li>
                 <li class="nav-item dropdown">
                     <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">메뉴들을</a>
                     <div class="dropdown-menu">
                         <a class="dropdown-item" href="#">Lorem</a>
                         <a class="dropdown-item" href="#">Ipsum</a>
                         <a class="dropdown-item" href="#">Dolor</a>
                     </div>
                 </li>
                 <li class="nav-item dropdown">
                     <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">넣어보자</a>
                     <div class="dropdown-menu">
                         <a class="dropdown-item" href="#">Lorem</a>
                         <a class="dropdown-item" href="#">Ipsum</a>
                         <a class="dropdown-item" href="#">Dolor</a>
                     </div>
                 </li>
                 <li class="nav-item dropdown">
                     <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">아무거나</a>
                     <div class="dropdown-menu">
                         <a class="dropdown-item" href="#">Lorem</a>
                         <a class="dropdown-item" href="#">Ipsum</a>
                         <a class="dropdown-item" href="#">Dolor</a>
                     </div>
                 </li>
                 <li class="nav-item dropdown">
                     <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">마음대로</a>
                     <div class="dropdown-menu">
                         <a class="dropdown-item" href="#">Lorem</a>
                         <a class="dropdown-item" href="#">Ipsum</a>
                         <a class="dropdown-item" href="#">Dolor</a>
                     </div>
                 </li>
                 <li class="nav-item dropdown">
                     <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">넣어보자</a>
                     <div class="dropdown-menu">
                         <a class="dropdown-item" href="#">Lorem</a>
                         <a class="dropdown-item" href="#">Ipsum</a>
                         <a class="dropdown-item" href="#">Dolor</a>
                     </div>
                 </li>
                 <li class="nav-item">
                     <a class="nav-link" href="#">누르는 메뉴</a>
                 </li>
                 <li class="nav-item">
                     <a class="nav-link disabled" href="#">사용x</a>
                 </li>
             </ul>
         </div>
     </div>
        </div>
   </header>