<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="js/jquery-3.2.1.min.js" />
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
// ���̺��� Row Ŭ���� �� ��������
$("#example-table-1 tr").click(function(){ 	

	var str = ""
	var tdArr = new Array();	// �迭 ����
	
	// ���� Ŭ���� Row(<tr>)
	var tr = $(this);
	var td = tr.children();
	
	// tr.text()�� Ŭ���� Row �� tr�� �ִ� ��� ���� �����´�.
	console.log("Ŭ���� Row�� ��� ������ : "+tr.text());
	
	// �ݺ����� �̿��ؼ� �迭�� ���� ��� ����� �� �� �ִ�.
	td.each(function(i){
		tdArr.push(td.eq(i).text());
	});
	
	console.log("�迭�� ��� �� : "+tdArr);
	
	// td.eq(index)�� ���� ���� ������ ���� �ִ�.
	var no = td.eq(0).text();
	var userid = td.eq(1).text();
	var name = td.eq(2).text();
	var email = td.eq(3).text();
	
	
	str +=	" * Ŭ���� Row�� td�� = No. : <font color='red'>" + no + "</font>" +
			", ���̵� : <font color='red'>" + userid + "</font>" +
			", �̸� : <font color='red'>" + name + "</font>" +
			", �̸��� : <font color='red'>" + email + "</font>";		
	
	$("#ex1_Result1").html(" * Ŭ���� Row�� ��� ������ = " + tr.text());		
	$("#ex1_Result2").html(str);
});
</script>
<div class="row">
		<table id="example-table-1" width="100%" class="table table-bordered table-hover text-center">
			<thead>
				<tr>
					<th>No. </th>
					<th>���̵�</th>
					<th>�̸�</th>
					<th>�̸���</th>
				</tr>
			</thead>
			<tbody>				
				<tr>
					<td>1</td>
					<td>user01</td>
					<td>ȫ�浿</td>
					<td>hong@gmail.com</td>
				</tr>
				<tr>
					<td>2</td>
					<td>user02</td>
					<td>����</td>
					<td>kim@naver.com</td>
				</tr>
				<tr>
					<td>3</td>
					<td>user03</td>
					<td>��</td>
					<td>John@gmail.com</td>
				</tr>
			</tbody>
		</table>
		<div class="col-lg-12" id="ex1_Result1" ></div> 
		<div class="col-lg-12" id="ex1_Result2" ></div> 
	</div>
</body>
</html>