<%@taglib uri="convirgance:web" prefix="virge" %>
<virge:set var="nav" value="owners" scope="request" />
<jsp:include page="/include/header.jsp" />

<virge:service var="pets" path="/services/owner/${param.ownerId}/pet/${param.id}" />

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

<form class="form-horizontal" id="add-visit-form" method="POST">
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
<jsp:include page="/include/footer.jsp" />