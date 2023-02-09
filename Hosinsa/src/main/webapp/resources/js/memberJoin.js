$(document).ready(function(){
    $("#joinBtn").click(function(){
        /* $("#joinForm").attr("action", "/member/join");
        $("#joinForm").submit(); */
        
        if($("#id").val() == ""){
            alert("아이디를 입력해주세요.");
            $("#id").focus();
            return false;
        }
        if($("#id").val().length < 5){
            alert("아이디는 5~16자로 입력해주세요.");
            $("#id").focus();
            return false;
        }
        if($("#id").val().length > 16){
            alert("아이디는 5~16자로 입력해주세요.");
            $("#id").focus();
            return false;
        }
        if($("#pw").val() == ""){
            alert("비밀번호를 입력해주세요.");
            $("#pw").focus();
            return false;
        }
        /* if($("#pw").val().length < 10){
            alert("비밀번호는 10~16자로 입력해주세요.");
            $("#pw").focus();
            return false;
        }
        if($("#pw").val().length > 16){
            alert("비밀번호는 10~16자로 입력해주세요.");
            $("#pw").focus();
            return false;
        } */
        if($("#pw").val() != $("#pw_check").val()){
            alert("비밀번호가 일치하지 않습니다.");
            $("#pw_check").focus();
            return false;
        }
        if($("#name").val() == ""){
            alert("이름을 입력해주세요.");
            $("#name").focus();
            return false;
        }
        if($("#email").val() == ""){
            alert("이메일을 입력해주세요.");
            $("#email").focus();
            return false;
        }
        if($("#phone").val() == ""){
            alert("이메일을 입력해주세요.");
            $("#phone").focus();
            return false;
        }
        if($("#nickname").val() == ""){
            alert("닉네임을 입력해주세요.");
            $("#nickname").focus();
            return false;
        }
    });
    
    $("#id_check").on("click", function(){
        // console.log("keyup 테스트");	
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
                    alert("사용 가능한 아이디 입니다.");			
                } else {
                    alert("이미 사용중인 아이디 입니다.");
                }
            }
        });
    });
    
});
