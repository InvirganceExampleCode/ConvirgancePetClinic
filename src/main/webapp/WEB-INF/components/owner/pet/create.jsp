<%@taglib uri="convirgance:web" prefix="virge" %>
<virge:set var="nav" value="owners" scope="request" />
<jsp:include page="/include/header.jsp" />
<virge:service var="types" path="services/types" />
<virge:service var="owners" path="/services/owner/${param.ownerId}" />
  <h2>New Pet</h2>
  <virge:iterate var="owner" items="${owners}">
  <form class="form-horizontal" id="add-pet-form" method="POST">
    <div class="form-group has-feedback">
      <div class="form-group">
        <label class="col-sm-2 control-label">Owner</label>
        <div class="col-sm-10">
          ${virge:html(owner.firstName)} ${virge:html(owner.lastName)}
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
            <select id="type" name="type">
                <virge:iterate var="type" items="${types}">
                <option value="${virge:html(type.name)}">${virge:html(type.name)}</option>
                </virge:iterate>
            </select>
        </div>
      </div>
    
    </div>
    <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <button class="btn btn-primary" type="submit">Add Pet</button>
      </div>
    </div>
  </form>
  </virge:iterate>
<jsp:include page="/include/footer.jsp" />