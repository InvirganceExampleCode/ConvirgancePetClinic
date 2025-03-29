<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="nav" value="owners" scope="request" />
<jsp:include page="include/header.jsp" />
<script src="js/utilities.js"></script>
<script>
    var pet;
    
    fetch("services/types")
        .then(function(response) { return response.json(); })
        .then(function(data) {

            var types = document.getElementById("type");
            var option;

            for(var type of data)
            {
                option = document.createElement("option");

                option.value = type.name;
                option.textContent = type.name;

                types.appendChild(option);
            }

            fetch("services/pets?id=${param.id}")
                .then(function(response) { return response.json(); })
                .then(function(data) { pet = data[0]; pageMap(pet); });
        });
        
    document.addEventListener('DOMContentLoaded', function() {
        document.getElementById("add-pet-form").onsubmit = function() {
            var keys = ["name", "birthDate", "type"];
            var object = pet;

            for(var key of keys) object[key] = document.getElementById(key).value;

            fetch("services/update_pet", { 
                method: "POST", 
                body: JSON.stringify(object), 
                headers: { 
                    "Content-type": "application/json; charset=UTF-8" 
                } 
            })
            .then(function(response) {
                if(response.ok) window.location = redirectUrl("owner.jsp", {id: pet.ownerId, success: "Pet details has been edited"});
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
        <div class="col-sm-10">
          <span id="ownerName"></span>
        </div>
      </div>
      
      <div class="form-group">
        <label class="col-sm-2 control-label">Name</label>
        <div class="col-sm-10">
            <div>
                <input class="form-control" type="text" id="name" name="name" value="" required>
            </div>      
        </div>
      </div>
    
      
      <div class="form-group">
        <label class="col-sm-2 control-label">Birth Date</label>
        <div class="col-sm-10">
            <div>
                <input class="form-control" type="date" id="birthDate" name="birthDate" value="" required>
            </div>
        </div>
      </div>
    
      <div class="form-group">
        <label class="col-sm-2 control-label">Type</label>
        <div class="col-sm-10">
          <select id="type" name="type"></select>
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