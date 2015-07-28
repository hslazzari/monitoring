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
    relatorio: false
}, function(items) {
        config = items;
        console.log(config);
});

chrome.storage.onChanged.addListener(function(changes, namespace) {
        for (key in changes) {
          var storageChange = changes[key];
          config[key] = storageChange.newValue;

        }

        console.log(config);
});

    



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

