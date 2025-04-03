<%@taglib uri="convirgance:web" prefix="virge" %>
<virge:set var="nav" value="owners" scope="request" />
<jsp:include page="include/header.jsp" />
<script src="js/utilities.js"></script>
<script>
    fetch(redirectUrl("services/owners", {id: "${param.ownerId}"}))
        .then(function(response) { return response.json(); })
        .then(function(data) { pageMap(data[0]); });

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
        });

    document.addEventListener('DOMContentLoaded', function() {

        document.getElementById("add-pet-form").onsubmit = function() {
            var keys = ["name", "birthDate", "type"];
            var object = {ownerId: ${param.ownerId}};

            for(var key of keys) object[key] = document.getElementById(key).value;

            fetch("services/create_pet", { 
                method: "POST", 
                body: JSON.stringify(object), 
                headers: { 
                    "Content-type": "application/json; charset=UTF-8" 
                } 
            })
            .then(function(response) { 
                if(response.ok) return response.json(); 
                else window.alert("An unexpected error occurred while trying to save the pet");
                
                return null;
            })
            .then(function(data) {
                if(!data) return;
                
                window.location = redirectUrl("owner.jsp", {id: ${param.ownerId}, success: "New Pet has been Added"});
            });

            return false;
        };
    });
</script>
  <h2>New Pet</h2>
  
  <form class="form-horizontal" id="add-pet-form" onsubmit="return false;">
    <input type="hidden" name="id" value="">
    <div class="form-group has-feedback">
      <div class="form-group">
        <label class="col-sm-2 control-label">Owner</label>
        <div class="col-sm-10">
          <span id="firstName"></span> <span id="lastName"></span>
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
        <button class="btn btn-primary" type="submit">Add Pet</button>
      </div>
    </div>
  </form>

<jsp:include page="include/footer.jsp" />