<%@page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

		<table class="table table-bordered" id="contents">
			<tr class="info alt">
				<td>No</td>
				<td><input type="checkbox" id="checkAll" /></td>
				<td>브랜드</td>
				<td>카테고리</td>
				<td>부품번호</td>
				<td>부품명</td>
				<td>생가</td>
				<td>수량</td>
				<td>총액</td>
			</tr>
<%-- 			<c:forEach items="${selectPart }" var="item" varStatus="status">
				<tr id="tr${item.oid }">
					<td>${item.oid }</td>
					<td><input type="checkbox" id="${item.oid }" name="checkBox" value="${item.oid }" /></td>
					<td>${item.brandCode }</td>
					<td>카테고리</td>
					<td>${item.partsNumber }</td>
					<td>${item.partsNameKo }(${item.partsNameEn })</td>
					<td>${item.price }</td>
					<td>${item.quantity }</td>
					<td>${item.price * item.quantity }원</td>
				</tr>
			</c:forEach>
 --%>
 				<tr id="tr${item.oid }">
					<td>이것은</td>
					<td><input type="checkbox" id="${item.oid }" name="checkBox" value="${item.oid }" /></td>
					<td>가짜로</td>
					<td>만든</td>
					<td>가라</td>
					<td>데이터</td>
					<td>입니다</td>
					<td>두치와</td>
					<td>뿌꾸</td>
				</tr>
							<tr id="tr${item.oid }">
					<td>이것은</td>
					<td><input type="checkbox" id="${item.oid }" name="checkBox" value="${item.oid }" /></td>
					<td>가짜로</td>
					<td>만든</td>
					<td>가라</td>
					<td>데이터</td>
					<td>입니다</td>
					<td>두치와</td>
					<td>뿌꾸</td>
				</tr>
							<tr id="tr${item.oid }">
					<td>이것은</td>
					<td><input type="checkbox" id="${item.oid }" name="checkBox" value="${item.oid }" /></td>
					<td>가짜로</td>
					<td>만든</td>
					<td>가라</td>
					<td>데이터</td>
					<td>입니다</td>
					<td>두치와</td>
					<td>뿌꾸</td>
				</tr>
							<tr id="tr${item.oid }">
					<td>이것은</td>
					<td><input type="checkbox" id="${item.oid }" name="checkBox" value="${item.oid }" /></td>
					<td>가짜로</td>
					<td>만든</td>
					<td>가라</td>
					<td>데이터</td>
					<td>입니다</td>
					<td>두치와</td>
					<td>뿌꾸</td>
				</tr>
							<tr id="tr${item.oid }">
					<td>이것은</td>
					<td><input type="checkbox" id="${item.oid }" name="checkBox" value="${item.oid }" /></td>
					<td>가짜로</td>
					<td>만든</td>
					<td>가라</td>
					<td>데이터</td>
					<td>입니다</td>
					<td>두치와</td>
					<td>뿌꾸</td>
				</tr>
							<tr id="tr${item.oid }">
					<td>이것은</td>
					<td><input type="checkbox" id="${item.oid }" name="checkBox" value="${item.oid }" /></td>
					<td>가짜로</td>
					<td>만든</td>
					<td>가라</td>
					<td>데이터</td>
					<td>입니다</td>
					<td>두치와</td>
					<td>뿌꾸</td>
				</tr>
							<tr id="tr${item.oid }">
					<td>이것은</td>
					<td><input type="checkbox" id="${item.oid }" name="checkBox" value="${item.oid }" /></td>
					<td>가짜로</td>
					<td>만든</td>
					<td>가라</td>
					<td>데이터</td>
					<td>입니다</td>
					<td>두치와</td>
					<td>뿌꾸</td>
				</tr>
							<tr id="tr${item.oid }">
					<td>이것은</td>
					<td><input type="checkbox" id="${item.oid }" name="checkBox" value="${item.oid }" /></td>
					<td>가짜로</td>
					<td>만든</td>
					<td>가라</td>
					<td>데이터</td>
					<td>입니다</td>
					<td>두치와</td>
					<td>뿌꾸</td>
				</tr>
				
		</table>

