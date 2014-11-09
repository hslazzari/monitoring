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


var saveFile = "";
var stallFile = "";
var frameRateFile = "FrameRatePerSecond" + '\n' + "VideoFrameRate,AudioFrameRate" + '\n';
var bufferFile = "BufferTime" + '\n' + "BufferID,BufferStart,BufferEnd,TotalBufferTime,TotalRemaingTime" + '\n';
var playedTimeFile = "Played Time" + '\n'+ "Played Start,Played Stop" + '\n';



var qualityAtTime = {};
var timerI;
var timerForBuffering;
var timerForVideoFramesMonitor;
var timerI2;
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

var lastWidth = -1;
var lastHeight = -1;
var bufferingAtStart = false;


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
	return stall;
}

function totalTime(videoElement) {
	return videoElement.duration;
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
				var current_quality = getCurrentPlaybackQuality(videoElement);
				if(current_quality.width != lastWidth || current_quality.height != lastHeight) {
					if(lastWidth == -1 && lastHeight == -1)
						qualityAtTime["0"] = current_quality;
					else
						qualityAtTime[videoElement.currentTime.toString()] = current_quality;
					lastWidth = current_quality.width;
					lastHeight = current_quality.height;
				}
			}
		}
	
	}, chunkInterval);

}

function stopQualityPlaybackMonitor() {
	clearInterval(timerI);
}

function stopBufferSizeInfoMonitor() {
	clearInterval(timerI2);
}

