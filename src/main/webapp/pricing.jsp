<%@page import="java.util.List"%>
<%@page import="com.entities.*"%>
<%@page import="com.dao.*"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Wedding Planner</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans|Roboto" rel="stylesheet">
    <link rel="stylesheet" type="text/css"
          href="https://cdn.materialdesignicons.com/2.1.19/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            margin-top: 6%;
        }

        .navbar-light .navbar-brand {
            color: #1a1a1a;
            font-weight: bold;
            line-height: 22px;
        }

        .navbar {
            font-weight: 700;
            padding: 12px;
            font-style: normal;
            font-size: 14px;
            text-transform: uppercase;
            color: black;
            border-bottom: 1px solid #ddd;
        }

        li.nav-item > a.nav-link {
            color: black !important;
            font-weight: bold !important;
        }

        #review {
            font-size: 16px;
            font-weight: bold;
            margin-right: 5px;
        }

      
        .navbar-expand-lg .navbar-nav .nav-link {
            padding-right: .9rem;
        }

        .navbar-brand {
            margin-left: 20px;
            width: 200px;
        }

      

        img.img-fluid.img-custom {
            width: 344px;
            height:230px;
        }
        .btn.btn-sm.btn-light.active:hover {
            background: white;
        }
        .list-group-item:first-child {
            border-top-left-radius: 0rem;
            border-top-right-radius: 0rem;
        }
        .list-group-item:last-child {
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }

        .list-group-item.active{
            border-color: #00125100;
        }
    </style>
</head>
<body>
<%@include file="include/navbar.jsp" %>

<div class="container" style="width: 70%;">

    <div class="row mb-3">
        <div class="col-lg-12">
            <h3 class="h5 text-uppercase text-center text-muted">Wedding</h3>
            <h2 class="h2 text-uppercase text-center mb-0">Select Package</h2>
        </div>
    </div>
    <%
				WeddingCategoryDao dao = new WeddingCategoryDao(FactoryProvider.getFactory());
				List<WeddingCategory> wclist = dao.getAllWeddingCategory();
				%>
    <%
				for (WeddingCategory c : wclist) {
				%>
     <div class="row">
        <div class="col-md-12 p-0" style="margin-bottom: 20px;"> <!-- border:1px solid rgba(0,0,0,.125) -->

            <div class="float-left">
                <img src="admin/upload/categories/<%out.println(c.getPreviewImage());%>" style="width: 500px;" alt="">
            </div>
            
            <div class="float-left" style="width: 47%;"> 
                <ul class="list-group">
                    <li class="list-group-item bg-danger active" style="padding-top: 12px;"><h6 class="h6 text-center">
                    <%out.println(c.getWedding_type());
					%> Package Wedding - Price: $ <%out.println(c.getPrice());%> </h6></li>
                    <li class="list-group-item  list-group-item-light "><b>THIS PACKAGE INCLUDES:</b></li>
                    <%
						FeatureDao fdao = new FeatureDao(FactoryProvider.getFactory());
						List<Feature> flist = fdao.getFeaturesByCategoryId(c.getCategory_id());
						%>
                    <%
						for (Feature f : flist) {
						%>
                        <li class="list-group-item"><%out.println(f.getTitle());%></li>
                        <%} %>
                </ul>
                 <div class="float-right">
                <a href="package_detail.jsp?id=<%out.println(c.getCategory_id());%>" class="btn btn-sm btn-success active" style="border-radius: 3px;margin-top: 9px;">Book Now</a>
                <a href="package_detail.jsp?id=<%out.println(c.getCategory_id());%>" class="btn btn-sm btn-primary active" style="border-radius: 3px;margin-top: 9px;">More Detail</a>
            </div>
            </div>
            </div><!-- end of col-md-8 p-0 pl-3 -->
        </div>
        <%} %>

</div><!-- end of container -->

<%@include file="include/Footer.jsp" %>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="js/jquery-3.2.1.slim.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>