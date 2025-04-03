<%@taglib uri="convirgance:web" prefix="virge" %>
<virge:set var="nav" value="vets" scope="request" />
<jsp:include page="include/header.jsp" />
<script src="https://cdn.jsdelivr.net/gh/InvirganceOpenSource/emirgance/src/main/resources/base/base.js"></script>
<script src="https://cdn.jsdelivr.net/gh/InvirganceOpenSource/emirgance/src/main/resources/paginated/table.js"></script>
<script src="https://cdn.jsdelivr.net/gh/InvirganceOpenSource/emirgance/src/main/resources/paginated/display.js" defer></script>
<script src="https://cdn.jsdelivr.net/gh/InvirganceOpenSource/emirgance/src/main/resources/paginated/pager.js" defer></script>
<script src="js/renderers.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', async function() {
        
        var response = await fetch("services/vets");
        var vets = await response.json();
        
        document.getElementById("list").renderer("Name", firstLastRenderer);
        document.getElementById("list").renderer("specialties", nameListRenderer);
        document.getElementById("list").data(vets);
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
    <h2>Veterinarians</h2>
    <div>
        <paginated-table id="list" page-size="5" class="table table-striped">
            <columns>
                <column>Name</column>
                <column key="specialties">Specialties</column>
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