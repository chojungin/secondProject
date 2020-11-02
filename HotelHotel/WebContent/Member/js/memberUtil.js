$(document)
		.ready(
				function() {

					ajaxUtils = ajaxUtil();

					console.log(document.location.href);

					// initSelectOptions();

					/*
					 * $(document).on('click', '#btnSearchGogak',
					 * clickedBtnSearchGogak);
					 */

					// 회원 정보 수정
					$(document).on('click', '#btnPwCheck', clickedBtnUpdateUserInfo);// 정보수정
					// 버튼

					$(document).on('keyup', '#pw1', onPassword); // 비밀번호 1,2
																	// 체크 및 1번
																	// 정규식 확인
					$(document).on('keyup', '#pw2', onPassword); // 비밀번호 1,2
																	// 체크 및2번
																	// 정규식 확인
					$(document).on('keyup', '#nic', onNicName); // 닉네임 키업 이벤트
																// 중복체크
					$(document).on('keyup', '#tel', autoHypenPhone);//

					// 회원가입
					$(document).on('click', '#memberInsert',
							clickedMemberInsert);
					$(document).on('keyup', '#insertId', oninsertId);
					$(document).on('keyup', '#insertPw1', onPassword); // 비밀번호
																		// 1,2
																		// 체크 및
																		// 1번
																		// 정규식
					// 확인
					$(document).on('keyup', '#insertPw2', onPassword); // 비밀번호
																		// 1,2
																		// 체크
																		// 및2번
																		// 정규식
					// 확인
					$(document).on('keyup', '#insertNic', onNicName);
					$(document).on('keyup', '#insertTel', autoHypenPhone);

					$(document).on('click', '#btnMyBoardList', ClickedmyBoard); // 내가 쓴
																				// 글 보기
					
					$(document).on('click', '#btnMyReservList', ClickedmyReserv); // 내가
																				// 예약한
																				// 글 보기

					
					
					$(document).on('click', '#insertRoomLvl', clickedBtnInsertRoomLvl);	//방 클래스 추가 버튼
					
					$(document).on('click', '#insertRoom', clickedBtnInsertRoom); //방 추가버튼
					
					
					searchParam = {
						currPage : 1,
						startIndex : (1 - 1) * 10 + 1,
						lastIndex : (1 - 1) * 10 + 10
					};

					
					
					
					//$(document).delegate('#myBoardTable tr', 'click', employeeProfile);
					//$(document).delegate('#memberInfoList tr', 'click',	employeeProfile);
					//$(document).delegate('#myReservTable tr', 'click', employeeProfile);
					$(document).delegate('#managerMenu tr', 'click', clicedkManagerMenu);
					
					

					$(document).delegate('#roomClassList tr', 'click', clicedkRoomClassList);
					if (document.location.href == "http://localhost:8880/member/insertRoomLvl.do" || document.location.href == "http://192.168.58.190:8880/member/insertRoomLvl.do" ) {
						location.href="/Member/managerPage.jsp";
						
					}
					
					
					if (document.location.href == "http://localhost:8880/Member/myBoard.jsp" || document.location.href == "http://192.168.58.190:8880/Member/myBoard.jsp") {
						
						searchParam = {
							id : $('#sessionId').val(),
							currPage : 1,
							startIndex : (1 - 1) * 10 + 1,
							lastIndex : (1 - 1) * 10 + 10
						};

						ajaxUtils.doPostText('/member/myBoardList.do',
								searchParam, myBoardList);
					}

					if (document.location.href == "http://localhost:8880/Member/myReservList.jsp" || document.location.href == "http://192.168.58.190:8880/Member/myReservList.jsp") {
						
						searchParam = {
							id : $('#sessionId').val(),
							currPage : 1,
							startIndex : (1 - 1) * 10 + 1,
							lastIndex : (1 - 1) * 10 + 10
						};

						ajaxUtils.doPostText('/member/myReservList.do',
								searchParam, myReservList);
					}
					
					
					if (document.location.href == "http://localhost:8880/Member/managerPage.jsp" || document.location.href == "http://192.168.58.190:8880/Member/managerPage.jsp") {

						searchParam = {
							currPage : 1,
							startIndex : (1 - 1) * 10 + 1,
							lastIndex : (1 - 1) * 10 + 10
						};

						ajaxUtils.doPostText('/member/memberInfoList.do',
								searchParam, memberInfoList);
					}

				});




// 아이디 중복체크 확인
function checkId(dataList) {
	var result = JSON.parse(dataList).result;

	var idRule = /^[A-Za-z0-9]{6,12}$/;// 숫자와 문자 포함 형태의 6~12자리 이내의 암호 정규식

	if (result == 1 || !idRule.test($('#insertId').val())) {
		$('#lblId').html("사용불가");
		$('#idCheck').val('1');
		$('#lblId').removeClass();
		$('#lblId').addClass('text-danger');
	} else {
		$('#lblId').html("사용가능");
		$('#lblId').removeClass();
		$('#lblId').addClass('text-success');
		
		$('#idCheck').val('0');
	}

}

