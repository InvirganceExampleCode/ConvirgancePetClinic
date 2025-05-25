<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true"%>
<%@taglib uri="convirgance:web" prefix="virge" %>
<virge:set var="nav" value="error" scope="request" />
<% if(exception != null) exception.printStackTrace(); %>
<jsp:include page="include/header.jsp" />

<img src="${pageContext.request.contextPath}/resources/images/pets.png">
<h2>Something happened...</h2>
<p>
<% if(response.getStatus() == 500){ %>
<pre><%=exception.getMessage() %></pre>
<% } %>
</p>

<jsp:include page="include/footer.jsp" />