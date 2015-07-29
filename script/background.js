/**
 * Possible parameters for request:
 *  action: "xhttp" for a cross-origin HTTP request
 *  method: Default "GET"
 *  url   : required, but not validated
 *  data  : data to send in a POST request
 *
 * The callback function is called upon completion of the request */

var config = null;

chrome.storage.sync.get({
    endereco: "http://0.0.0.0:3000",
    monitorar: true,
    questionario: true,
    relatorio: false,
    intervalo_minimo_de_stall : 50,
    intervalo_de_monitoramento : 1000,
    enviar_para_servidor : true
}, function(items) {
        config = items;
});

chrome.storage.onChanged.addListener(function(changes, namespace) {
        for (key in changes) {
          var storageChange = changes[key];
          config[key] = storageChange.newValue;
        }
});
/*
    $.ajax({
            url: "http://0.0.0.0:3000/api/questionario",
            type: "POST",
            data: "",
            contentType: "application/json", success: function(result) {var f = $.parseJSON(result); console.log(f.idade)}
});
Object {readyState: 1}

*/
chrome.runtime.onMessage.addListener(function(request, sender, sendResponse) {
    console.log(request);

    if (request.action == "xhttp") {

        $.ajax({
            url: request.url,
            type: "POST",
            data: request.data,
            contentType: "application/json",
        });
        console.log(request.data);
        
    }
    
    if(request.action == "getPreferences") {
        sendResponse(config);
    }
});

