<%@taglib uri="convirgance:web" prefix="virge" %>
<virge:set var="nav" value="owners" scope="request" />
<jsp:include page="include/header.jsp" />
<script src="js/utilities.js"></script>

<virge:service var="types" path="/services/types" />
<virge:service var="pets" path="/services/owner/${param.ownerId}/pet/${param.id}" />
<virge:set var="pet" value="${virge:first(pets)}" />

<script>    
    document.addEventListener('DOMContentLoaded', function() {
        document.getElementById("add-pet-form").onsubmit = function() {
            var keys = ["name", "birthDate", "type"];
            var object = { id: ${virge:javascript(pet.id)} };

            for(var key of keys) object[key] = document.getElementById(key).value;

            fetch("services/owner/${virge:urlparam(pet.ownerId)}/pet/${virge:urlparam(pet.id)}", { 
                method: "PUT", 
                body: JSON.stringify(object), 
                headers: { 
                    "Content-type": "application/json; charset=UTF-8" 
                } 
            })
            .then(function(response) {
                if(response.ok) window.location = redirectUrl("owner.jsp", {id: ${virge:javascript(pet.ownerId)}, success: "Pet details has been edited"});
                else window.alert("An unexpected error occurred while trying to save the pet");
            });

            return false;
        };
    });
</script>
  <h2>Pet</h2>
  <form class="form-horizontal" id="add-pet-form" onsubmit="return false;">
    <input type="hidden" name="id" value="">
    <div class="form-group has-feedback">
      <div class="form-group">
        <label class="col-sm-2 control-label">Owner</label>
        <div class="col-sm-10">${virge:html(pet.ownerName)}</div>
      </div>
      
      <div class="form-group">
        <label class="col-sm-2 control-label">Name</label>
        <div class="col-sm-10">
            <div>
                <input class="form-control" type="text" id="name" name="name" value="${virge:html(pet.name)}" required>
            </div>      
        </div>
      </div>

      <div class="form-group">
        <label class="col-sm-2 control-label">Birth Date</label>
        <div class="col-sm-10">
            <div>
                <input class="form-control" type="date" id="birthDate" name="birthDate" value="${virge:html(pet.birthDate)}" required>
            </div>
        </div>
      </div>
    
      <div class="form-group">
        <label class="col-sm-2 control-label">Type</label>
        <div class="col-sm-10">
            <select id="type" name="type">
                <virge:iterate var="type" items="${types}">
                <option value="${virge:html(type.name)}" ${pet.type == type.name ? "selected" : ""}>${virge:html(type.name)}</option>
                </virge:iterate>
            </select>
        </div>
      </div>
    
    </div>
    <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <button class="btn btn-primary">Update Pet</button>
      </div>
    </div>
  </form>
<jsp:include page="include/footer.jsp" />