// 아이디 중복체크 에이작스
function oninsertId() {
	var param = {
		id : $(this).val()
	};

	ajaxUtils.doPostText('/member/checkId.do', param, checkId);

}

// 회원가입 버튼 클릭
function clickedMemberInsert() {

	var passRule = /^[A-Za-z0-9]{6,12}$/;// 숫자와 문자 포함 형태의 6~12자리 이내의 암호
	// 정규식

	if ($('#insertId').val() == '') {
		alert("아이디를 입력해주세요");

	} else if ($('#idCheck').val() == '1') {
		alert("중복된 아이디입니다. 다시 입력해주세요.");

	} else if ($('#insertPw1').val() != $('#insertPw2').val()) {
		alert("비밀번호를 확인해주세요");

	} else if (!passRule.test($('#insertPw1').val())
			&& $('#insertPw1').val() != "") {
		alert("비밀번호는  숫자와 문자 포함 형태의 6~12자리 이내로만 가능합니다.");

	} else if ($('#insertNic').val() == "") {
		alert("닉네임을 입력해 주세요.");

	} else if ($('#nicCheck').val() == "1") {
		alert("중복된 닉네임 입니다. 다른 닉네임을 입력해주세요.");

	} else if ($('#insertTel').val() == "") {
		alert("전화번호를 입력해 주세요.");

	} else if ($('#insertTel').val().length != 13) {
		alert("전화번호를 입력해 주세요.");

	} else if ($('#telCheck').val() == "1") {
		alert("중복된 중복된 전화번호입니다. 다른 전화번호를 입력해주세요.");
	} else {

		var info = {
			id : $('#insertId').val(),
			pw1 : $('#insertPw1').val(),
			name : $('#insertName').val(),
			tel : $('#insertTel').val(),
			nic : $('#insertNic').val()

		}

		ajaxUtils.doPostText('/member/insertInfo.do', info, memberInsert);
	}

	// 회원가입 실행
	function memberInsert(dataList) {
		alert("회원가입되었습니다.");

		var data = dataList;

		location.href = "/index.jsp";
	}

}

function testRequest(dataList) {
	var jsonObj = JSON.parse(dataList);
}

function ClickedmyBoard() {

	location.href = "/Member/myBoard.jsp";

}
function ClickedmyReserv() {

	location.href = "/Member/myReservList.jsp";

}

function autoHypenPhone() {

	var str = $(this).val();
	str = str.replace(/[^0-9]/g, '');
	var tmp = '';
	if (str.length < 4) {
		$(this).val(str);
	} else if (str.length < 7) {
		tmp += str.substr(0, 3);
		tmp += '-';
		tmp += str.substr(3);
		$(this).val(tmp);
	} else if (str.length < 11) {
		tmp += str.substr(0, 3);
		tmp += '-';
		tmp += str.substr(3, 3);
		tmp += '-';
		tmp += str.substr(6);
		$(this).val(tmp);
	} else {
		tmp += str.substr(0, 3);
		tmp += '-';
		tmp += str.substr(3, 4);
		tmp += '-';
		tmp += str.substr(7);
		$(this).val(tmp);
	}

	var param = {
		tel : $(this).val(),
		id : $('#id').html(),
		lvl : this.id
	};
	if ($(this).val().length == 13) {
		ajaxUtils.doPostText('/member/telCheck.do', param, telCheck);
	}
}

function telCheck(dataList) {
	var data = dataList;
	var jsonObj = JSON.parse(data);
	$('#telCheck').val(jsonObj.tel)

	if (jsonObj.tel == 0) {
		// 닉네임 중복X 폰트 파란색
		
	} else {
		// 닉네임 중복O 폰트 빨간색
	}
}

// 닉네임 변경 시
function onNicName() {
	var param = {
		nic : $(this).val(),
		id : $('#id').html(),
		lvl : this.id
	};

	ajaxUtils.doPostText('/member/nicCheck.do', param, nicCheck);

}

