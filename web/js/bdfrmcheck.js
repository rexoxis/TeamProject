var newbtn = document.getElementById("newbtn");

newbtn.addEventListener("click",bdfrmcheck);

function bdfrmcheck(){
    var frm = document.bdfrm;

    if(frm.subject.value == ""){
        alert("제목을 입력하세요");
    } else if (frm.contents.value == ""){
        alert("본문 내용을 입력하세요.")
    } else {
        frm.submit();
    }
}