//$("video").videoHeight
//document.getElementsByTagName("video")[0].addEventListener("loadedmetadata", function() {console.log("OI");}, false);


/*

- Qualidades disponíveis do vídeo
- Qualidade evetivamente assistida pelo usuário ao longo do vídeo 
  (ele pode trocar N vezes durante a reprodução)
- Taxa de ocupação dos buffers envolvidos
- Numero de interrupções após o início do vídeo
- Tempo entre a requisição do vídeo e o início da reprodução
- Tempo total que o usuário ficou no vídeo (para monitorarmos se o 
  cara assistiu até o final ou se abortou em X segundos)   DONE


*/

var qualityAtTime = {};
var timerI;

function getCurrentPlaybackQuality(videoElement) {
	return {'width' : videoElement.videoWidth, 'height' : videoElement.videoHeight};
}

function totalPlayedTime(videoElement) {
	total = 0;
	for(i = 0; i < videoElement.played.length; i++) {
		total = total + (videoElement.played.end(i) - videoElement.played.start(i));
	}
	return total;
}

function startTime(videoElement, callback) {
	var startTime;
	var totalTime = -1;
	videoElement.addEventListener("loadstart", function() {
		startTime = new Date().getTime(); 
	});
	videoElement.addEventListener("play", function() {
		totalTime = new Date().getTime(); 
	});
}	

function timeUntilCurrentBufferEnd(videoElement) {
	var ct = videoElement.currentTime;
	for(i = 0; i < videoElement.buffered.length; i++) {
		if((videoElement.buffered.start(i) < ct) && (videoElement.buffered.end(i) < ct))
			return videoElement.buffered.end(i) - ct;
	}
}

function totalBufferSize(videoElement) {
	var obj = {};
	obj.length = videoElement.buffered.length;
	obj.bufferTime = new Array(videoElement.buffered.length);
	for(i = 0; i < videoElement.buffered.length; i++) {
		obj.bufferTime[i] = videoElement.buffered.end(i) - videoElement.buffered.start(i);
	}	
	return obj;
}

function totalTimeBuffered(videoElement) {
	total = 0;
	for(i = 0; i < videoElement.buffered.length; i++) {
		total = total + (videoElement.buffered.end(i) - videoElement.buffered.start(i));
	}	
	return total;	
}

function countStall(videoElement) {

}

function numberOfStall(videoElement) {

}

function lenghtOfEachStall(videoElement) {

}

function drawGraph() {
	$("body").append("<canvas id='myChart' width='400' height='400'></canvas>");
	var ctx = document.getElementById("myChart").getContext("2d");
	var size = Object.keys(qualityAtTime).length;
	var keys = Object.keys(qualityAtTime);
	var data2 = new Array();
	for(var i = 0; i < size; i++) {
		data2[i] = qualityAtTime[keys[i]].height;	
	}

	var data = {
	    labels: keys,
			    datasets: [
			        {
			            label: "My First dataset",
			            fillColor: "rgba(220,220,220,0.2)",
			            strokeColor: "rgba(220,220,220,1)",
			            pointColor: "rgba(220,220,220,1)",
			            pointStrokeColor: "#fff",
			            pointHighlightFill: "#fff",
			            pointHighlightStroke: "rgba(220,220,220,1)",
			            data: data2
			        }
			    ]
			};

			var myLineChart = new Chart(ctx).Line(data, null);
}


function startQualityPlaybackMonitor(videoElement, chunkInterval) {
	timerI = setInterval(function() {

		if(videoElement.ended) {
			clearInterval(timerI);
			drawGraph();

		}
		else {
			if(videoElement.currentTime != null) {
				qualityAtTime[videoElement.currentTime.toString()] = getCurrentPlaybackQuality(videoElement);
			}
		}
	
	}, chunkInterval);

}

function startBufferSizeInfoMonitor(videoElement, chunkInterval) {
	timerI = setInterval(function() {

		if(videoElement.ended) {
			clearInterval(timerI);
			console.log("Video Stopped");
		}
		else {
			if(videoElement.currentTime != null) {
				for(var i = 0; i <  videoElement.buffered.length; i++) {
					if(videoElement.currentTime >=  videoElement.buffered.start(i) && videoElement.currentTime <=  videoElement.buffered.end(i)) {
						console.log("Video inside interval: (" + videoElement.buffered.start(i) + ", " + videoElement.buffered.end(i) + ") playing at: " + videoElement.currentTime + " with " + (videoElement.buffered.end(i) - videoElement.currentTime) + " seconds to play");
					}
				

				}

				
			}
		}
	
	}, chunkInterval);
}


if($("video") != null) {
	startQualityPlaybackMonitor(document.getElementsByTagName('video')[0], 1000);

}



function displayEvents(videoElement) {
	videoElement.addEventListener("abort", function() {
	    console.log("Video load aborted");
	});

	videoElement.addEventListener("canplay", function() {
	    console.log("Video can play");
	});

	videoElement.addEventListener("canplaythrough", function() {
	    console.log("Video can play through");
	});
	
	videoElement.addEventListener("loadstart", function() {
	    console.log("Video load start");
	});
	
	videoElement.addEventListener("pause", function() {
	    console.log("Video pause");
	});
	
	videoElement.addEventListener("play", function() {
	    console.log("Video play");
	});
	
	videoElement.addEventListener("playing", function() {
	    console.log("Video playing");
	});
	
	videoElement.addEventListener("seeked", function() {
	    console.log("Video seeked");
	});
	
	videoElement.addEventListener("seeking", function() {
	    console.log("Video seeking");
	});
	
	videoElement.addEventListener("stalled", function() {
	    console.log("Video stalled");
	});
	
	videoElement.addEventListener("waiting", function() {
	    console.log("Video waiting");
	});

}