function nicCheck(dataList) {

	var data = dataList;
	var jsonObj = JSON.parse(data);
	$('#nicCheck').val(jsonObj.nic)
	if(document.location.href == "http://localhost:8880/Member/memberInsert.jsp" || document.location.href == "http://192.168.58.190:8880/Member/memberInsert.jsp"){
		var element = document.getElementById("insertNic");
	}else{
		var element = document.getElementById("nic");
	}
	
	
	console.log(element)
	if (jsonObj.nic == 0) {
		// 닉네임 중복X 폰트 파란색
		//$('#nicCheck').style("color : red");
		
		element.style.color = "blue";
	} else {
		// 닉네임 중복O 폰트 빨간색
		//$('#nicCheck').style("color : red");
		element.style.color = "red";
	}

}
function onPassword() {
	var status = this.id

	if (status == 'pw1' || status == 'pw2') {

		var pw1 = $('#pw1').val();
		var pw2 = $('#pw2').val();
		var lblPW = $('#lblPW');
		var passRule = /^[A-Za-z0-9]{6,12}$/;// 숫자와 문자 포함 형태의 6~12자리 이내의 암호
		// 정규식

		if (pw1 == "" || pw2 == "") {
			lblPW.html("비밀번호를 입력해주세요");
		} else if (pw1 != pw2) {
			lblPW.html("비밀번호 불일치");

		} else if (passRule.test($('#pw1').val())
				&& passRule.test($('#pw2').val())) {
			lblPW.html("사용가능");
		} else {
			lblPW.html("숫자와 문자 포함 형태의 6~12자리 이내의 비밀번호만 사용 가능합니다.");
		}
	} else if (status == 'insertPw1' || status == 'insertPw2') {
		var pw1 = $('#insertPw1').val();
		var pw2 = $('#insertPw2').val();
		var lblPW = $('#lblPW');
		var passRule = /^[A-Za-z0-9]{6,12}$/;// 숫자와 문자 포함 형태의 6~12자리 이내의 암호
		// 정규식

		if (pw1 == "" || pw2 == "") {
			lblPW.html("비밀번호를 입력해주세요");
		} else if (pw1 != pw2) {
			lblPW.html("비밀번호 불일치");

		} else if (passRule.test($('#insertPw1').val())
				&& passRule.test($('#insertPw2').val())) {
			lblPW.html("사용가능");
		} else {
			lblPW.html("숫자와 문자 포함 형태의 6~12자리 이내의 비밀번호만 사용 가능합니다.");
		}
	}
}
function onPassword2() {
	var status = this.id

	if (status == 'pw1' || status == 'pw2') {

		var pw1 = $('#insertPw1').val();
		var pw2 = $('#insertPw2').val();
		var lblPW = $('#lblPW');
		var passRule = /^[A-Za-z0-9]{6,12}$/;// 숫자와 문자 포함 형태의 6~12자리 이내의 암호
		// 정규식

		if (pw1 == "" || pw2 == "") {
			lblPW.html("비밀번호를 입력해주세요");
		} else if (pw1 != pw2) {
			lblPW.html("비밀번호 불일치");

		} else if (passRule.test($('#pw1').val())
				&& passRule.test($('#pw2').val())) {
			lblPW.html("사용가능");
		} else {
			lblPW.html("숫자와 문자 포함 형태의 6~12자리 이내의 비밀번호만 사용 가능합니다.");
		}
	} else if (status == 'insertPw1' || status == 'insertPw2') {
		var pw1 = $('#insertPw1').val();
		var pw2 = $('#insertPw2').val();
		var lblPW = $('#lblPW');
		var passRule = /^[A-Za-z0-9]{6,12}$/;// 숫자와 문자 포함 형태의 6~12자리 이내의 암호
		// 정규식

		if (pw1 == "" || pw2 == "") {
			lblPW.html("비밀번호를 입력해주세요");
		} else if (pw1 != pw2) {
			lblPW.html("비밀번호 불일치");

		} else if (passRule.test($('#insertPw1').val())
				&& passRule.test($('#insertPw2').val())) {
			lblPW.html("사용가능");
		} else {
			lblPW.html("숫자와 문자 포함 형태의 6~12자리 이내의 비밀번호만 사용 가능합니다.");
		}
	}
}

function clickedBtnUpdateUserInfo() {
	var passRule = /^[A-Za-z0-9]{6,12}$/;// 숫자와 문자 포함 형태의 6~12자리 이내의 암호 정규식

	if ($('#pw1').val() != $('#pw2').val()) {
		alert("비밀번호를 확인해주세요");

	} else if (!passRule.test($('#pw1').val()) && $('#pw1').val() != "") {
		alert("비밀번호는  숫자와 문자 포함 형태의 6~12자리 이내로만 가능합니다.");

	} else if ($('#nic').val() == "") {
		alert("닉네임을 입력해 주세요.");

	} else if ($('#nicCheck').val() == "1") {
		alert("중복된 닉네임 입니다. 다른 닉네임을 입력해주세요.");

	} else if ($('#tel').val() == "") {
		alert("전화번호를 입력해 주세요.");

	} else if ($('#tel').val().length != 13) {
		alert("전화번호를 입력해 주세요.");

	} else if ($('#telCheck').val() == "1") {
		alert("중복된 중복된 전화번호입니다. 다른 전화번호를 입력해주세요.");
	} else {

		var info = {
			id : $('#id').html(),
			pw1 : $('#pw1').val(),
			tel : $('#tel').val(),
			nic : $('#nic').val()

		}

		console.log("함수");
		ajaxUtils.doPostText('/member/updateInfo.do', info, clickBtnPwCheck);
	}

}


