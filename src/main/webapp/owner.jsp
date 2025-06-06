<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="convirgance:web" prefix="virge" %>
<virge:set var="nav" value="owners" scope="request" />
<jsp:include page="include/header.jsp" />

<virge:service var="owners" path="services/owners">
    <virge:parameter name="id" value="${param.id}"/>
</virge:service>

<virge:service var="pets" path="services/pets">
    <virge:parameter name="ownerId" value="${param.id}"/>
</virge:service>

<script>
    // Function to hide the success and error messages after 3 seconds
    setTimeout(function() {
        document.getElementById("success-message").setAttribute("hidden", "true");
    }, 3000);
</script>
    <h2>Owner Information</h2>
    <div class="alert alert-success" id="success-message" ${param.success ne null ? "" : "hidden"}>${virge:html(param.success)}</div>
    <table class="table table-striped">
        <virge:iterate var="owner" items="${owners}">
        <tbody>
            <tr>
                <th>Name</th>
                <td><b>${virge:html(owner.firstName)} ${virge:html(owner.lastName)}</b></td>
            </tr>
            <tr>
                <th>Address</th>
                <td>${virge:html(owner.address)}</td>
            </tr>
            <tr>
                <th>City</th>
                <td>${virge:html(owner.city)}</td>
            </tr>
            <tr>
                <th>Telephone</th>
                <td>${virge:html(owner.telephone)}</td>
            </tr>
        </tbody>
        </virge:iterate>
    </table>
  
    <a href="edit_owner.jsp?id=${virge:html(param.id)}" class="btn btn-primary">Edit Owner</a>
    <a href="create_pet.jsp?ownerId=${virge:html(param.id)}" class="btn btn-primary">Add New Pet</a>
    
    <br>
    <br>
    <h2>Pets and Visits</h2>
    <table class="table table-striped">
        <tbody>
            <virge:iterate var="pet" items="${pets}">
            <tr>
                <td valign="top">
                    <dl class="dl-horizontal">
                        <dt>Name</dt><dd>${virge:html(pet.name)}</dd>
                        <dt>Birth Date</dt><dd>${virge:html(pet.birthDate)}</dd>
                        <dt>Type</dt><dd>${virge:html(pet.type)}</dd>
                    </dl>
                </td>
                <td valign="top">
                    <table class="table-condensed">
                        <thead>
                            <tr>
                                <th>Visit Date</th>
                                <th>Description</th>
                            </tr>
                        </thead>
                        <tbody>
                            <virge:iterate var="visit" items="${pet.visits}">
                            <tr>
                                <td>${virge:html(visit.visitDate)}</td>
                                <td>${virge:html(visit.description)}</td>
                            </tr>
                            </virge:iterate>
                            <tr>
                                <td><a href="edit_pet.jsp?id=${virge:urlparam(pet.id)}">Edit Pet</a></td>
                                <td><a href="create_visit.jsp?id=${virge:urlparam(pet.id)}">Add Visit</a></td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            </virge:iterate>
        </tbody>
    </table>
<jsp:include page="include/footer.jsp" />