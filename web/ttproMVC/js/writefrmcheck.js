var okbtn = document.getElementById("okbtn");

okbtn.addEventListener("click",writefrmcheck);

function writefrmcheck(){
    var frm = document.writefrm;

    if(frm.wtitle.value == ""){
        alert("제목을 입력하세요");
    } else if (frm.wcontents.value == ""){
        alert("본문 내용을 입력하세요.")
    } else {
        frm.submit();
    }
}



