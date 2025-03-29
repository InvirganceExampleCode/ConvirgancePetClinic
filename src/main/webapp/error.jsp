<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="nav" value="error" scope="request" />
<jsp:include page="include/header.jsp" />

<img src="${pageContext.request.contextPath}/resources/images/pets.png">
<h2>Something happened...</h2>
<p>
<% if(response.getStatus() == 500){ %>
<pre><%=exception.getMessage() %></pre>
<% } %>
</p>

<jsp:include page="include/footer.jsp" />