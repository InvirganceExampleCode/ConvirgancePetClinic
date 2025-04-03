<%@taglib uri="convirgance:web" prefix="virge" %>
<virge:set var="nav" value="owners" scope="request" />
<jsp:include page="include/header.jsp" />
<script src="js/utilities.js"></script>
<script>
    var pet;
    
    fetch("services/pets?id=${param.id}")
        .then(function(response) { return response.json(); })
        .then(function(data) {
            
            var tbody = document.querySelector("#previous tbody");
            var tr;
            var td1;
            var td2;
            
            pet = data[0];

            for(var key in pet)
            {
                if(document.getElementById(key)) document.getElementById(key).textContent = pet[key];
            }
            
            for(var visit of pet.visits)
            {
                tr = document.createElement("tr");
                td1 = document.createElement("td");
                td2 = document.createElement("td");
                
                td1.textContent = visit.visitDate;
                td2.textContent = visit.description;
                
                tr.appendChild(td1);
                tr.appendChild(td2);
                tbody.appendChild(tr);
            }
        });
        
    document.addEventListener('DOMContentLoaded', function() {

        document.getElementById("add-visit-form").onsubmit = function() {
            var keys = ["visitDate", "description"];
            var object = {petId: ${param.id}};

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
                
                window.location = redirectUrl("owner.jsp", {id: pet.ownerId, success: "Your visit has been booked"});
            });
            
            return false;
        };
    });
</script>
  <h2>New Visit</h2>
  <b>Pet</b>
  <table class="table table-striped">
    <thead>
      <tr>
        <th>Name</th>
        <th>Birth Date</th>
        <th>Type</th>
        <th>Owner</th>
      </tr>
    </thead>
    <tbody><tr>
      <td id="name"></td>
      <td id="birthDate"></td>
      <td id="type"></td>
      <td id="ownerName"></td>
    </tr>
  </tbody></table>

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
    <tbody><tr>
      <th>Date</th>
      <th>Description</th>
    </tr>
  </tbody></table>

<jsp:include page="include/footer.jsp" />