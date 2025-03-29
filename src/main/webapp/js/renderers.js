function firstLastRenderer(element, column, value, record)
{
    value = record.firstName + " " + record.lastName;

    PaginatedTable.defaultRenderers.string(element, column, value, record);
}
        
function nameListRenderer(element, column, value, record) 
{
    var text = "";

    for(var item of value)
    {
        if(text.length > 0) text += ", ";

        text += item.name;
    }

    element.innerText = text || "none";
};
