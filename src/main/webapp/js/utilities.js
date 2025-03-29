function pageMap(data)
{
    var element;
    
    for(var key in data)
    {
        element = document.getElementById(key);
        
        if(element && "value" in element) element.value = data[key];
        else if(element) element.textContent = data[key];
    }
}

function redirectUrl(path, parameters)
{
    const params = new URLSearchParams();
    
    for(var key in parameters) params.append(key, parameters[key]);
    
    return path + "?" + params;
}

