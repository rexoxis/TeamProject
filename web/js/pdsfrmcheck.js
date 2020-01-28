var newbtn = document.getElementById("newbtn");

newbtn.addEventListener("click",pdsfrmcheck);

function pdsfrmcheck(){
    var frm = document.pdsfrm;

    if(frm.psubject.value == ""){
        alert("제목을 입력하세요");
    } else if (frm.pcontents.value == ""){
        alert("본문 내용을 입력하세요.");
    } else if (frm.file1.value.lastIndexOf("jsp") != -1 || frm.file1.value.lastIndexOf("exe") != -1 || frm.file1.value.lastIndexOf("asp") != -1){
        alert("해당 파일은 업로드가 금지되어 있습니다.");
    } else {
        frm.submit();
    }
}