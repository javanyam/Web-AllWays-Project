<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추가상품 추가</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="managerstyle.css">
<style>
div{
	padding:1%;
}
</style>
<script>
	function previewFile() {
		  var preview = document.querySelector('img');
		  var file = document.querySelector('input[type=file]').files[0];
		  var reader = new FileReader();

		  reader.addEventListener(
		    'load',
		    function () {
		      preview.src = reader.result;
		    },
		    false
		  );

		  if (file) {
		    reader.readAsDataURL(file);
		  }
		}
	
	function submitDo(){
		var form=document.actionForm;
		if (form.checkName.value=="true"){
			alert("추가가 완료되었습니다");
			form.submit();
		} else{
			alert("이름 중복체크를 해 주세요.");
			return;
		}
	}
	
	function nameCheck(){
		var form=document.actionForm;
		if (form.goodsName.value==""){
			alert("추가상품 이름을 입력하세요");
			return;
		} else{
			form.action="checkGoodsName.do";
			form.submit();
		}
	}
</script>
</head>
<body>
<%@include file="managerHeader.jsp"%>
<div align="center">
<form action="addGoods.do" method="post" enctype="multipart/form-data" name="actionForm">
	<h1 style="margin-bottom:3%;margin-top:3%"><b>추가상품 추가</b></h1>
	<div style="display: inline-block;width:60%">
		<div align="left" style="width:20%;display:inline-block">
			추가상품 이름
		</div>
		<div align="left" style="width:74%;display:inline-block">
			<div style="width:50%;display:inline-block">
				<input type="hidden" name="checkName" value="${check }">
				<c:if test="${check==null }">
					<input type="text" name="goodsName" class="form-control" style="border-color:#fdcdcd">
				</c:if>
				<c:if test="${check==true }">
					<script>alert("사용 가능한 이름입니다.");</script>
					<input type="text" name="goodsName" class="form-control is-valid" style="border-color:#fdcdcd" value="${goodsName }">
				</c:if>
				<c:if test="${check==false }">
					<script>alert("이미 사용중인 이름입니다.");</script>
					<input type="text" name="goodsName" class="form-control is-invalid" style="border-color:#fdcdcd" value="${goodsName }">
				</c:if>
			</div>
			<div style="display:inline-block">
				<input type="button" class="btn" style="background:#ffcfcf;border-color:#a87878;color:#a87878" value="중복체크" onclick="nameCheck()">
			</div>
		</div>
		<div align="left" style="width:20%;display:inline-block">
			카테고리
		</div>
		<div align="left" style="width:74%;display:inline-block">
			<div style="width:30%;display:inline-block">
				<select name="goodsCategory" style="border-color:#fdcdcd;border-radius:10px;height:90%">
					<option value="초">초</option>
					<option value="풍선">풍선</option>
					<option value="폭죽">폭죽</option>
					<option value="고깔모자">고깔모자</option>
				</select>
			</div>
		</div>
		<div align="left" style="width:20%;display:inline-block">
			가격
		</div>
		<div align="left" style="width:74%;display:inline-block">
			<div style="width:30%;display:inline-block">
				<input type="text" name="goodsPrice" class="form-control" style="border-color:#fdcdcd" value="${goodsPrice }">
			</div>원
		</div>
		<div align="left" style="width:20%;height:20%;display:inline-block">
			상품설명
		</div>
		<div align="left" style="width:74%;height:20%;display:inline-block">
			<textarea style="width:100%;margin-top:20px;border-color:#fdcdcd" class="form-control" name="goodsDetail">${goodsDetail }</textarea>
		</div>
		<div align="left" style="width:20%;display:inline-block">
			사진
		</div>
		<div align="left" style="width:74%;display:inline-block">
			<input type="file" name="goodsImage" onchange="previewFile(event)">
		</div>
	</div>
	<div style="display:inline-block;width:30%;height:50%" align="center">
		<div>
			사진 미리보기
		</div>
		<div>
			<img src="" height="200" width="200" style="display:block;margin:20px;border-radius:10px;">
		</div>
		<div>
			<input type="button" class="btn" style="background:#ffcfcf;border-color:#a87878;color:#a87878" value="취소">
			<input type="button" class="btn" style="background:#ffcfcf;border-color:#a87878;color:#a87878" value="추가" onclick="submitDo()">
		</div>
	</div>
</form>
</div>
</body>
</html>