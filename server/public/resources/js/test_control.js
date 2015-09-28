

var video_element = document.getElementsByTagName('video')[0];

var avaliados = 1;


$("#avaliar").click(function() {
	clearInterval(timer_for_change_);
			
	avaliados = avaliados + 1;
	var duration = video_element.duration;
	
	video_element.pause();
	
	timer_for_change_= setInterval(function() {

		if(video_element.currentTime > avaliados * (video_element.duration/5.0)) {
			clearInterval(timer_for_change_);
			$("#avaliar").click();
		}

	}, 300);



	
	//load próximo mos
	//

	



	BootstrapDialog.show( {
		title: "Qualidade de experiência - Simulada",
			message: $('<div></div>').load("../resources/html/remote.html"),
	   		closable: true,
	    	closeByBackdrop: false,
	    	closeByKeyboard: false,
		  	buttons: [{
			      		label: 'Boa',
			        	cssClass: 'btn-primary',
			        	action: function(dialogItself) {
			       				video_element.play();
		
								dialogItself.close();
			           	}	
				   	}, {
				        label: 'Ruim',
				        cssClass: 'btn-danger',
				        action: function(dialogItself) {
				            	video_element.play();
		
								dialogItself.close();
				            }
				    	}, {
				   	    label: 'Cancelar',
				        action: function(dialogItself) {
				        		video_element.play();
		
					            dialogItself.close();
			      			}
				       }]
	});
});




var timer_for_change_= setInterval(function() {

		if(video_element.currentTime > avaliados * (video_element.duration/5.0)) {
			clearInterval(timer_for_change_);
			$("#avaliar").click();
		}

	}, 300);


