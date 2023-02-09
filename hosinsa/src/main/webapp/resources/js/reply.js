console.log("Reply Module.......");

var replyService = (function(){ //즉시 실행함수 내부에서 필요한 메서드를 구성해서 객체를 구성하는 방식

//댓글 등록
    function add(reply, callback, error){ //json타입으로 reply에 값이 들어옴
        console.log("and reply..............");
        //ajax을 이용해서 post 방식으로 호출
        $.ajax({
			type : 'post', // post 방식으로
			url : '/replies/new', //이 경로로 전송함
			data : JSON.stringify(reply), //json->string 타입으로 변환
			contentType : "application/json; charset=utf-8", //데이터 전송타입
			success : function(result, status, xhr) { 
				if (callback) { //ajax 호출 성공후 casllback값으로 함수가 존재한다면
					callback(result); //해당 함수를 호출해서 결과를 반영
				}
			},
			error : function(xhr, status, er) { //status=상태값
				if (error) {
					error(er);
				}
			}
		})
	}

	//댓글 목록
		function getList(param, callback, error) {//param이라는 객체를 통해서 필요한 파라미터를 전달받음

		var bno = param.bno;
		var page = param.page || 1;

		$.getJSON("/replies/pages/" + bno + "/" + page + ".json", //json형태가 필요하므로 호출시 .json요구
				function(data) {
					if (callback) {
						callback(data);
					}
				}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}

	//댓글 삭제
	function remove(rno, callback, error) {
		$.ajax({
			type : 'delete',
			url : '/replies/' + rno,
			success : function(deleteResult, status, xhr) {
				if (callback) {
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}

	//댓글 수정
	function update(reply, callback, error) {

		console.log("RNO: " + reply.rno);

		$.ajax({
			type : 'put',
			url : '/replies/' + reply.rno,
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}

	//댓글 조회
	function get(rno, callback, error) {

		$.get("/replies/" + rno + ".json", function(result) {

			if (callback) {
				callback(result);
			}

		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}

    return {
        add : add, //참조변수 : 메서드
		getList : getList,
		remove : remove,
		update : update,
		get : get
    };
})(); //replyService확인은 get.jsp를 이용해서 확인