function clickBtnPwCheck(dataList) {

	var jsonObj = JSON.parse(dataList);
	console.log("변경");
	alert("변경되었습니다.");

	var data = dataList;

	var jsonObj = JSON.parse(data);

	location.href = "/index.jsp";
}





/*
 * <div class="card-header">Header</div> <div class="card-body">
 * <h5 class="card-title">Primary card title</h5> <p class="card-text">Some
 * quick example text to build on the card title and make up the bulk of the
 * card's content.</p> </div>
 * 
 */

function myBoardList(dataList) {
	try {
		var jsonObj = JSON.parse(dataList);
	} catch (e) {
		var jsonObj = dataList;
	}

	// var data = JSON.parse(dataList);

	$('#t1').html('');
	$('#PageWrap').html('');
	var keyList = [ '#', 'BOARD_NO', 'BOARD_CATE', 'BOARD_TITLE', 'BOARD_CNT',
			'BORDER_DATE' ];
	var key = '';

	if (jsonObj.list) {
		// if(true){
		if (jsonObj.list.length > 0) {
			// if(true){
			for (var i = 0; i < jsonObj.list.length; i++) {
				var thead = $("<><>");
				var tr = $("<tr></tr>");

				for (var j = 0; j < keyList.length; j++) {
					var td = $("<td></td>");

					if (j == 0) {
						td.append(jsonObj.list[i]["RNUM"]);
					} else {
						key = keyList[j];
						td.append(jsonObj.list[i][key]);
					}
					td.appendTo(tr);
				}
				tr.appendTo('#t1');
			}
			var pageInfo = {
					pageNo : jsonObj.page[0].currPage,
					totalCount : jsonObj.page[0].cnt,
					offset : 10,
					pages : 10
				};
				paging(pageInfo, 'PageWrap');
		}
		
	}

	
}

function myReservList(dataList) {
	
	try {
		var jsonObj = JSON.parse(dataList);
	} catch (e) {
		var jsonObj = dataList;
	}
	console.log(jsonObj);

	// var data = JSON.parse(dataList);

	$('#t2').html('');
	$('#PageWrap').html('');
	var keyList = [ 'RESERV_NO', 'ROOM_LEV', 'ROOM_NO', 'IN_DATE', 'DAT',
			'RESERV_DATE', 'DEPOSIT' ];
	var key = '';

	if (jsonObj.list) {
		// if(true){
		if (jsonObj.list.length > 0) {
			// if(true){
			for (var i = 0; i < jsonObj.list.length; i++) {
				var thead = $("<><>");
				var tr = $("<tr></tr>");

				for (var j = 0; j < keyList.length; j++) {
					var td = $("<td></td>");
					key = keyList[j];
					td.append(jsonObj.list[i][key]);
					td.appendTo(tr);
				}
				tr.appendTo('#t2');
			}
			var pageInfo = {
					pageNo : jsonObj.page[0].currPage,
					totalCount : jsonObj.page[0].cnt,
					offset : 10,
					pages : 10
				};
				
				paging(pageInfo, 'PageWrap');
		}
		
	}

}


function clicedkManagerMenu(){
	var tr = $(this)
	var td = tr.children();
	console.log("매니저");
	
	var menu =  td.eq(0).text();
	searchParam = {
			currPage : 1,
			startIndex : (1 - 1) * 10 + 1,
			lastIndex : (1 - 1) * 10 + 10
		};
	if(menu == '회원관리'){
		
		
		ajaxUtils.doPostText('/member/memberInfoList.do', searchParam, memberInfoList);
	}else if(menu == '객실관리'){

		ajaxUtils.doPostText('/member/roomLvlList.do', searchParam, roomLvlList);
	}
		
}


