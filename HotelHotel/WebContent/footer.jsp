<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<!-- footer -->
<footer class="text-center">
	<a class="up-arrow" href="#myPage" data-toggle="tooltip"
		title="TO TOP"> <span class="glyphicon glyphicon-chevron-up"></span>
	</a>
	<br><br>
	<p>COPYRIGHT © HOTELHOTEL ALL RIGHTS RESERVED.</p>
	<p>COMPANY : (주) NOSUKJA  OWNER : 여인숙</p>
	<p>ADDRESS : 서울특별시 용산구 용산2가동 남산공원길 105</p>
	<p>TEL : 000-1234-5678</p>
	<p>상담가능시간 (10:00~14:00)</p>
	<p>ACCOUNT INFO</p><br>
	<p>우리 1002-222-555999</p>
	<p>예금주 : (주) NOSUKJA 여인숙</p>
	<p style="opacity: 0.05;">
		Bootstrap Theme Made By 
		<a href="https://www.w3schools.com"	data-toggle="tooltip" title="Visit w3schools">
			www.w3schools.com
		</a>
	</p>
</footer>
<script>
	$(document).ready(
			function() {
				// Initialize Tooltip
				$('[data-toggle="tooltip"]').tooltip();

				// Add smooth scrolling to all links in navbar + footer link
				$(".navbar a, footer a[href='#myPage']").on('click',
						function(event) {

							// Make sure this.hash has a value before overriding default behavior
							if (this.hash !== "") {

								// Prevent default anchor click behavior
								event.preventDefault();

								// Store hash
								var hash = this.hash;

								// Using jQuery's animate() method to add smooth page scroll
								// The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
								$('html, body').animate({
									scrollTop : $(hash).offset().top
								}, 900, function() {

									// Add hash (#) to URL when done scrolling (default click behavior)
									window.location.hash = hash;
								});
							} // End if
						});
			})
</script>
</body>
</html>