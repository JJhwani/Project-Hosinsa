<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../../../resources/css/hosinsa.css">
<div class="footer">ⓒ2023 HOSINSA cop.</div>
	<div
	  id="kakao-talk-channel-chat-button"
	  data-channel-public-id="_jCEvxj"
	  data-title="consult"
	  data-size="small"
	  data-color="yellow"
	  data-shape="pc"
	  data-support-multiple-densities="true"
	></div>
</body>
<script>
  window.kakaoAsyncInit = function() {
    Kakao.Channel.createChatButton({
      container: '#kakao-talk-channel-chat-button',
      channelPublicId: '_jCEvxj' // 카카오톡 채널 홈 URL에 명시된 id로 설정합니다.
    });
  };

  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = 'https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.channel.min.js';
    js.integrity = 'sha384-MEvxc+j9wOPB2TZ85/N6G3bt3K1/CgHSGNSM+88GoytFuzP4C9szmANjTCNfgKep';
    js.crossOrigin = 'anonymous';
    fjs.parentNode.insertBefore(js, fjs);
  })(document, 'script', 'kakao-js-sdk');
</script>
</html>