<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="nav" value="owners" scope="request" />
<jsp:include page="include/header.jsp" />
<script src="https://cdn.jsdelivr.net/gh/InvirganceOpenSource/emirgance/src/main/resources/base/base.js"></script>
<script src="https://cdn.jsdelivr.net/gh/InvirganceOpenSource/emirgance/src/main/resources/paginated/table.js"></script>
<script src="https://cdn.jsdelivr.net/gh/InvirganceOpenSource/emirgance/src/main/resources/paginated/display.js" defer></script>
<script src="https://cdn.jsdelivr.net/gh/InvirganceOpenSource/emirgance/src/main/resources/paginated/pager.js" defer></script>
<script src="js/renderers.js"></script>
<script src="js/utilities.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
            
        document.getElementById("find").onclick = async function() {
            var url = redirectUrl("services/owners", {lastName: document.getElementById("lastName").value});
            var response = await fetch(url);
            var owners = await response.json();
            
            if(!owners.length) 
            {
                document.querySelector("#find_owners .help-inline").textContent = "has not been found";
                return;
            }
            
            if(owners.length === 1)
            {
                window.location = redirectUrl("owner.jsp", {id: owners[0].id});
                return;
            }

            document.getElementById("list").data(owners);
            document.getElementById("find_owners").classList.add("hidden");
            document.getElementById("list_owners").classList.remove("hidden");
        };
        
        document.getElementById("list").renderer("Name", firstLastRenderer);
        document.getElementById("list").renderer("pets", nameListRenderer);
    });
</script>
<style>
.hidden { display: none; }
.pager { display: flex; margin-top: -24px; }
.pager * { align-content: center; }
.pager *:first-child { justify-content: left; }
.pager *:nth-child(2) { flex-grow: 1; justify-content: right; text-align: right; }
</style>
    <div id="find_owners">
        <h2>Find Owners</h2>
        <form class="form-horizontal" onsubmit="return false;">
            <div class="form-group">
                <div class="control-group" id="lastNameGroup">
                    <label class="col-sm-2 control-label">Last name </label>
                    <div class="col-sm-10">
                        <input class="form-control" value="" size="30" maxlength="80" id="lastName" name="lastName">
                        <span class="help-inline"></span>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button id="find" class="btn btn-primary">Find Owner</button>
                </div>
            </div>
            <a class="btn btn-primary" href="create_owner.jsp">Add Owner</a>
        </form>
    </div>
    
    <div id="list_owners" class="hidden">
        <h2>Owners</h2>
        <div>
            <paginated-table id="list" page-size="5" class="table table-striped">
                <columns>
                    <column href="owner.jsp?id={id}">Name</column>
                    <column key="address">Address</column>
                    <column key="city">City</column>
                    <column key="telephone">Telephone</column>
                    <column key="pets">Pets</column>
                </columns>
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/InvirganceOpenSource/emirgance/src/main/resources/themes/base/paginated/table.css">
                <link rel="stylesheet" href="resources/css/petclinic.css">
            </paginated-table>
        </div>
        <div class="pager">
            <div>
                <paginated-pager table="#list">
                    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/InvirganceOpenSource/emirgance/src/main/resources/themes/base/paginated/pager.css">
                </paginated-pager>
            </div>
            <div>
                <paginated-display table="#list">
                    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/InvirganceOpenSource/emirgance/src/main/resources/themes/base/paginated/display.css">
                </paginated-display>
            </div>
        </div>
    </div>
<jsp:include page="include/footer.jsp" />