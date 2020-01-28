var loginbtn = document.getElementById("loginbtn");
var logoutbtn = document.getElementById("logoutbtn");
loginbtn.addEventListener("click", loginfrm);
logoutbtn.addEventListener("click", gologout);

// alert창 띄우는 함수
// function loginfrm_() {
//     var frm = document.loginfrm;
//     if(frm.userid.value == ""){
//         alert("아디이를 입력하세요.");
//     } else if(frm.passwd.value == ""){
//         alert("비밀번호를 입력하세요.");
//     } else {
//         frm.submit();
//     }
//
// }

function loginfrm(){
    var frm = document.loginfrm;
    var idmsg = document.getElementById("idmsg");
    var pwmsg = document.getElementById("pwmsg");
    idmsg.innerHTML = "";
    pwmsg.innerHTML = "";

    if(frm.userid.value == ""){
        idmsg.innerHTML = "아이디를 입력하세요.";
    }

    if(frm.passwd.value == ""){
        pwmsg.innerHTML = "비밀번호를 입력하세요.";
    }

    if(frm.userid.value != "" & frm.passwd.value != ""){
        frm.submit();
    }
}

function gologout(){
    location.href = '/ttpro/login/logout.jsp';
}

