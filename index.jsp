<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.bmi.HumanBeing, com.bmi.BmiIndexer"%>
<%
    String interpretBMI = null;
	String interpretimagePathBMI = null;
	String interpretdetailsBMI = null;
    double bmi = 0;

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        double weight = Double.parseDouble(request.getParameter("weight"));
        double height = Double.parseDouble(request.getParameter("height"));

        HumanBeing human = new HumanBeing();
        human.setWeight(weight);
        human.setHeight(height);
        human.calculateBmi();

        BmiIndexer bmiIndexer = new BmiIndexer();
        bmiIndexer.setHuman(human);
        bmi = bmiIndexer.getBmi();
        interpretBMI = bmiIndexer.interpretBMI();
        interpretimagePathBMI = bmiIndexer.interpretimagePathBMI();
        interpretdetailsBMI = bmiIndexer.interpretdetailsBMI();
    }
%>
<!DOCTYPE html>
<html>

<head>
    <title>BMI Calculator</title>
    <!-- Add Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body {
            background-image: url("images/bmi background.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            color: white;
        }

        .card {
            border-radius: 20px;
            border: none;
        }

        .btn {
            border-radius: 20px;
        }

        .btn {
            transition: transform .2s;
        }

        .btn:hover {
            transform: scale(1.1);
        }

        @keyframes animateBackground {
            0% {
                background-position: 0 0;
            }

            100% {
                background-position: 100% 0;
            }
        }

        body {
            background-image: url("images/bmi background.jpg");
            animation: animateBackground 10s linear infinite;
            background-size: 200% 200%;
            color: white;
        }

        .fade-in {
            opacity: 0;
            transition: opacity 0.5s;
        }
    </style>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    
</head>
<body>
	<% if (interpretBMI != null) { %>

	<div class='container py-5'>
		<div class='row justify-content-center'>
			<div class='col-lg-6'>
				<div class='card shadow bg-dark'>
					<div class='card-body'>
						<h2 class='text-center mb-4'>ผลลัพธ์</h2>
						<p class='text-center'>
							<strong>ค่า BMI ของคุณคือ:</strong>
							<%= bmi %></p>
						<p class='text-center'>
							<strong><%= interpretBMI %></strong>
						</p>
						<div class='text-center'>
							<img src='<%= interpretimagePathBMI %>' alt='BMI Image'
								class='img-fluid rounded mx-auto d-block' />
						</div>
						<div class='details'>
							<h3>ข้อแนะนำ:</h3>
							<ul>
								<%= interpretdetailsBMI %>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<% } %>

	<!-- Debugging Output -->
	<!-- <%= "Request method: " + request.getMethod() %>
<%= "Weight parameter: " + request.getParameter("weight") %>
<%= "Height parameter: " + request.getParameter("height") %> -->
	<!-- [Your main content here] -->
	<div class="container py-5">
		<div class="row justify-content-center">
			<div class="col-lg-6">
				<div class="card shadow bg-dark">
					<div class="card-body">
						<h1 class="text-center mb-4">BMI Calculator</h1>
						<form method="post" action="">
							<div class="form-group">
								<label for="weight">Weight (kg):</label> <input type="text"
									class="form-control" name="weight" id="weight" required>
							</div>
							<div class="form-group">
								<label for="height">Height (cm):</label> <input type="text"
									class="form-control" name="height" id="height" required>
							</div>
							<button type="submit" class="btn btn-success btn-block">Calculate
								BMI</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
