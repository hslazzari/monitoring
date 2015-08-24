

function Simulador(video_element) {
	console.log("Created Simulador");
	
	this.start_timestamp = Date.now();
	this.video_element_ = video_element;
	
	this.startup_time_ = 5000;
	

}


Simulador.prototype.simulate_startup_time = function() {
	this.video_element_.currentTime = 0;
	this.video_element_.pause();
	var vd = this.video_element_;
	setTimeout(function() { 
		vd.play();
	}, this.startup_time_);
}


Simulador.prototype.change_source = function(new_source) {
	var ct = this.video_element_.currentTime;
	var vd = this.video_element_;
	this.video_element_.oncanplay = function() {
    	vd.currentTime = ct;
		vd.play();
		vd.oncanplay = function() {};
	};
	this.video_element_.src = new_source;
}


