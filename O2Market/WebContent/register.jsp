<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="Background.css">
<title>ȸ������</title>

<style>
#wrap {
	width: 530px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

table {
	margin-left: auto;
	margin-right: auto;
	border: 3px solid skyblue
}

td {
	border: 1px solid skyblue
}

#title {
	background-color: skyblue
}
</style>
</head>
<body>
	<!-- div ����, ������ �ٱ������� auto�� �ָ� �߾����ĵȴ�.  -->
	<div id="wrap">
		<br>
		<br> <b><font size="6">ȸ������</font></b> <br>
		<br>
		<br>
		<!-- �Է��� ���� �����ϱ� ���� form �±׸� ����Ѵ� -->

		<form name ="f" method="post" >
			<table>
				<tr>
					<td id="title">���̵�</td>
					<td><input type="text" name="id" maxlength="20">
					</td>
				</tr>
				<tr>
					<td id="title">��й�ȣ</td>
					<td><input type="password" name="password" maxlength="15">
					</td>
				</tr>

				<tr>
					<td id="title">��й�ȣ Ȯ��</td>
					<td><input type="password" name="passwordcheck" maxlength="15">
					</td>
				</tr>

				<tr>
					<td id="title">�̸�</td>
					<td><input type="text" name="name" maxlength="40"></td>
				</tr>

	<tr>
					<td id="title">����</td>
					<td><input type="number" name="age" maxlength="3"></td>
				</tr>

				<tr>
					<td id="title">����</td>
					<td><input type="radio" name="gender" value="��" checked>��
						<input type="radio" name="gender" value="��" checked>��</td>
				</tr>


				<tr>
					<td id="title">�̸���</td>
					<td><input type="text" name="email" maxlength="30">@
						<select name="email_2">
							<option>naver.com</option>
							<option>gmail.com</option>

					</select></td>
				</tr>

				<tr>
					<td id="title">�޴���ȭ</td>
					<td><input type="text" name="phone" /></td>
				</tr>

			</table>
			<br> <input type="submit" value="����" onclick ="input_chk()"/> <input type="reset" value="���" onclick="location.href = 'index.jsp'"
				>
		</form>
	</div>
	<script>
    function input_chk(){
    	if(document.f.name.value == ""){
            alert("�̸��� �Է��ϼ���");
            document.f.name.focus();
            return;
        }
       
        if(document.f.id.value == ""){
            alert("���̵� �Է��ϼ���");
            document.f.id.focus();
            return;
        }
       
        if(document.f.password.value == ""){
            alert("�н����带 �Է��ϼ���");
            document.f.pw.focus();
            return;
        } else if (document.f.password.value != document.f.passwordcheck.value){
            alert("��ȣ�� ��ġ���� �ʽ��ϴ�. �ٽ� �Է��ϼ���");
            document.f.pw.value = "";
            document.f.pwc.value = "";
            document.f.pwd.focus();
            return;
        }
   
       
        //��û URL
        document.f.action = "chk_register.jsp";
   		
    }
    </script>
</body>
</html>

