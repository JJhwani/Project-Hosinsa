//초기화 시키기. 
$(document).ready(function(){
    Kakao.init('b704646be8378b917097770dbdb716ca');
    Kakao.isInitialized();
});

function loginWithKakao() {
    Kakao.Auth.authorize({ 
    redirectUri: 'https://localhost:8081/kakao_callback' 
    }); // 등록한 리다이렉트uri 입력
}