$(document).ready(function() {

	var counter = 0;
	var wait_tree_seconds;

	wait_seconds = setInterval(function() {
		
		if(counter == 100 || document.getElementsByTagName('video').length > 0) {
			clearInterval(wait_seconds);
			start_monitor();
		}
		else {
			counter++;
		}
	
	}, 50);

	

/*
while(document.getElementsByTagName('video').length == 0) {
	console.log("ERR");
}*/



// From http://www.jquerybyexample.net/2012/06/get-url-parameters-using-jquery.html

function GetURLParameter(sParam) {
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++)
    {
        var sParameterName = sURLVariables[i].split('=');
        if ((sParameterName[0]).toUpperCase() == sParam.toUpperCase())
        {
            return sParameterName[1];
        }
    }
}

function start_monitor() {

	var send_to_server = true;
	var has_already_sent_to_server = false;


	

	if(document.getElementsByTagName('video')[0] != null) {

		var url = document.URL;
		var video_element = document.getElementsByTagName('video')[0];
		var time_interval = 1000; //In miliseconds
		var monitor = new Monitor(video_element, url);

		var uuid = GetURLParameter('uuid');
		if(uuid != null && uuid.length > 0)
			monitor.setNetmetricId(uuid);

		 $(window).on('beforeunload', function() {
			monitor.set_left_time();
			monitor.stop_all_monitoring();
			if(send_to_server && !has_already_sent_to_server) {
				var dt = JSON.stringify(monitor.json());
				has_already_sent_to_server = true;
			
				chrome.runtime.sendMessage({
			    action: 'xhttp',
			    url: "http://0.0.0.0:3000/api/users",
				type: "POST",
				data: dt,
				},  function(responseText) {
			    });
			}
			return undefined;

		});

		//Start all monitoring process
		monitor.start_all_monitoring(time_interval, 50);
			
		

		document.getElementsByTagName('video')[0].addEventListener("ended", function() {
			monitor.stop_all_monitoring();
			console.log(monitor.json());
			var dt = JSON.stringify(monitor.json());
			
			if(send_to_server && !has_already_sent_to_server) {
				has_already_sent_to_server = true;
				chrome.runtime.sendMessage({
			    action: 'xhttp',
			    url: "http://0.0.0.0:3000/api/users",
				type: "POST",
				data: dt,
				},  function(responseText) {
			   			/*Callback function to deal with the response*/
			    	});
			}
		

			/*
	    		BootstrapDialog.show({
		            message: 'Como foi sua experiência durante a exibição do vídeo?',
		            buttons: [{
		            	label: 'Boa',
		                cssClass: 'btn-primary',
		                action: function(){
		                    //alert('Hi Orange!');
		                    saveFile = saveFile + "Opinion,Good" + '\n';
		                    $link.attr("href", 'data:Application/octet-stream,' + encodeURIComponent(saveFile))[0].click();
			
		                }
		            }, {
		                label: 'Ruim',
		                cssClass: 'btn-danger',
		                action: function(){
		                    //alert('Hi Orange!');
		                    saveFile = saveFile + "Opinion,Ruim" + '\n';
		                    $link.attr("href", 'data:Application/octet-stream,' + encodeURIComponent(saveFile))[0].click();
			
		                }
		            }, {
		                label: 'Close',
		                action: function(dialogItself){
		                    dialogItself.close();
		                }
		            }]
		        });
			*/

		});

	}
}

});


