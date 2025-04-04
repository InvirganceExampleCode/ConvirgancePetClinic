<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="convirgance:web" prefix="virge" %>
<virge:set var="nav" value="owners" scope="request" />
<jsp:include page="include/header.jsp" />
<script src="js/utilities.js"></script>
<virge:service var="owners" path="services/owners">
    <virge:parameter name="id" value="${param.id}"/>
</virge:service>
<script>
    var owners = ${virge:json(owners)};
    
    document.addEventListener('DOMContentLoaded', function() {
        document.getElementById("add-owner-form").onsubmit = function() {
            var keys = ["firstName", "lastName", "address", "city", "telephone"];
            var owner = {id: owners[0].id};

            for(var key of keys) owner[key] = document.getElementById(key).value;

            fetch("services/update_owner", { 
                method: "POST", 
                body: JSON.stringify(owner), 
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
<virge:iterate var="owner" items="${owners}">
<form class="form-horizontal" id="add-owner-form" onsubmit="return false;">
    <div class="form-group has-feedback">
      <virge:iterate var="item" items="${items}">
      <div class="form-group">
        <label class="col-sm-2 control-label">${virge:html(item.title)}</label>
        <div class="col-sm-10">
            <div>
                <input class="form-control" type="text" id="${virge:html(item.key)}" name="${virge:html(item.key)}" value="${virge:html(owner[item.key])}" required="true">
            </div>
        </div>
      </div>
      </virge:iterate>
      <div class="form-group">
        <label class="col-sm-2 control-label">Telephone</label>
        <div class="col-sm-10">
            <div>
                <input class="form-control" type="tel" pattern="[0-9]{10}" id="telephone" name="telephone" title="Telephone must be a 10-digit number" value="${virge:html(owner.telephone)}" autocomplete="hidden" required="true">
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
</virge:iterate>
<jsp:include page="include/footer.jsp" />