<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="convirgance:web" prefix="virge" %>
<virge:set var="nav" value="owners" scope="request" />
<jsp:include page="/include/header.jsp" />

<virge:json var="owners">[{"firstName":"","lastName":"","address":"","city":"","telephone": ""}]</virge:json>
<virge:json var="items" scope="page">
[
    { "title": "First Name", "key": "firstName" },
    { "title": "Last Name", "key": "lastName" },
    { "title": "Address", "key": "address" },
    { "title": "City", "key": "city"}
]
</virge:json>

<virge:if test="${param.id ne 'create'}">
    <virge:service var="owners" path="/services/owner/${param.id}" />
</virge:if>

<h2>Owner</h2>
<virge:iterate var="owner" items="${owners}">
<form class="form-horizontal" id="add-owner-form" method="POST">
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
<jsp:include page="/include/footer.jsp" />