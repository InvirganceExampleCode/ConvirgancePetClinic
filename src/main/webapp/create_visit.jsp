<%@taglib uri="convirgance:web" prefix="virge" %>
<virge:set var="nav" value="owners" scope="request" />
<jsp:include page="include/header.jsp" />
<script src="js/utilities.js"></script>
<virge:service var="pets" path="services/pets">
    <virge:parameter name="id" value="${param.id}"/>
</virge:service>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        document.getElementById("add-visit-form").onsubmit = function() {
            var keys = ["visitDate", "description"];
            var object = { petId: ${virge:javascript(param.id)} };

            for(var key of keys) object[key] = document.getElementById(key).value;

            fetch("services/create_visit", { 
                method: "POST", 
                body: JSON.stringify(object), 
                headers: { 
                    "Content-type": "application/json; charset=UTF-8" 
                } 
            })
            .then(function(response) {
                if(response.ok) return response.json(); 
                else window.alert("An unexpected error occurred while trying to save the visit");
                
                return null;
            })
            .then(function(data) {
                if(!data) return;
                
                window.location = redirectUrl("owner.jsp", {id: ${virge:javascript(virge:first(pets).ownerId)}, success: "Your visit has been booked"});
            });
            
            return false;
        };
    });
</script>
<h2>New Visit</h2>
<b>Pet</b>
<virge:iterate var="pet" items="${pets}">
<table class="table table-striped">
    <thead>
        <tr>
            <th>Name</th>
            <th>Birth Date</th>
            <th>Type</th>
            <th>Owner</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td id="name">${virge:html(pet.name)}</td>
            <td id="birthDate">${virge:html(pet.birthDate)}</td>
            <td id="type">${virge:html(pet.type)}</td>
            <td id="ownerName">${virge:html(pet.ownerName)}</td>
        </tr>
    </tbody>
</table>

<form class="form-horizontal" id="add-visit-form" onsubmit="return false;">
    <div class="form-group has-feedback">
      
      <div class="form-group">
        <label class="col-sm-2 control-label">Date</label>
        <div class="col-sm-10">
            <div>
                <input class="form-control" type="date" id="visitDate" name="visitDate" value="" required>
            </div>
        </div>
      </div>

      <div class="form-group">
        <label class="col-sm-2 control-label">Description</label>
        <div class="col-sm-10">
            <div>
                <input class="form-control" type="text" id="description" name="description" value="" required>
            </div>
        </div>
      </div>
    
    </div>

    <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <button class="btn btn-primary" type="submit">Add Visit</button>
      </div>
    </div>
</form>
<br>
<b>Previous Visits</b>
<table id="previous" class="table table-striped">
    <tbody>
        <tr>
            <th>Date</th>
            <th>Description</th>
        </tr>
        <virge:iterate var="visit" items="${pet.visits}">
        <tr>
            <td>${virge:html(visit.visitDate)}</td>
            <td>${virge:html(visit.description)}</td>
        </tr>
        </virge:iterate>
    </tbody>
</table>
</virge:iterate>
<jsp:include page="include/footer.jsp" />