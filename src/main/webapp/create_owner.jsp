<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="nav" value="owners" scope="request" />
<jsp:include page="include/header.jsp" />
<script src="js/utilities.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        document.getElementById("add-owner-form").onsubmit = function() {
            var keys = ["firstName", "lastName", "address", "city", "telephone"];
            var object = {};
            
            for(var key of keys) object[key] = document.getElementById(key).value;

            fetch("services/create_owner", { 
                method: "POST", 
                body: JSON.stringify(object), 
                headers: { 
                    "Content-type": "application/json; charset=UTF-8" 
                } 
            })
            .then(function(response) { 
                if(response.ok) return response.json(); 
                else window.alert("An unexpected error occurred while trying to save the owner");
            })
            .then(function(data) {
                window.location = redirectUrl("owner.jsp", {id: data[0], success: "New Owner Created"});
            });
            
            return false;
        };
    });
</script>
<%
String[] titles = {"First Name", "Last Name", "Address", "City"};
String[] keys = {"firstName", "lastName", "address", "city"};
%>
  <h2>Owner</h2>
  <form class="form-horizontal" id="add-owner-form" onsubmit="return false;">
    <div class="form-group has-feedback">
<% for(int i=0; i<titles.length; i++) { %>
      <div class="form-group">
        <label class="col-sm-2 control-label"><%= titles[i]%></label>
        <div class="col-sm-10">
            <div>
                <input class="form-control" type="text" id="<%= keys[i]%>" name="<%= keys[i]%>" value="" required="true">
            </div>
        </div>
      </div>
<% } %>
      <div class="form-group">
        <label class="col-sm-2 control-label">Telephone</label>
        <div class="col-sm-10">
            <div>
                <input class="form-control" type="tel" pattern="[0-9]{10}" id="telephone" name="telephone" title="Telephone must be a 10-digit number" value="" autocomplete="hidden" required="true">
            </div>
        </div>
      </div>
    
    </div>
    <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <button class="btn btn-primary" type="submit">Add Owner</button>
      </div>
    </div>
  </form>
<jsp:include page="include/footer.jsp" />