function roomLvlList(dataList){
	try {
		var jsonObj = JSON.parse(dataList);
	} catch (e) {
		var jsonObj = dataList;
	}
	

	$('#th4').html('');
	$('#t4').html('');
	$('#th3').html('');
	$('#t3').html('');
	$('#th6').html('');
	$('#t6').html('');
	$('#th7').html('');
	$('#t7').html('');
	$('#th8').html('');
	$('#t8').html('');
	$('#PageWrap').html('');
	
	$('#roomInsert').html('');
	$('#roomInsert2').html('');

	var btn = $("<input type='button'  class='btn btn-primary' id='insertRoomLvl' value = '추가'>");
	btn.appendTo('#roomInsert');
	
	// var data = JSON.parse(dataList);
	$('#th5').html('');
	var thtr = $("<tr></tr>");
	var th1 = $("<th scope='col'class='text-center'></th>");
	th1.append('#');
	th1.appendTo(thtr);
	var th2 = $("<th scope='col'class='text-center'></th>");
	th2.append('RoomLvl');
	th2.appendTo(thtr);
	var th3 = $("<th scope='col'class='text-center'></th>");
	th3.append('Price');
	th3.appendTo(thtr);
	
	
	

	thtr.appendTo('#th5');
	
	
	$('#t5').html('');
	
	var keyList = [ '#','ROOM_LEV','ROOM_PRICE'];
	var key = '';

	if (jsonObj.list) {
		// if(true){
		if (jsonObj.list.length > 0) {
			// if(true){
			for (var i = 0; i < jsonObj.list.length; i++) {
				var thead = $("<><>");
				var tr = $("<tr></tr>");

				for (var j = 0; j < keyList.length; j++) {
					var td = $("<td></td>");

					if (j == 0) {
						td.append(jsonObj.list[i]["RNUM"]);
					} else {
						key = keyList[j];
						td.append(jsonObj.list[i][key]);
					}
					td.appendTo(tr);
				}
				tr.appendTo('#t5');
			}
			var pageInfo = {
					pageNo : jsonObj.page[0].currPage,
					totalCount : jsonObj.page[0].cnt,
					offset : 10,
					pages : 10
				};
			
				paging(pageInfo, 'PageWrap');
		}
		
	}
}

function memberInfoList(dataList) {
	try {
		var jsonObj = JSON.parse(dataList);
	} catch (e) {
		var jsonObj = dataList;
	}
	
	$('#th4').html('');
	$('#t4').html('');
	$('#th5').html('');
	$('#t5').html('');
	$('#th6').html('');
	$('#t6').html('');
	$('#th7').html('');
	$('#t7').html('');
	$('#th8').html('');
	$('#t8').html('');
	$('#PageWrap').html('');
	
	$('#roomInsert').html('');
	$('#roomInsert2').html('');
	// var data = JSON.parse(dataList);
	$('#th3').html('');
	var thtr = $("<tr></tr>");
	var th1 = $("<th scope='col'class='text-center'></th>");
	th1.append('#');
	th1.appendTo(thtr);
	var th2 = $("<th scope='col'class='text-center'></th>");
	th2.append('아이디');
	th2.appendTo(thtr);
	var th3 = $("<th scope='col'class='text-center'></th>");
	th3.append('가입일');
	th3.appendTo(thtr);
	var th4 = $("<th scope='col'class='text-center'></th>");
	th4.append('상태');
	th4.appendTo(thtr);
	var th5 = $("<th scope='col'class='text-center'></th>");
	th5.append('게시글');
	th5.appendTo(thtr);
	var th6 = $("<th scope='col'class='text-center'></th>");
	th6.append('덧글');
	th6.appendTo(thtr);
	var th7 = $("<th scope='col'class='text-center'></th>");
	th7.append('예약수');
	th7.appendTo(thtr);
	var th8 = $("<th scope='col'class='text-center'></th>");
	th8.append('예약 총 금액(결제완료)');
	th8.appendTo(thtr);
	var th9 = $("<th scope='col'class='text-center'></th>");
	th9.append('선택');
	th9.appendTo(thtr);
	
	

	thtr.appendTo('#th3');
	
	
	$('#t3').html('');
	var keyList = [ '#', 'USER_ID', 'USER_JOIN','USER_LVL', 'BOARD_CNT', 'CMM_CNT','RESERV_CNT','TOTAL_PRICE','선택' ];
	var key = '';

	if (jsonObj.list) {
		// if(true){
		if (jsonObj.list.length > 0) {
			// if(true){
			for (var i = 0; i < jsonObj.list.length; i++) {
				var thead = $("<><>");
				var tr = $("<tr></tr>");

				for (var j = 0; j < keyList.length; j++) {
					var td = $("<td></td>");

					if (j == 0) {
						td.append(jsonObj.list[i]["RNUM"]);
						
					
					
					} else if(j == 8){
						//td.append('');
						
						var id = jsonObj.list[i].USER_ID;
						var status = jsonObj.list[i].USER_LVL;
						var a = $("<a href='javascript:uptateStatus(\"" + id + "\", \"" + status + "\");' aria-label='Previous'><span aria-hidden='true'>활성/정지</span></a>");
						//var a = $("<a href='javascript:uptateStatus(" + jsonObj.list[i].USER_LVL + ");' aria-label='Previous'><span aria-hidden='true'>활성/정지</span></a>");
						//var a = $("<input type='button' id='uptateStatus' value = '" + jsonObj.list[i].USER_LVL + "' >");
						
						
						//var a = '임시';
						if(jsonObj.list[i].USER_LVL == '관리자'){
							td.append('');
						}else{
							a.appendTo(td);
						}
						
						//td.append(a);
					} else {
						key = keyList[j];
						td.append(jsonObj.list[i][key]);
					}
					td.appendTo(tr);
				}
				tr.appendTo('#t3');
			}
			var pageInfo = {
					pageNo : jsonObj.page[0].currPage,
					totalCount : jsonObj.page[0].cnt,
					offset : 10,
					pages : 10
				};
			
				paging(pageInfo, 'PageWrap');
		}
		
	}

	
}


