<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Jiwon's Homepage</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/main.css" />
</head>
<body>
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<a href="${pageContext.request.contextPath }/index.jsp"
						class="logo"><strong>Homepage</strong> by JIWON</a>
					<ul class="icons">
						<li><a href="#" class="icon fa-twitter"><span
								class="label">Twitter</span></a></li>
						<li><a href="#" class="icon fa-facebook"><span
								class="label">Facebook</span></a></li>
						<li><a href="#" class="icon fa-snapchat-ghost"><span
								class="label">Snapchat</span></a></li>
						<li><a href="#" class="icon fa-instagram"><span
								class="label">Instagram</span></a></li>
						<li><a href="#" class="icon fa-medium"><span
								class="label">Medium</span></a></li>
					</ul>
				</header>
				<!-- Banner -->
				<section id="banner">
					<div class="content">
						<header>
							<h1>
								Hi, I’m Editorial<br /> by HTML5 UP
							</h1>
							<p>A free and fully responsive site template</p>
						</header>
						<p>Aenean ornare velit lacus, ac varius enim ullamcorper eu.
							Proin aliquam facilisis ante interdum congue. Integer mollis,
							nisl amet convallis, porttitor magna ullamcorper, amet egestas
							mauris. Ut magna finibus nisi nec lacinia. Nam maximus erat id
							euismod egestas. Pellentesque sapien ac quam. Lorem ipsum dolor
							sit nullam.</p>
						<ul class="actions">
							<li><a href="#" class="button big">Learn More</a></li>
						</ul>
					</div>
					<span class="image object"> <img src="images/pic10.jpg"
						alt="" />
					</span>
				</section>
				<!-- Section -->
				<section>
					<header class="major">
						<h2>Erat lacinia</h2>
					</header>
					<div class="features">
						<article>
							<span class="icon fa-diamond"></span>
							<div class="content">
								<h3>Portitor ullamcorper</h3>
								<p>Aenean ornare velit lacus, ac varius enim lorem
									ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed
									nulla amet lorem feugiat tempus aliquam.</p>
							</div>
						</article>
						<article>
							<span class="icon fa-paper-plane"></span>
							<div class="content">
								<h3>Sapien veroeros</h3>
								<p>Aenean ornare velit lacus, ac varius enim lorem
									ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed
									nulla amet lorem feugiat tempus aliquam.</p>
							</div>
						</article>
						<article>
							<span class="icon fa-rocket"></span>
							<div class="content">
								<h3>Quam lorem ipsum</h3>
								<p>Aenean ornare velit lacus, ac varius enim lorem
									ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed
									nulla amet lorem feugiat tempus aliquam.</p>
							</div>
						</article>
						<article>
							<span class="icon fa-signal"></span>
							<div class="content">
								<h3>Sed magna finibus</h3>
								<p>Aenean ornare velit lacus, ac varius enim lorem
									ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed
									nulla amet lorem feugiat tempus aliquam.</p>
							</div>
						</article>
					</div>
				</section>
			</div>
		</div>

		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">

				<!-- Search -->
				<section id="search" class="alt">
					<form method="post" action="#">
						<input type="text" name="query" id="query" placeholder="Search" />
					</form>
				</section>
				<section>
					<c:choose>
						<c:when test="${empty sessionScope.id }">
							<ul class="actions">
								<li><a
									href="${pageContext.request.contextPath}/member/login.do"
									class="button big">login</a></li>
							</ul>
						</c:when>
						<c:otherwise>
							<ul class="actions">
								<li><a
									href="${pageContext.request.contextPath}/member/logout.do"
									class="button big">logout</a></li>
							</ul>
						</c:otherwise>
					</c:choose>
				</section>
				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>Menu</h2>
					</header>
		
					<ul>
						<li><a href="${pageContext.request.contextPath }/index.jsp">Homepage</a></li>
						<c:choose>
							<c:when test="${empty sessionScope.id }">
								<li><a
									href="${pageContext.request.contextPath }/member/agree.do">Join</a></li>
								<li><a
									href="${pageContext.request.contextPath }/member/login.do">Login</a></li>
							</c:when>
							<c:when
								test="${not empty sessionScope.id && sessionScope.grade=='H'}">
								<li><span class="opener">Info</span>
									<ul>
										<li><a
											href="${pageContext.request.contextPath }/member/read.do">MyInfo</a></li>
										<li><a
											href="${pageContext.request.contextPath }/member/update.do">Edit</a></li>
										<li><a
											href="${pageContext.request.contextPath }/member/delete.do">Withdrawal</a></li>
										<li><a
											href="${pageContext.request.contextPath }/member/logout.do">Logout</a></li>
									</ul></li>
							</c:when>
						</c:choose>
						<li><ul>
								<c:if
									test="${not empty sessionScope.id && sessionScope.grade=='A'}">
									<li><a
										href="${pageContext.request.contextPath }/admin/list.do"
										id="admin">Member</a></li>
									<li><a
										href="${pageContext.request.contextPath }/member/logout.do">Logout</a></li>
								</c:if>
							</ul></li>
						<li><span class="opener">Memo</span>
							<ul>
								<li><a
									href="${pageContext.request.contextPath }/memo/create.do">enroll</a></li>
								<li><a
									href="${pageContext.request.contextPath }/memo/list.do">list</a></li>
							</ul></li>
						<li><span class="opener">Address</span>
							<ul>
								<li><a
									href="${pageContext.request.contextPath }/address/create.do">enroll</a></li>
								<li><a
									href="${pageContext.request.contextPath }/address/list.do">list</a></li>
							</ul></li>
						<li><span class="opener">Board</span>
							<ul>
								<li><a
									href="${pageContext.request.contextPath }/bbs/create.do">enroll</a></li>
								<li><a
									href="${pageContext.request.contextPath }/bbs/list.do">list</a></li>
							</ul></li>
						<li><span class="opener">Team</span>
							<ul>
								<li><a
									href="${pageContext.request.contextPath }/team/create.do">enroll</a></li>
								<li><a
									href="${pageContext.request.contextPath }/team/list.do">list</a></li>
							</ul></li>
						<li><span class="opener">Image</span>
							<ul>
								<li><a
									href="${pageContext.request.contextPath }/imgbbs/create.do">enroll</a></li>
								<li><a
									href="${pageContext.request.contextPath }/imgbbs/list.do">list</a></li>
							</ul></li>
					</ul>
				</nav>
				<section>
					<header class="major">
						<h2>Get in touch</h2>
					</header>
					<p>Personal projects</p>
					<ul class="contact">
						<li class="fa-envelope-o"><a href="#">skywldnjs21@google.co.kr</a></li>
						<li class="fa-phone">010.8555.6744</li>
						<li class="fa-home">soldesk<br />
						</li>
					</ul>
				</section>
				<!-- Footer -->
				<!-- Scripts -->
				<script
					src="${pageContext.request.contextPath }/assets/js/jquery.min.js"></script>
				<script
					src="${pageContext.request.contextPath }/assets/js/skel.min.js"></script>
				<script src="${pageContext.request.contextPath }/assets/js/util.js"></script>
				<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
				<script src="${pageContext.request.contextPath }/assets/js/main.js"></script>