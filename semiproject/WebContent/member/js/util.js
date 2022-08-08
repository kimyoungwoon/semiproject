// 내용의 값의 빈공백을 trim(앞/뒤)
String.prototype.trim = function() {
		var TRIM_PATTERN = /(^\s*)|(\s*$)/g;
		return this.replace(TRIM_PATTERN, "");
};

// E-Mail 검사
function isValidEmail(email) {
	var format = /^((\w|[\-\.])+)@((\w|[\-\.])+)\.([A-Za-z]+)$/;
    if (email.search(format) != -1)
        return true; //올바른 포맷 형식
    return false;
}

// 한글 필터링
function isValidKorean(data){
     // UTF-8 코드 중 AC00부터 D7A3 값이지 검사
	var format = /^[\uac00-\ud7a3]*$/g;
    if (data.search(format) != -1)
        return true; //올바른 포맷 형식
    return false;
}

// 날짜 검사
function isValidDate(year, month, day) {
	var days = new Array (31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);

     if(year%4==0 && year%100 !=0 || year%400==0)
       days[1]=29;
     else
       days[1]=28;

     if(month < 1 || month > 12)
       return false;

     if(day > days[month-1] || day < 1)
       return false;
     return true;
}

//isCapsLockOn(event) {
//    var infoText = tAlertCPW;
//    console.log(typeof event.key);
//    //여기가 문자를 클릭했을 때만 cap록 눌렸따고 경고가 나와야함
//    if (event.key == "CapsLock") {
//        //네이버와 동일한 구현을 위한 코드
//
//        infoText.innerText = EMPTY_STRING;
//        return;
//    }
//    infoText.style = "display: default; color: red";
//
//    if (event.getModifierState("CapsLock")) {
//        infoText.innerText = "Caps Lock 이 켜져 있습니다.";
//    } else {
//        infoText.innerText = EMPTY_STRING;
//    }
//}



function checkID(event) {
	console.log("들어오나");
    pInputID = tInputID;
    infoText = tAlertID;
    
    let regID = $("#reg_id");

    infoText.style = "display: default; color: red";
    // var inputText = String(document.getElementById("inputbox_ID").value);
    const regex = /^[0-9a-z]{1}[0-9a-z_-]{4,19}$/;

    if (pInputID.value.length == eCheckResult.EMPTY) {
        infoText.innerText = "필수 정보입니다.";
    } else if (/*db적용시 중복값 체크*/ null) {
        // "이미 사용중이거나 탈퇴한 아이디입니다."

        //트리거 하나 만들어서 삭제되는 아이디를 다른 테이블에 저장해두자.
        //그래서 그걸 가지고 탈퇴한 아이디도 체크해보자.

        alert("중복값 체크");
    } else if (!regex.test(pInputID.value)) {
        infoText.innerText = "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
    } else {
        infoText.style = "display: default; color: green";
        infoText.innerText = "멋진 아이디네요!";
        return true;
    }
//
//    return false;
//    // 아이디의 입력 조건
//    // 1. 형식이 맞지 않을 때
//    //  -5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.
//    // 2. 중복이거나 탈퇴한 아이디일 때
//    // 	-이미 사용중이거나 탈퇴한 아이디입니다.
//    // 3. 사용 가능할 때
//    // 	-멋진 아이디네요!
//    // 4. 포커스가 왔다가 나갔는데 아무 값이 없을 때
//    //  -필수 정보입니다.
}