function uptateStatus(id,status){
	var currPage =  $('#currPage').val();
	var param = {
				id : id ,
				status : status,
				currPage : currPage,
				startIndex : (currPage - 1) * 10 + 1,
				lastIndex : (currPage - 1) * 10 + 10
	}
	ajaxUtils.doPostText('/member/updateStatus.do',param,ajaxUpdateStatus);
	
	
}


function ajaxUpdateStatus(dataList){
	memberInfoList(dataList)
}


function clickedBtnInsertRoomLvl(){
	console.log("sss");
	
	
	//$('#roomInsertForm').html('');
	/*var btn = $("<input type='button'  class='btn btn-primary' id='insertRoomLvl' value = '추가'>");*/
	
	
	// var data = JSON.parse(dataList);
	$('#th4').html('');
	
	var thtr = $("<tr></tr>");
	var th1 = $("<th scope='col'class='text-center'></th>");
	th1.append('RoomLvl');
	th1.appendTo(thtr);
	var th2 = $("<th scope='col'class='text-center'></th>");
	th2.append('Price');
	th2.appendTo(thtr);
	var th3 = $("<th scope='col'class='text-center'></th>");
	th3.append('Image');
	th3.appendTo(thtr);
	var th4 = $("<th scope='col'class='text-center'></th>");
	th4.append('추가');
	th4.appendTo(thtr);
	
	
	

	thtr.appendTo('#th4');
	
	
	$('#t4').html('');
	var tr = $("<tr></tr>");
	
	/*var RoomLvl = $("<td><input type= 'text' id='roomLvl'></td>");
	RoomLvl.appendTo(tr);
	var Price = $("<td><input type='text' id='roomPrice'></td> ");
	Price.appendTo(tr);
	
	var btnInsert = $("<input type= 'button' id='btnInsertRoom' value = '추가'> ");
	
	var btn = $("<td><a href='javascript:insertRoomLvl();' aria-label='Previous'><span aria-hidden='true'>추가</span></a></td>");
	btn.appendTo(tr);*/
	
	var RoomLvl = $("<td><input type='text' id='roomLvl' name='roomLvl'></td>");
	RoomLvl.appendTo(tr);
	var Price = $("<td><input type='text' id='roomPrice' name='roomPrice'></td> ");
	Price.appendTo(tr);
	var pic = $("<td><input type='file' name='fileName' id='fileName'></td> ");
	pic.appendTo(tr);
	/*var btnInsert = $("<input type= 'button' id='btnInsertRoom' value = '추가'> ");*/
	
	//var btn = $("<td><a href='javascript:insertRoomLvl();' aria-label='Previous'><span aria-hidden='true'>추가</span></a></td>");
	var btn = $("<td><input type ='submit' value='추가'></td>");
	btn.appendTo(tr);
	
	
	tr.appendTo('#t4');
	
}




function insertRoomLvl(){
	var roomLvl = $('#roomLvl').val();
	var roomPrice = $('#roomPrice').val();
	var roomPic = $('#pic').val();
	console.log(roomLvl);
	console.log(roomPrice);
	console.log(pic);
	var param = {
			roomLvl : roomLvl,
			roomPrice : roomPrice,
			roomPic : roomPic
	}
	
	ajaxUtils.doPostText('/member/insertRoomLvl.do',param,ajaxInsertRoomLvl);

}


function ajaxInsertRoomLvl(dataList){
	console.log(dataList);
	
	
	searchParam = {
			currPage : 1,
			startIndex : (1 - 1) * 10 + 1,
			lastIndex : (1 - 1) * 10 + 10
		};
	if(dataList == 1){
		ajaxUtils.doPostText('/member/roomLvlList.do', searchParam, roomLvlList);
	}else{
		alert("이미 있는 이름이거나 가격이 잘못입력되었습니다. \n 다시 입력해주세요.");
	}
}


