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
var timerForBuffering;
var timerForVideoFramesMonitor;
var lengthofStall = {};

var stall = 0;


var checkInterval  = 50.0
var lastPlayPos    = 0
var currentPlayPos = 0
var bufferingDetected = false
var startBuffering = 0;
var endBuffering = 0;


var decodedFrames = 0;
var decodedPerSec = 0;
var audioBytesDecoded = 0;
var audioBytesDecodedPerSec = 0;
var videoBytesDecoded = 0;
var videoBytesDecodedPerSec = 0;
var droppedFrames = 0;
var droppedFramesPerSec = 0;

var decodedMean = new Mean();
var audioMean = new Mean();
var videoMean = new Mean();
var dropMean = new Mean();

var id_ = -1;


var player = $("video")


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
	stall++;
}

function numberOfStall(videoElement) {
	console.log(stall);
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

function stopQualityPlaybackMonitor() {
	clearInterval(timerI);
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


function numberOfStalls() {
	console.log(stall-1);
}


function startBufferingMonitor(videoElement) {
	timerForBuffering = setInterval(function() {
		currentPlayPos = videoElement.currentTime

	    // checking offset, e.g. 1 / 50ms = 0.02
	    var offset = 1 / checkInterval

	    // if no buffering is currently detected,
	    // and the position does not seem to increase
	    // and the player isn't manually paused...
	    if (
	            !bufferingDetected 
	            && currentPlayPos < (lastPlayPos + offset)
	            && !videoElement.paused
	        ) {
	    	startBuffering = new Date().getTime();
	        console.log("buffering")
	        bufferingDetected = true
	    }

	    // if we were buffering but the player has advanced,
	    // then there is no buffering
	    if (
	        bufferingDetected 
	        && currentPlayPos > (lastPlayPos + offset)
	        && !videoElement.paused	
	        ) {
	    	var tm = ((new Date().getTime() - startBuffering)/1000);
	    	lengthofStall[stall] = tm;
	    	countStall();
	        console.log("Buffering for: " + tm + " seconds");
	        console.log("not buffering anymore")
	        bufferingDetected = false
	    }
	    lastPlayPos = currentPlayPos
	}, checkInterval)
}

function stopBufferingMonitor() {
	clearInterval(timerForBuffering);

}



function Mean() {
  this.count = 0;
  this.sum = 0;
  
  this.record = function(val) {
    this.count++;
    this.sum += val;
  };
  
  this.mean = function() {
    return this.count ? (this.sum / this.count).toFixed(3) : 0;
  };
}

function recalcRates(videoElement) {
  
  if (videoElement.readyState <= HTMLMediaElement.HAVE_CURRENT_DATA || videoElement.paused) {
    return;
  }

  decodedPerSec = (videoElement.webkitDecodedFrameCount - decodedFrames);
  decodedFrames = videoElement.webkitDecodedFrameCount;

  audioBytesDecodedPerSec = videoElement.webkitAudioDecodedByteCount - audioBytesDecoded;
  audioBytesDecoded = videoElement.webkitAudioDecodedByteCount;

  videoBytesDecodedPerSec = videoElement.webkitVideoDecodedByteCount - videoBytesDecoded;
  videoBytesDecoded = videoElement.webkitVideoDecodedByteCount;

  droppedFramesPerSec = videoElement.webkitDroppedFrameCount - droppedFrames;
  droppedFrames = videoElement.webkitDroppedFrameCount;

  decodedMean.record(decodedPerSec);
  audioMean.record(audioBytesDecodedPerSec);
  videoMean.record(videoBytesDecodedPerSec);
  dropMean.record(droppedFramesPerSec);
  
  
  console.log("Audio bytes decoded: " + videoElement.webkitAudioDecodedByteCount + " average p/s: " + audioMean.mean());
  console.log("Video bytes decoded: " + videoElement.webkitVideoDecodedByteCount + " average p/s: " + videoMean.mean());
  console.log("Decoded frames: " + videoElement.webkitDecodedFrameCount + " average p/s: " + decodedMean.mean());
  console.log("Dropped frames: " + videoElement.webkitDroppedFrameCount + " average p/s: " + dropMean.mean());
  console.log("");
}


function startVideoFramesMonitor(videoElement) {
	timerForVideoFramesMonitor = setInterval(function(){
	 recalcRates(videoElement);
	}, 1000);
}

function stopVideoFramesMonitor() {
	clearInterval(timerForVideoFramesMonitor);
}



if(document.getElementsByTagName('video')[0] != null) {
	//$.get( "http://0.0.0.0:3000/id", function( data ) {
  	//	id_ = data.id;
	//});

	var vd = document.getElementsByTagName('video')[0];
	startQualityPlaybackMonitor(document.getElementsByTagName('video')[0], 1000);
	startBufferingMonitor(document.getElementsByTagName('video')[0]);
	startVideoFramesMonitor(vd);


	document.getElementsByTagName('video')[0].addEventListener("ended", function() {
		stopBufferingMonitor();
		stopVideoFramesMonitor();
		stopQualityPlaybackMonitor();
		if(stall > 0)
			console.log("Time until video started: " + lengthofStall[0] + " seconds");
		for(var i = 1; i < stall; i++) {
			console.log("Length of stall " + i + " was " + lengthofStall[i]);
		};

		//$.post("http://0.0.0.0:3000/stall", { 'id': id_, 'numberOfStalls': stall , 'stall': JSON.stringfy(lengthofStall)});

		console.log("Total Played Time: " + totalPlayedTime(vd));
		numberOfStall();



	});

}



