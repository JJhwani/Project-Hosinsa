$(document).ready(function(){
    var count = 0;
    var count2 = 0;
    var count3 = 0;
    $("#joinBtn").click(function(){
        if($("#id").val() == "") {
            alert("아이디를 입력해주세요.");
            $("#id").focus();
            return false;
        } else if($("#id").val().length < 5){
            alert("아이디는 5~16자로 입력해주세요.");
            $("#id").focus();
            return false;
        } else if($("#id").val().length > 16){
            alert("아이디는 5~16자로 입력해주세요.");
            $("#id").focus();
            return false;
        } else if($("#pw").val() == ""){
            alert("비밀번호를 입력해주세요.");
            $("#pw").focus();
            return false;
        } else if($("#pw").val().length < 10){
            alert("비밀번호는 10~16자로 입력해주세요.");
            $("#pw").focus();
            return false;
        } else if($("#pw").val().length > 16){
            alert("비밀번호는 10~16자로 입력해주세요.");
            $("#pw").focus();
            return false;
        } else if($("#pw").val() != $("#pw_check").val()){
            alert("비밀번호가 일치하지 않습니다.");
            $("#pw_check").focus();
            return false;
        } else if($("#name").val() == ""){
            alert("이름을 입력해주세요.");
            $("#name").focus();
            return false;
        } else if($("#email").val() == ""){
            alert("이메일을 입력해주세요.");
            $("#email").focus();
            return false;
        } else if($("#phone").val() == ""){
            alert("전화번호를 입력해주세요.");
            $("#phone").focus();
            return false;
        } else if($("#nickname").val() == ""){
            alert("닉네임을 입력해주세요.");
            $("#nickname").focus();
            return false;
        } else if($("#nickname").val().length < 2){
            alert("닉네임은 2~14자로 입력해주세요.");
            $("#nickname").focus();
            return false;
        } else if($("#nickname").val().length > 14){
            alert("닉네임은 2~14자로 입력해주세요.");
            $("#nickname").focus();
            return false;
        } else if (count < 1) {
            alert("아이디 중복체크를 해주세요.");
            $("#idCheckBtn").focus();
            return false;
        } else if (count2 < 1) {
            alert("닉네임 중복체크를 해주세요.");
            $("#nickCheckBtn").focus();
            return false;
        } else if ($("#introducer").val().length > 1 && count3 < 1) {
            alert("추천인 확인을 해주세요.");
            $("#introCheckBtn").focus();
            return false;
        } else if ($("#introducer").val() == "") {
            $('input[name=point]').attr('value', 50000);
        }

    });
    
    $("#idCheckBtn").on("click", function(){
        count++;
        // alert("클릭 : " + count);
        // console.log("keyup 테스트");	
        if($("#id").val() == "") {
            alert("아이디를 입력해주세요.");
            $("#id").focus();
            return false;
        } else if($("#id").val().length < 5){
            alert("아이디는 5~16자로 입력해주세요.");
            $("#id").focus();
            return false;
        } else if($("#id").val().length > 16){
            alert("아이디는 5~16자로 입력해주세요.");
            $("#id").focus();
            return false;
        }
        var memberId = $("#id").val();
        console.log(memberId);
        var data = {memberId : memberId}
    
        $.ajax({
            type : "POST",
            url : "/member/memberIdChk",
            data : data,
            success : function(result) {
                // console.log("성공 여부 : " + result);
                if(result != 'fail'){
                    $('#idCheckSpan').text('사용 가능한 아이디입니다.');		
                    $('#idCheckSpan').css('color', 'green');
                } else {
                    $('#idCheckSpan').text('이미 사용중인 아이디입니다.');
                    $('#idCheckSpan').css('color', 'red');
                } 
            }
        });
    });

    $("#nickCheckBtn").on("click", function(){
        count2++;
        if($("#nickname").val() == ""){
            alert("닉네임을 입력해주세요.");
            $("#nickname").focus();
            return false;
        } else if($("#nickname").val().length < 2){
            alert("닉네임은 2~14자로 입력해주세요.");
            $("#nickname").focus();
            return false;
        } else if($("#nickname").val().length > 14){
            alert("닉네임은 2~14자로 입력해주세요.");
            $("#nickname").focus();
            return false;
        }

        var memberNickname = $("#nickname").val();
        console.log(memberNickname);
        var data = {memberNickname : memberNickname};

        $.ajax({
            type : "POST",
            url : "/member/memberNickChk",
            data : data,
            success : function(result) {
                // console.log("성공여부 : " + result);
                if(result != 'fail') {
                    $('#nickCheckSpan').text('사용 가능한 닉네임입니다.');
                    $('#nickCheckSpan').css('color', 'green');
                } else {
                    $('#nickCheckSpan').text('이미 사용중인 아이디입니다.');
                    $('#nickCheckSpan').css('color', 'red');
                }
            }
        });
    });

    $("#introCheckBtn").on("click", function() {
        count3++;
        var memberIntroducer = $("#introducer").val();
        console.log(memberIntroducer);
        var data = {memberIntroducer : memberIntroducer};
    
        $.ajax({
            type : "POST",
            url : "/member/memberIntroChk",
            data : data,
            success : function(result) {
                // console.log("성공여부 : " + result);
                if(result == 'success') {
                    $('#introCheckSpan').text('추천인이 확인되었습니다.');
                    $('#introCheckSpan').css('color', 'green');
                    $('input[name=point]').attr('value', 150000);
                } else if(result != 'success') {
                    $('#introCheckSpan').text('추천인이 확인되지 않았습니다.');
                    $('#introCheckSpan').css('color', 'red');
                    $('#introducer').val("");
                    $('input[name=point]').attr('value', 50000);
                }
            }
        });
    });
});