function clicedkRoomClassList(){
	
	var tr = $(this);
	var td = tr.children();
	var currPage = 1;
	var param = {
		RoomLvl : td.eq(1).text(),
		currPage : currPage,
		startIndex : (currPage - 1) * 10 + 1,
		lastIndex : (currPage - 1) * 10 + 10
		
	};
	if (param.RoomLvl != 'RoomLvl') {
		ajaxUtils.doPostText('/member/RoomDetailFrom.do', param, RoomDetailFrom);
	}
}

function RoomDetailFrom(dataList){
	try {
		var jsonObj = JSON.parse(dataList);
	} catch (e) {
		var jsonObj = dataList;
	}
	
	console.log(jsonObj.lev);
	
	$('#th4').html('');
	$('#t4').html('');
	$('#th5').html('');
	$('#t5').html('');
	$('#roomInsert').html('');
	$('#roomInsert2').html('');

	$('#th8').html('');
	$('#t8').html('');
	$('#PageWrap').html('');
	
	
	$('#th7').html('');
	var thtr = $("<tr></tr>");
	var th1 = $("<th scope='col' class='text-center'></th>");
	th1.append('객실 등급');
	th1.appendTo(thtr);
	var th2 = $("<th scope='col'class='text-center'></th>");
	
	thtr.appendTo('#th7');
	
	
	
	$('#t7').html('');
	var tr = $("<tr></tr>");
	
	
	var RoomLvl = $("<td><label id='RoomLvl'>" + jsonObj.lev + "</label></td>");
	RoomLvl.appendTo(tr);
	
	

	
	tr.appendTo('#t7');
	
	
	$('#th6').html('');
	var thtr = $("<tr></tr>");
	var th1 = $("<th scope='col' class='text-center'></th>");
	th1.append('#');
	th1.appendTo(thtr);
	var th2 = $("<th scope='col' class='text-center'></th>");
	th2.append('호수');
	th2.appendTo(thtr);

	
	
	thtr.appendTo('#th6');
	
	$('#roomInsert').html('');
	var btn = $("<input type='button'  class='btn btn-primary' id='insertRoom' value = '추가'>");
	btn.appendTo('#roomInsert2');
	
	
	
	
	
	
	

	thtr.appendTo('#th6');
	
	
	$('#t6').html('');
	var keyList = [ '#', 'roomNo'];
	var key = '';
	console.log(jsonObj.list);
	if (jsonObj.list) {
		// if(true){
		if (jsonObj.list.length > 0) {
			// if(true){
			for (var i = 0; i < jsonObj.list.length; i++) {
				var thead = $("<><>");
				var tr = $("<tr></tr>");

				for (var j = 0; j < keyList.length; j++) {
					var td = $("<td></td>");

					if (j == 0) {
						td.append(jsonObj.list[i]["RNUM"]);
						
					} else {
						key = keyList[j];
						td.append(jsonObj.list[i][key]);
					}
					td.appendTo(tr);
				}
				tr.appendTo('#t6');
			}
			var pageInfo = {
					pageNo : jsonObj.page[0].currPage,
					totalCount : jsonObj.page[0].cnt,
					offset : 10,
					pages : 10
				};
			
				paging(pageInfo, 'PageWrap');
		}
		
	}

	
	
	
	
}


function clickedBtnInsertRoom(){
	console.log("sss");
	
	
	/**/
	
	
	
	
	
	$('#th8').html('');
	
	var thtr = $("<tr></tr>");
	var th1 = $("<th scope='col' class='text-center'></th>");
	th1.append('호수');
	th1.appendTo(thtr);
	var th2 = $("<th scope='col' class='text-center'></th>");
	th2.append('추가');
	th2.appendTo(thtr);
	
	
	

	thtr.appendTo('#th8');
	
	
	$('#t8').html('');
	var tr = $("<tr></tr>");
	

	
	var room = $("<td><input type='text' id='room'></td> ");
	room.appendTo(tr);
	
	
	
	var btn = $("<td><a href='javascript:insertRoom();' aria-label='Previous'><span aria-hidden='true'>추가</span></a></td>");
	btn.appendTo(tr);
	
	
	tr.appendTo('#t8');
	
}

function insertRoom(){
	var roomlvl = $('#RoomLvl').html();
	console.log(roomlvl);
	var room = $('#room').val();
	
	var param = {
			roomlvl : roomlvl,
			room : room
	}
	
	ajaxUtils.doPostText('/member/insertRoom.do',param,ajaxInsertRoom);
}


function ajaxInsertRoom(dataList){
	if(dataList == 1){
		console.log("성공");
		
	}else if(dataList == 0){
		console.log("실패");
	}
	
	
	searchParam = {
			RoomLvl : $('#RoomLvl').html(),
			currPage : 1,
			startIndex : (1 - 1) * 10 + 1,
			lastIndex : (1 - 1) * 10 + 10
		};
	if(dataList == 1){
		ajaxUtils.doPostText('/member/RoomDetailFrom.do', searchParam, RoomDetailFrom);
	}else{
		alert("이미 있는 이름이거나 잘못된 이름입니다.\n 다시 입력해주세요.");
	}
	
	
	
}




