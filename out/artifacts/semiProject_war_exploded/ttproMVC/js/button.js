// 상단 로그인 버튼
$(function () {
    $('#mloginbtn').on('click', function (e) {
        location.href = 'login.do';
    });
});
// 회원가입 버튼
$(function () {
    $('#joinbtn').on('click', function (e) {
        location.href = 'signAgree.do';
    });
});
// 상단 로그아웃 버튼
$(function () {
    $('#logoutbtn').on('click', function (e) {
        location.href = 'logout.do';
    });
});



