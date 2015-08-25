

function Simulador(video_element) {
	console.log("Created Simulador");
	
	this.start_timestamp = Date.now();
	this.video_element_ = video_element;
	
	this.startup_time_ = 5000;
	this.stall_duration_ = 3000;
	this.stall_points_ = {};

	this.timer_for_stall_simulator_;

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

Simulador.prototype.add_stall_duration = function(duration) {
	this.stall_duration_ = duration;
}

Simulador.prototype.add_stalls_at_point = function(percent_points) {
	var vd = this.video_element_;
	var sp = {};
	$.each(percent_points, function( index, value ) {
  		if(value == "bad") {	
  			var position_percent = index.replace("pos", "");


  			var stall_point = {
				percent : position_percent,
				time : (position_percent * vd.duration) / 100.0
            };

            console.log(stall_point.time);
            
            sp[index] = stall_point;
  		}	
	});

	this.stall_points_ = sp;
	

	//60 segundos   = 0% = 0 segundos
	//                50% = 30 segundos
	//                100% = 60 segundos
	//
}

Simulador.prototype.has_ended = function() {
	return false;
}

Simulador.prototype.stop_stall_creator = function() {
	clearInterval(this.timer_for_stall_simulator_);
}

Simulador.prototype.start_stall_creator = function() {
	var self = this;

	this.timer_for_stall_simulator_ = setInterval(function() {
		
		if(self.has_ended()) {
			self.stop_stall_creator();
		}
		else {
			var small = -1;
			var pos;
			$.each(self.stall_points_, function( index, value ) {
		  		if(value.time < small || small == -1) {
		  			small = value.time;
		  			pos = index;
		  		}	
			});

			if(small == -1) {
				self.stop_stall_creator();
			} else {
				if(Math.abs(small - self.video_element_.currentTime) < 0.04) {
					delete self.stall_points_[pos];
					self.video_element_.pause();
					setTimeout(function() { 
						self.video_element_.play();
					}, self.stall_duration_);


				}

			}

		}
	
	}, 50);
}


