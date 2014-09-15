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
		startTime = Date.getTime()
	}
	videoElement.addEventListener("play"), function() {
		totalTime = Date.getTime() - startTime;
	}
);
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