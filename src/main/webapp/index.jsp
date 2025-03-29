<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="nav" value="home" scope="request" />
<jsp:include page="include/header.jsp" />

<h2>Welcome</h2>
<div class="row">
    <div class="col-md-12">
        <img class="img-responsive" src="resources/images/pets.png">
    </div>
</div>

<jsp:include page="include/footer.jsp" />