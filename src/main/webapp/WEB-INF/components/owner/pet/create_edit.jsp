<%@taglib uri="convirgance:web" prefix="virge" %>
<virge:set var="nav" value="owners" scope="request" />
<jsp:include page="/include/header.jsp" />

<virge:service var="types" path="/services/types" />
<virge:service var="owners" path="/services/owner/${param.ownerId}" />
<virge:set var="owner" value="${virge:first(owners)}" />
<virge:json var="pet">{"ownerName":"","name":"","birthDate":"","type":""}</virge:json>

<virge:if test="${param.id ne 'create'}">
    <virge:service var="pets" path="/services/owner/${param.ownerId}/pet/${param.id}" />
    <virge:set var="pet" value="${virge:first(pets)}" />
</virge:if>
  <h2>Pet</h2>
  <form class="form-horizontal" id="add-pet-form" method="POST">
    <input type="hidden" name="id" value="">
    <div class="form-group has-feedback">
      <div class="form-group">
        <label class="col-sm-2 control-label">Owner</label>
        <div class="col-sm-10">${virge:html(owner.firstName)} ${virge:html(owner.lastName)}</div>
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
        <button class="btn btn-primary">${param.id eq 'create' ? 'Add' : 'Update'} Pet</button>
      </div>
    </div>
  </form>
<jsp:include page="/include/footer.jsp" />