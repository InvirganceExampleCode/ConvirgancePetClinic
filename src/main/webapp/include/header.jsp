<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.png">

        <title>PetClinic :: Convirgance (Web Services) demonstration</title>

        <link href="${pageContext.request.contextPath}/webjars/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/petclinic.css">

    </head>
    <body>
        
        <nav class="navbar navbar-expand-lg navbar-dark" role="navigation">
            <div class="container-fluid">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp"><span></span></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#main-navbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="main-navbar" style="">

                    <ul class="nav navbar-nav me-auto">

                        <li class="nav-item">
                            <a class="nav-link ${ nav == "home" ? "active" : "" }" href="${pageContext.request.contextPath}/index.jsp" title="home page">
                                <span class="fa fa-home"></span>
                                <span>Home</span>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link ${ nav == "owners" ? "active" : "" }" href="${pageContext.request.contextPath}/owners.jsp" title="find owners">
                                <span class="fa fa-search"></span>
                                <span>Find owners</span>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link ${ nav == "vets" ? "active" : "" }" href="${pageContext.request.contextPath}/vets.jsp" title="veterinarians">
                                <span class="fa fa-th-list"></span>
                                <span>Veterinarians</span>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link ${ nav == "error" ? "active" : "" }" href="${pageContext.request.contextPath}/oups" title="trigger a RuntimeException to see how it is handled">
                                <span class="fa fa-exclamation-triangle"></span>
                                <span>Error</span>
                            </a>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>
        <div class="container-fluid">
            <div class="container xd-container">