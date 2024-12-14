<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<table>
		<tr>
			<td>
				<input type="radio" class="pay" id="visacard" name="foreignCard">
	    		<label for="visacard"><img src="product/payment/foreignCard/visacard.png"></label>
			</td>
			<td>
			    <input type="radio" class="pay" id="mastercard" name="foreignCard">
			    <label for="mastercard"><img src="product/payment/foreignCard/mastercard.png"></label>
			</td>
			<td>
			    <input type="radio" class="pay" id="jcbcard" name="foreignCard">
			    <label for="jcbcard"><img src="product/payment/foreignCard/jcbcard.png"></label>
			</td>
		</tr>
		<tr>
			<td>
				<input type="radio" class="pay" id="unionpay" name="foreignCard">
	    		<label for="unionpay"><img src="product/payment/foreignCard/unionpay.png"></label>
			</td>
			<td>
			    <input type="radio" class="pay" id="amex" name="foreignCard">
			    <label for="amex"><img src="product/payment/foreignCard/amex.png"></label>
			</td>
			<td></td>
		</tr>
	</table>
</body>
</html>