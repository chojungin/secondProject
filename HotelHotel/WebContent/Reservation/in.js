$("#RoomTable tr").click(
			function () {

				var str = ""
				var tdArr = new Array(); // 배열 선언

				// 현재 클릭된 Row(<tr>)
				var tr = $(this);
				var td = tr.children();

				// tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
				console.log("클릭한 Row의 모든 데이터 : " + tr.text());

				// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
				td.each(function(i) {
					tdArr.push(td.eq(i).text());
				});

				console.log("배열에 담긴 값 : " + tdArr);

				// td.eq(index)를 통해 값을 가져올 수도 있다.
				var room_no = td.eq(0).text();
				var room_lev = td.eq(1).text();

				str += " * 클릭된 Row의 td값 = No. : <font color='red'>" + room_no
						+ "</font>" + ", Class : <font color='red'>" + room_lev
						+ "</font>"

				$("#ex1_Result1").html(" * 클릭한 Row의 모든 데이터 = " + tr.text());
				$("#ex1_Result2").html(str);
			});
	$("tr#info").click(function(){        //function_tr 
		  $(this).css("background-color","yellow"); 
		}); 


$(document).ready(function() {

   ajaxUtils = ajaxUtil();
   

   // initSelectOptions();

   /*
    * $(document).on('click', '#btnSearchGogak', clickedBtnSearchGogak);
    */

   $(document).delegate('#example-table-1 tr', 'click', clickedEmployeeList);

   searchParam = {
      currPage : 1,
      startIndex : (1 - 1) * 10 + 1,
      lastIndex : (1 - 1) * 10 + 10
   };

   ajaxUtils.doPost('userInfoCheck.do', searchParam, employeeList);

});

function clickedEmployeeList() {
   console.log(this);
   var tr = $(this);
   var td = tr.children();
   var employeeId = {
      employeeId : td.eq(1).text()
   };
   if (employeeId != '사번') {
      console.log(employeeId);
      ajaxUtils.doPost('employeeProfile.do', employeeId, employeeProfile);
   }
}

function employeeProfile(dataList) {
   $('#profile').html('');
   var d1 = $("<div></div>");
   d1.addClass("card-header");
   d1.append(dataList.map['직업']);
   d1.appendTo('#profile');
   var d2 = $("<div></div>");
   d2.addClass("card-body");
   d2.appendTo('#profile');
   var h1 = $("<h5></h5>");
   h1.addClass('card-title');
   h1.append(dataList.map['이름']);
   h1.appendTo(d2);
   var p1 = $("<p></p>");
   p1.addClass("card-text");
   p1.append("부서 : " + dataList.map['부서'] + "<br>연봉 : " + dataList.map['연봉']
         + "<br>보너스(%) : " + dataList.map['보너스(%)'] + "<br>실수령액 : "
         + dataList.map['실수령액'] + "<br>이전 부서 : " + dataList.map['이전 부서']
         + "<br>부서 평균 연봉 : " + dataList.map['부서 평균 연봉'] + "<br>부서별최소연봉 : "
         + dataList.map['부서별최소연봉'] + "<br>부서별최대연봉 : "
         + dataList.map['부서별최대연봉'] + "<br>연봉검사 : " + dataList.map['연봉검사']
         + "<br>부서장 : " + dataList.map['부서장'] + "<br>관리자 : "
         + dataList.map['관리자']);
   p1.appendTo(d2);

}

/*
 * <div class="card-header">Header</div> <div class="card-body">
 * <h5 class="card-title">Primary card title</h5> <p class="card-text">Some
 * quick example text to build on the card title and make up the bulk of the
 * card's content.</p> </div>
 * 
 */

function employeeList(dataList) {

   $('#t1').html('');
   var keyList = [ '#', 'EMPLOYEE_ID', 'DEPARTMENT_NAME', 'FIRST_NAME' ];
   if (dataList.list) {
      // if(true){
      if (dataList.list.length > 0) {
         // if(true){
         for (var i = 0; i < dataList.list.length; i++) {
            /* var thead = $("<><>"); */
            var tr = $("<tr></tr>");

            for (var j = 0; j < keyList.length; j++) {
               var td = $("<td></td>");

               if (j == 0) {
                  td.append(dataList.list[i]["RNUM"]);
               } else {

                  td.append(dataList.list[i][keyList[j]]);
               }
               td.appendTo(tr);
            }
            tr.appendTo('#t1');
         }

      }
   }

   var pageInfo = {
      pageNo : dataList.currPage,
      totalCount : dataList.cnt,
      offset : 10,
      pages : 10
   };
   paging(pageInfo, 'PageWrap');
}

function page(page) {
   searchParam.currPage = page;
   searchParam.startIndex = (page - 1) * 10 + 1;
   searchParam.lastIndex = (page - 1) * 10 + 10;
   ajaxUtils.doPost('userInfoCheck.do', searchParam, employeeList);
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

};



