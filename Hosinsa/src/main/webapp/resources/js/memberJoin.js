$(document).ready(function(){
    var count = 0;
    $("#joinBtn").click(function(){
        $("#joinForm").attr("action", "/member/join");
        $("#joinForm").submit();

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
        }/* else if($("#pw").val().length < 10){
            alert("비밀번호는 10~16자로 입력해주세요.");
            $("#pw").focus();
            return false;
        } else if($("#pw").val().length > 16){
            alert("비밀번호는 10~16자로 입력해주세요.");
            $("#pw").focus();
            return false;
        } */else if($("#pw").val() != $("#pw_check").val()){
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
        } else if($("#nickname").val().length < 5){
            alert("닉네임은 5~16자로 입력해주세요.");
            $("#nickname").focus();
            return false;
        } else if($("#nickname").val().length > 16){
            alert("닉네임은 5~16자로 입력해주세요.");
            $("#nickname").focus();
            return false;
        } else if (count < 1) {
            alert("중복체크를 해주세요.");
            $("#idCheckBtn").focus();
            return false;
        } 

        $('input[name=point]').attr('value', 50000);
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
        if($("#nickname").val() == ""){
            alert("닉네임을 입력해주세요.");
            $("#nickname").focus();
            return false;
        } else if($("#nickname").val().length < 5){
            alert("닉네임은 5~16자로 입력해주세요.");
            $("#nickname").focus();
            return false;
        } else if($("#nickname").val().length > 16){
            alert("닉네임은 5~16자로 입력해주세요.");
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
