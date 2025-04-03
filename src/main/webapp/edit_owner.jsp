<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="convirgance:web" prefix="virge" %>
<virge:set var="nav" value="owners" scope="request" />
<jsp:include page="include/header.jsp" />
<script src="js/utilities.js"></script>
<script>
    var owner;
    
    fetch("services/owners?id=${param.id}")
        .then(function(response) { return response.json(); })
        .then(function(data) { owner = data[0]; pageMap(owner); });

    document.addEventListener('DOMContentLoaded', function() {
        document.getElementById("add-owner-form").onsubmit = function() {
            var keys = ["firstName", "lastName", "address", "city", "telephone"];
            var object = owner;

            for(var key of keys) object[key] = document.getElementById(key).value;

            fetch("services/update_owner", { 
                method: "POST", 
                body: JSON.stringify(object), 
                headers: { 
                    "Content-type": "application/json; charset=UTF-8" 
                } 
            })
            .then(function(response) {
                if(response.ok) window.location = redirectUrl("owner.jsp", {id: owner.id, success: "Owner Values Updated"});
                else window.alert("An unexpected error occurred while trying to save the owner");
            });

            return false;
        };
    });
</script>
<virge:json var="items" scope="page">
[
    { "title": "First Name", "key": "firstName" },
    { "title": "Last Name", "key": "lastName" },
    { "title": "Address", "key": "address" },
    { "title": "City", "key": "city"}
]
</virge:json>
  <h2>Owner</h2>
  <form class="form-horizontal" id="add-owner-form" onsubmit="return false;">
    <div class="form-group has-feedback">
      <virge:iterate var="item" items="${items}">
      <div class="form-group">
        <label class="col-sm-2 control-label">${item.title}</label>
        <div class="col-sm-10">
            <div>
                <input class="form-control" type="text" id="${item.key}" name="${item.key}" value="" required="true">
            </div>
        </div>
      </div>
      </virge:iterate>
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
        <button class="btn btn-primary" type="submit">Update Owner</button>
      </div>
    </div>
  </form>
<jsp:include page="include/footer.jsp" />