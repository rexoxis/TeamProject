var frm = document.joinfrm;

var joinuidrex = /^[a-zA-Z][0-9a-zA-Z]{6,16}$/;
var pwdrex = /[a-zA-Z!@#][0-9a-zA-Z!@#]{5,15}$/;
var emailrex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
var telrex = /^\d{3}-\d{4}-\d{4}/;


function joinfrmcheck() {
    var jumin1 = $('#jumin1').val();
    var jumin2 = $('#jumin2').val();
    var email1 = frm.email1.value;
    var email2 = frm.email2.value;
    var tel1 = frm.tel1.value;
    var tel2 = frm.tel2.value;
    var tel3 = frm.tel3.value;
    var zipcode = frm.zip.value;

    if (frm.name.value == "") {
        alert("이름을 입력하세요.");

    } else if (jumin1 == "") {
        alert("주민등록번호 앞자리를 입력하세요.");

    } else if (jumin2 == "") {
        alert("주민등록번호 뒷자리를 입력하세요.");

    } else if (!joinuidrex.test(frm.userid.value)) {
        alert("아이디를 확인해주세요.");

    } else if (!pwdrex.test(frm.passwd.value)) {
        alert("비밀번호는 숫자,특수문자, 영문대소문자로만 가능합니다.");

    } else if (frm.passwd.value < 6 || frm.passwd.value >= 16) {
        alert("비밀번호는 6자이상 16자 이하입니다.");

    } else if (frm.repasswd.value != frm.passwd.value) {
        alert("비밀번호가 일치하지 않습니다.");

    } else if (zipcode == "") {
        alert("우편번호를 입력 해주세요.");

    } else if (frm.addr1.value == "" || frm.addr2.value == "") {
        alert("주소를 입력하세요");

    } else if (email1 == "" || email2 == "") {
        alert("이메일 주소를 입력하세요,");

    } else if (!emailrex.test(email1 + '@' + email2)) {
        alert("이메일 주소를 확인하세요,");

    } else if (tel1 == "" || tel2 == "" || tel3 == "") {
        alert("전화번호를 입력하세요,");

    } else if (!telrex.test(tel1 + '-' + tel2 + '-' + tel3)) {
        alert("전화번호를 다시 한번 확인하세요,");

    } else if (frm.cap.value == "") {
        alert("자동가입 방지 문자를 다시 확인해주세요.");

    } else {
        frm.submit();
    }
}

function jumincheck(jm1, jm2) {
    // 주민번호 유효성 검사
    // 각 자릿수에 상수를 곱한뒤 11로 나눈 나머지가 주민번호 맨 마지막 숫자와 일치여부 검사
    // 11 - ((2xA + 3xB + 4xC + 5xD + 6xE + 7xF + 8xG + 9xH + 2xI + 3xJ + 4xK + 5xL) % 11) % 11 = M
    var jms = [];
    var mul = [2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5];
    var sum = 0;
    var jumin = jm1 + jm2;

    // 주민번호 각 자리를 추출함
    for (var i = 0; i < 13; i++) {
        jms[i] = jumin.substring(i, i + 1);
    }

    // 각 자리값과 상수를 곱한후 총합을 구함
    for (var i = 0; i < 12; i++) {
        sum += (jms[i] * mul[i]);
    }

    // 11로 나눈 나머지를 11에서 뺌
    // 결과가 10 이상이면 첫째자리를 10 미만이면
    sum = (11 - (sum % 11)) % 11;

    // 결과값과 주민번호 맨 마지막 값이 일치하는지 검사
    if (sum == jms[12]) {
        return true;
    } else {
        return false;
    }
}

// 이메일 입력시 자동입력과 직접입력 방식 선택 구현
$('#sendemail').change(function () {
    $('#sendemail option:selected').each(function () {
        if ($(this).val() == "myemail") {
            $('#email2').val('');
            $('#email2').attr('readonly', false);
        } else {     // 직접입력이 아닐때
            $('#email2').val($(this).text());
            $('#email2').attr('readonly', true);

        }
    })
});

