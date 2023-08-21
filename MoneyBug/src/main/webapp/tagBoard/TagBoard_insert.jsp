<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	$('#add_file')
			.click(
					function() {
						$('.file_area')
								.append(
										'<div class="uploadfileform">'
												+ '<input type="file" name="file">'
												+ ' <button type="button" class="delete_file">삭제</button>'
												+ '</div>');
					});
	
	$('.file_area').on('click', '.delete_file', function() {
		$(this).closest('div').remove();
	});
	
	$('#cancel').click(function name() {
		location href="TagBoard_list";
	})
</script>
<script>
	// 폼 제출 시 필수 입력 필드 검사 및 경고창 띄우기
	function validateForm() {
		var title = document.getElementById("title").value;
		var content = document.getElementById("content").value;
		var selectedValue = document.getElementById("boardType").value;

		if (!title) {
			alert("제목을 입력하세요.");
			return false; // 폼 제출 막기
		}

		if (!content) {
			alert("내용을 입력하세요.");
			return false; // 폼 제출 막기
		}

		if (selectedValue === "") {
			alert("말머리를 선택하세요.");
			return false; // 폼 제출 막기
		}

		return true; // 폼 제출 허용
	}
</script>



</head>
<body>
	<h3>커뮤니티 글쓰기</h3>
	<br>

	<form action="TagBoard_insert" id="form" method="post"
		enctype="multipart/form-data" onsubmit="return validateForm();">
		<input type="hidden" name="writerId" value="${socialId }">
		<table>

			<tr>
				<td>제목</td>
				<td><select id="boardType" name="boardType">
						<option value="">말머리</option>
						<option value="#교통">교통</option>
						<option value="#식비">식비</option>
						<option value="#공과금">공과금</option>
				</select> <input name="title" type="text" placeholder=" 제목을 입력하세요.."
					style="width: 507px; height: 25px; font-size: 15px;"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input name="content" type="text"
					placeholder=" 내용을 입력하세요.."
					style="width: 620px; height: 200px; font-size: 15px;"></td>
			</tr>
			<tr>
				<td>첨부파일
					<button type="button" id="add_file">추가</button>
				</td>
				<td class="file_area">
					<div class="uploadfileform">
						<input type="file" name="file">
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button >글 쓰기</button>
					<button id="cancel">취소</button>
				</td>
			</tr>
		</table>
		<!-- 입력한 값들이 서버(톰킷)으로 전달될때는 form태그 안에 있어야 함. -->
		<!-- 보충내용: <input name="data"> -->
	</form>

</body>
</html>