function startBufferSizeInfoMonitor(videoElement, chunkInterval) {
	timerI2 = setInterval(function() {

		if(videoElement.ended) {
			clearInterval(timerI);
			console.log("Video Stopped");
		}
		else {
			if(videoElement.currentTime != null) {
				for(var i = 0; i <  videoElement.buffered.length; i++) {
					if(videoElement.currentTime >=  videoElement.buffered.start(i) && videoElement.currentTime <=  videoElement.buffered.end(i)) {
						bufferFile = bufferFile + i + ',' + videoElement.buffered.start(i) + ',' + videoElement.buffered.end(i) + ',' + (videoElement.buffered.end(i) - videoElement.buffered.start(i)) + ',' + (videoElement.buffered.end(i) - videoElement.currentTime) + '\n';
						console.log("Video inside interval: (" + videoElement.buffered.start(i) + ", " + videoElement.buffered.end(i) + ") playing at: " + videoElement.currentTime + " with " + (videoElement.buffered.end(i) - videoElement.currentTime) + " seconds to play");
					}
					else {
						bufferFile = bufferFile + i + ',' + videoElement.buffered.start(i) + ',' + videoElement.buffered.end(i) + ',' + (videoElement.buffered.end(i) - videoElement.buffered.start(i)) + ',' + "0" + '\n';
					}
				

				}

				
			}
		}
	
	}, chunkInterval);
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
	        if(videoElement.currentTime < 1)
	        	bufferingAtStart = true;
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

function recalcRates(videoElement, interval) {
  
  if (videoElement.readyState <= HTMLMediaElement.HAVE_CURRENT_DATA || videoElement.paused) {
    return;
  }

  decodedPerSec = (videoElement.webkitDecodedFrameCount - decodedFrames)/(interval/1000);
  decodedFrames = videoElement.webkitDecodedFrameCount;

  audioBytesDecodedPerSec = (videoElement.webkitAudioDecodedByteCount - audioBytesDecoded)/(interval/1000);
  audioBytesDecoded = videoElement.webkitAudioDecodedByteCount;

  videoBytesDecodedPerSec = (videoElement.webkitVideoDecodedByteCount - videoBytesDecoded)/(interval/1000);
  videoBytesDecoded = videoElement.webkitVideoDecodedByteCount;

  droppedFramesPerSec = (videoElement.webkitDroppedFrameCount - droppedFrames)/(interval/1000);
  droppedFrames = videoElement.webkitDroppedFrameCount;

  decodedMean.record(decodedPerSec);
  audioMean.record(audioBytesDecodedPerSec);
  videoMean.record(videoBytesDecodedPerSec);
  dropMean.record(droppedFramesPerSec);
  
  
  console.log("Audio bytes decoded: " + videoElement.webkitAudioDecodedByteCount + " average p/s: " + audioMean.mean());
  console.log("Video bytes decoded: " + videoElement.webkitVideoDecodedByteCount + " average p/s: " + videoMean.mean());
  console.log("Decoded frames: " + videoElement.webkitDecodedFrameCount + " average p/s: " + decodedMean.mean());
  console.log("Dropped frames: " + videoElement.webkitDroppedFrameCount + " average p/s: " + dropMean.mean());
  frameRateFile = frameRateFile + videoMean.mean() + ',' + audioMean.mean() + '\n';
}


function startVideoFramesMonitor(videoElement) {
	var interval = 10000;
	timerForVideoFramesMonitor = setInterval(function(){
	 recalcRates(videoElement, interval);
	}, interval);
}

function stopVideoFramesMonitor() {
	clearInterval(timerForVideoFramesMonitor);
}



if(document.getElementsByTagName('video')[0] != null) {


	//$.get( "http://0.0.0.0:3000/id", function( data ) {
  	//	id_ = data.id;
	//});

	var vd = document.getElementsByTagName('video')[0];




	startQualityPlaybackMonitor(vd, 1000);
	startBufferingMonitor(vd);
	startBufferSizeInfoMonitor(vd, 1000)
	startVideoFramesMonitor(vd);

	$("body").append("<a href='' id='dataLink' download='data.csv'></a>");
	var $link = $("#dataLink");


	document.getElementsByTagName('video')[0].addEventListener("ended", function() {
		
		 
		stopBufferingMonitor();
		stopBufferSizeInfoMonitor();
		stopVideoFramesMonitor();
		stopQualityPlaybackMonitor();
		if(stall > 0) {
			if(bufferingAtStart) {
				stallFile = stallFile + "Number of Stalls," + (numberOfStall() - 1) + '\n';
				console.log("Number of Stalls: " + (numberOfStall() - 1));
				stallFile = stallFile + "Start Time," + lengthofStall[0] + '\n';
				
				console.log("Time until video started: " + lengthofStall[0] + " seconds");
				stallFile = stallFile + "Stall Number,Stall Time" + '\n';
				for(var i = 1; i < stall; i++) {
					stallFile = stallFile + (i-1) + "," + lengthofStall[i] + '\n';
					console.log("Length of stall " + i + " was " + lengthofStall[i]);
				};
			}
			else {
				stallFile = stallFile + "Number of Stalls," + numberOfStall() + '\n';
				stallFile = stallFile + "Start Time," + "0" + '\n';
				console.log("Number of Stalls: " + numberOfStall());
				stallFile = stallFile + "Stall Number,Stall Time" + '\n';
				for(var i = 0; i < stall; i++) {
					stallFile = stallFile + i + "," + lengthofStall[i] + '\n';
					console.log("Length of stall " + i + " was " + lengthofStall[i]);
				};
			}
		}



		var size = Object.keys(qualityAtTime).length;
		var keys = Object.keys(qualityAtTime);

		console.log("Total video time: " + totalTime(vd));
		saveFile = saveFile + "Total Video Time," + totalTime(vd) + '\n';
		console.log("Total Played Time: " + totalPlayedTime(vd));
		saveFile = saveFile + "Total Played Time,"+totalPlayedTime(vd) + '\n';

		
		console.log("Playing Quality");
		saveFile = saveFile + "Quality" + '\n';
		saveFile = "Quality Time,Quality width,Quality Height" + '\n';
		for(var i = 0; i < size; i++) {
			saveFile = saveFile + keys[i] + ',' + qualityAtTime[keys[i]].width + ',' + qualityAtTime[keys[i]].height + '\n';
			console.log("Quality at " + keys[i] + " has width = " + qualityAtTime[keys[i]].width + " and height = " + qualityAtTime[keys[i]].height);
		}

		for(i = 0; i < document.getElementsByTagName('video')[0].played.length; i++) {
			playedTimeFile = playedTimeFile + document.getElementsByTagName('video')[0].played.start(i) + ',' + document.getElementsByTagName('video')[0].played.end(i) + '\n';
		}

		saveFile = saveFile + stallFile;
		saveFile = saveFile + playedTimeFile;
		saveFile = saveFile + bufferFile;
		saveFile = saveFile + frameRateFile;
		

    	
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
            }/*, {
                label: 'Close',
                action: function(dialogItself){
                    dialogItself.close();
                }
            }*/]
        });
		

		

		//$.post("http://0.0.0.0:3000/stall", { 'id': id_, 'numberOfStalls': stall , 'stall': JSON.stringfy(lengthofStall)});
	});

	function teste() {

	}
}