function page(page) {
	searchParam.currPage = page;
	searchParam.startIndex = (page - 1) * 10 + 1;
	searchParam.lastIndex = (page - 1) * 10 + 10;
	
	
	if(document.location.href == "http://localhost:8880/Member/myBoard.jsp" || document.location.href == "http://192.168.58.190:8880/Member/myBoard.jsp"){
		ajaxUtils.doPost('/member/myBoardList.do', searchParam, myBoardList);
	}else if(document.location.href == "http://localhost:8880/Member/myReservList.jsp" || document.location.href == "http://192.168.58.190:8880/Member/myReservList.jsp"){
		ajaxUtils.doPostText('/member/myReservList.do',	searchParam, myReservList);
	}else if(document.location.href == "http://localhost:8880/Member/managerPage.jsp" || document.location.href == "http://192.168.58.190:8880/Member/managerPage.jsp"){
		
		var table3 = $('#th3').html();
		var table5 = $('#th5').html();
		var table6 = $('#th6').html();
		
		
		
		
		
		if(table3 != ''){
			console.log(table3);
			ajaxUtils.doPostText('/member/memberInfoList.do',searchParam, memberInfoList);
		}else if(table5 != ''){
			console.log(table5);
			ajaxUtils.doPostText('/member/roomLvlList.do', searchParam, roomLvlList);
		}else if(table6 != ''){
			console.log(table6);
			
			searchParam.RoomLvl = $('#RoomLvl').html();
			ajaxUtils.doPostText('/member/RoomDetailFrom.do', searchParam, RoomDetailFrom);
		}
		
		
		
		
	}
	
	
}








function paging(pageInfo, tagName) {
	var info = pageInfo;
	$("#" + tagName).html('');

	var currPage = info.pageNo;
	var offset = info.offset;

	var totalPage = Math.ceil(info.totalCount / offset);
	var pageOffset = info.pages;

	var firstPage = Math.floor((currPage - 1) / pageOffset) * pageOffset + 1;
	var lastPage = Math.floor((currPage - 1) / pageOffset) * pageOffset
			+ pageOffset;
	var currPageCnt = Math.ceil(currPage / pageOffset);
	var lastPageCnt = Math.ceil((totalPage) / pageOffset);
	var nextPage = lastPage + 1;
	var prevPage = firstPage - 1;

	if (lastPage > totalPage)
		lastPage = totalPage;

	var first = $("<li></li>")
	if (currPage == 1) { // 현재페이지가 첫페이지면 << 버튼 클릭 비활성화
		first.addClass('disabled');
	}
	var a = $("<a href='javascript:page(1);' aria-label='Previous'><span aria-hidden='true'>«</span></a>");
	a.appendTo(first);
	first.appendTo('#' + tagName);

	if (currPage > pageOffset) { // 현재 페이지가 첫 페이지 리스트일 때 < 비활성화
		var prev = $("<li></li>")

		// prev.addClass('disabled');

		var a = $("<a href='javascript:page("
				+ prevPage
				+ ");' aria-label='Previous'><span aria-hidden='true'>＜</span></a>");
		a.appendTo(prev);
		prev.appendTo('#' + tagName);
	}
	for (var i = firstPage; i <= lastPage; i++) { // 현재 페이지갯수 만큼 리스트 표출
		var li = $("<li></li>");
		if (currPage == i)
			li.addClass("active");
		var a = $("<a href='javascript:page(" + i + ");'></a>");
		a.append(i);
		a.appendTo(li);
		li.appendTo("#" + tagName);
	}
	if (currPageCnt < lastPageCnt) { // 현재 페이지 리스트가 마지막 페이지 리스트보다 작을 때

		var next = $("<li></li>")
		// next.addClass('disabled');
		var a = $("<a href='javascript:page("
				+ nextPage
				+ ");' aria-label='Previous'><span aria-hidden='true'>＞</span></a>");
		a.appendTo(next);
		next.appendTo('#' + tagName);
	}

	var last = $("<li></li>")
	if (currPage == totalPage) {
		last.addClass('disabled');
	}
	var a = $("<a href='javascript:page(" + totalPage
			+ ");' aria-label='Previous'><span aria-hidden='true'>»</span></a>");
	a.appendTo(last);
	last.appendTo('#' + tagName);
	
	var hidden = $("<input type='hidden'  id = 'currPage' value= " + currPage + ">");
	hidden.appendTo('#' + tagName);

};
