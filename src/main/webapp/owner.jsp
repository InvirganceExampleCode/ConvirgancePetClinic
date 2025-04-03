<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="convirgance:web" prefix="virge" %>
<virge:set var="nav" value="owners" scope="request" />
<jsp:include page="include/header.jsp" />
<script src="js/utilities.js"></script>
<script>
function renderVisits(visits, pet)
{
    var table = document.createElement("table");
    var thead = document.createElement("thead");
    var tbody = document.createElement("tbody");
    var tr = document.createElement("tr");
    var td1;
    var td2;
    
    table.className = "table-condensed";
    thead.innerHTML = `<tr>
                         <th>Visit Date</th>
                         <th>Description</th>
                       </tr>`;
    
    for(const visit of visits)
    {
        tr = document.createElement("tr");
        td1 = document.createElement("td");
        td2 = document.createElement("td");
        
        td1.innerText = visit.visitDate;
        td2.innerText = visit.description;
        
        tr.appendChild(td1);
        tr.appendChild(td2);
        tbody.appendChild(tr);
    }
    
    tr = document.createElement("tr");
    td1 = document.createElement("td");
    td2 = document.createElement("td");
    
    td1.innerHTML = "<a href=\"edit_pet.jsp?id=" + pet.id + "\">Edit Pet</a>";
    td2.innerHTML = "<a href=\"create_visit.jsp?id=" + pet.id + "\">Add Visit</a>";
    
    tr.appendChild(td1);
    tr.appendChild(td2);
    tbody.appendChild(tr);
    table.appendChild(thead);
    table.appendChild(tbody);
    
    return table;
}
    
document.addEventListener('DOMContentLoaded', function() {

    fetch(redirectUrl("services/owners", {id: "${param.id}"}))
        .then(function(response) { return response.json(); })
        .then(function(data) {

            for(var key in data[0])
            {
                if(document.getElementById(key)) document.getElementById(key).textContent = data[0][key];
            }
            
            document.getElementById("owner_info").classList.remove("hidden");
        });
        
    fetch(redirectUrl("services/pets", {ownerId: "${param.id}"}))
        .then(function(response) { return response.json(); })
        .then(function(data) {
            var tbody = document.querySelector("#pet_info table tbody");
            var tr;
            var td;
            
            for(const pet of data)
            {
                tr = document.createElement("tr");
                td = document.createElement("td");
                
                td.setAttribute("valign", "top");
                td.innerHTML = `<dl class="dl-horizontal">
                                <dt>Name</dt>
                                <dd>` + pet.name + `</dd>
                                <dt>Birth Date</dt>
                                <dd>` + pet.birthDate + `</dd>
                                <dt>Type</dt>
                                <dd>` + pet.type + `</dd>
                              </dl>`;
            
                tr.appendChild(td);
                
                td = document.createElement("td");
                
                td.appendChild(renderVisits(pet.visits, pet));
                td.setAttribute("valign", "top");
                tr.appendChild(td);
                tbody.appendChild(tr);
            }
            
            document.getElementById("pet_info").classList.remove("hidden");
        });
        
    if(${param.success ne null}) 
    {
        document.getElementById("success-message").classList.remove("hidden");
        document.getElementById("success-message").textContent = "${param.success}";
    }
    
    // Function to hide the success and error messages after 3 seconds
    setTimeout(function() {
        document.getElementById("success-message").classList.add("hidden");
    }, 3000); 
});
</script>
<style>
.hidden { display: none; }
</style>
    <h2>Owner Information</h2>
    <div class="alert alert-success hidden" id="success-message"></div>
    <div id="owner_info" class="hidden">
    <table class="table table-striped">
      <tbody><tr>
        <th>Name</th>
        <td><b><span id="firstName"></span> <span id="lastName"></span></b></td>
      </tr>
      <tr>
        <th>Address</th>
        <td><span id="address"></span></td>
      </tr>
      <tr>
        <th>City</th>
        <td><span id="city"></span></td>
      </tr>
      <tr>
        <th>Telephone</th>
        <td><span id="telephone"></span></td>
      </tr>
    </tbody></table>
  
    <a href="edit_owner.jsp?id=${param.id}" class="btn btn-primary">Edit Owner</a>
    <a href="create_pet.jsp?ownerId=${param.id}" class="btn btn-primary">Add New Pet</a>
    </div>
    
    <div id="pet_info" class="hidden">
    <br>
    <br>
    <h2>Pets and Visits</h2>
  
    <table class="table table-striped">
        <tbody></tbody>
    </table>
    </div>
<jsp:include page="include/footer.jsp" />