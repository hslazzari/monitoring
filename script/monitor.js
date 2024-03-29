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

function Monitor(video_element, url) {
	console.log("Created Monitor");
	
	this.start_timestamp = Date.now();
	this.netmetric_ = "";

	this.video_element_ = video_element;
	console.log(this.video_element_);
	this.url_ = url;
	// Variable of stall information

	this.stall_ = 0;
	this.stall_length_ = [];
	this.total_stall_length_ = 0;
	this.current_video_position_ = 0;
	this.timestamp_of_stall_ = Date.now();
								

	//Control Variable to stall counter

	this.timer_for_stall_counter_;
	this.last_play_postion_ = 0;
	this.loading_time_ = false;
	this.start_buffering_time_ = 0;
	this.stall_detected_ = false;
	this.minimum_stall_lenght_;

	//Control Variable to Playback Quality Monitor

	this.timer_for_playback_quality_;
	this.last_width = -1;
	this.last_height = -1;

	//Quality interval
	this.playback_quality_at_time_ = [];


	// Frames information

	this.frames_per_second_ = [];
	this.video_bytes_decoded_per_second_ = [];
	this.audio_bytes_decoded_per_second_ = [];

	// Frames control variable

	this.timer_for_frames_monitor_;

	this.decoded_frames_ = 0;
	this.audio_bytes_decoded_ = 0;
	this.video_bytes_decoded_ = 0;
	this.dropped_frames_ = 0;

	this.decoded_mean = new Mean();
	this.audio_mean = new Mean();
	this.video_mean = new Mean();
	this.drop_mean = new Mean();


	//Buffer Monitor
	this.timer_for_buffer_monitor_;
	this.seconds_available_to_play_in_buffer_ = [];

	//Muted and volume

	this.timer_for_muted_and_volume_;
	this.previous_volume = -1;
	this.previous_mute = -1;

	this.mute_state_at_time_ = [];
	this.volume_at_time_ = [];


	// Network state
	this.timer_for_network_state_;
	this.previous_network_state_ = -1;
	this.network_state_at_time_ = [];

	// End information
	this.left_time = -1;

	// Skip monitor information

	this.timer_for_skip_monitor_;
	this.start_skip_ = false;
	this.start_video_timestamp_ = Date.now();
	this.start_video_position_ = 0;
	this.previous_video_position_ = 0;
	this.previous_video_timestamp_ = Date.now();
	this.skip_info_ = [];
						



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

Monitor.prototype.set_left_time = function() {
	this.left_time = this.video_element_.currentTime;
}

Monitor.prototype.get_left_time = function() {
	if(this.left_time == -1) 
		return this.video_element_.currentTime;
	else
		return this.left_time;
}

Monitor.prototype.get_current_playback_resolution = function() {
	var playbackResolutionPair = {'width' : this.video_element_.videoWidth, 'height' : this.video_element_.videoHeight};

	return playbackResolutionPair;
}

Monitor.prototype.total_played_time = function() {
	var total_time = 0;
	for(var i = 0; i < this.video_element_.played.length; i++) {
		total_time = total_time + (this.video_element_.played.end(i) - this.video_element_.played.start(i));
	}
	return total_time;
}

Monitor.prototype.played_time = function() {
	var played_time_interval = [];
	for(var i = 0; i < this.video_element_.played.length; i++) {
		played_time_interval.push({'start' : this.video_element_.played.start(i), 'end' : this.video_element_.played.end(i)});
	}

	return played_time_interval;
}

Monitor.prototype.total_played_time_with_stall = function() {
	return this.total_played_time() + this.total_stall_length();
}

Monitor.prototype.total_stall_length = function() {
	return this.total_stall_length_;	
}


Monitor.prototype.increment_number_of_stall = function(stall_length) {
	if(stall_length > this.minimum_stall_lenght_) {
		this.total_stall_length_ = this.total_stall_length_ + stall_length;
		this.stall_length_.push({
									current_video_position : this.current_video_position_,
									timestamp_of_stall : this.timestamp_of_stall_,
									duration_of_stall : stall_length

								});
		this.stall_ = this.stall_ + 1;	
	}

	
}

Monitor.prototype.total_number_of_stall = function() {
	return this.stall_;
}

Monitor.prototype.length_of_each_stall = function() {
	return this.stall_length_;
}

Monitor.prototype.video_duration = function() {
	return this.video_element_.duration;
}

Monitor.prototype.is_paused = function() {
	return this.video_element_.paused;
}


Monitor.prototype.has_ended = function() {
	return this.video_element_.ended;
}



Monitor.prototype.stop_stall_monitor = function() {
	clearInterval(this.timer_for_stall_counter_);
}

Monitor.prototype.start_stall_monitor = function(check_interval_in_miliseconds) {
	//this.stop_stall_monitor();
	var self = this;
	self.minimum_stall_lenght_ = check_interval_in_miliseconds/1000.0;

	this.timer_for_stall_counter_= setInterval(function() {


		current_play_position = self.video_element_.currentTime;
		var offset = 1 / check_interval_in_miliseconds;

	    // if no buffering is currently detected,
	    // and the position does not seem to increase
	    // and the player isn't manually paused...
	    if(    self.stall_detected_ == false
	        && current_play_position < (self.last_play_postion_ + offset)
	        && (self.is_paused() == false)
	    ) {
	    
	    	self.start_buffering_time_ = new Date().getTime();
	       	self.stall_detected_ = true
	       	self.current_video_position_ = self.video_element_.currentTime;
	       	self.timestamp_of_stall_ = Date.now();

	        if(current_play_position <= offset)
	        	self.loading_time_ = true;
	    }

	    // if we were buffering but the player has advanced,
	    // then there is no buffering
	    if (
	           self.stall_detected_ 
	        && current_play_position > (self.last_play_postion_ + offset)
	        && self.is_paused() == false	
	    ) {
	    	
	    	var length_of_stall_in_seconds = ((new Date().getTime() - self.start_buffering_time_)/1000);
	    	self.increment_number_of_stall(length_of_stall_in_seconds);
			self.stall_detected_ = false
	    }
	    self.last_play_postion_ = current_play_position;

	    if(self.has_ended()) {
			self.stop_stall_monitor();
		}
		


	}, 50);
}

Monitor.prototype.stop_playback_quality_monitor = function() {
	clearInterval(this.timer_for_playback_quality_);
}

Monitor.prototype.start_playback_quality_monitor = function(check_interval_in_miliseconds) {
	var self = this;

	this.timer_for_playback_quality_ = setInterval(function() {
		
		if(self.has_ended()) {
			self.stop_playback_quality_monitor();
		}
		else {
			if(self.video_element_.currentTime != null) {
				var current_quality = self.get_current_playback_resolution();



				if(current_quality.width != self.last_width || current_quality.height != self.last_height) {
					var quality_p = {
						timestamp_of_quality : Date.now(),
		              	current_video_position : self.video_element_.currentTime,
		              	video_width : current_quality.width,
		              	video_height: current_quality.height,
					};

					if(self.last_width == -1 && self.last_height == -1)
						quality_p.current_video_position = 0;


					self.playback_quality_at_time_.push(quality_p);

					self.last_width = current_quality.width;
					self.last_height = current_quality.height;
				}
			}
		}
	
	}, check_interval_in_miliseconds);
}

Monitor.prototype.playback_quality = function() {
	return this.playback_quality_at_time_;
}

Monitor.prototype.store_frame_per_second = function(interval, decoded_frames_per_second) {
	var frame_p = {
		timestamp_of_frame : Date.now(),
        current_video_position : interval,
        number_of_frames: decoded_frames_per_second
    };
	this.frames_per_second_.push(frame_p);
}

Monitor.prototype.frame_per_second = function() {
	return this.frames_per_second_;
}



Monitor.prototype.store_video_bytes_decoded_per_second = function(interval, video_bytes_decoded_per_second) {
	var video_p = {
		current_video_position : interval,
    	timestamp_of_video_bytes_decoded : Date.now(),
    	video_bytes : video_bytes_decoded_per_second
    };

	this.video_bytes_decoded_per_second_.push(video_p);
}

Monitor.prototype.video_bytes_decoded_per_second = function() {
	return this.video_bytes_decoded_per_second_;
}



Monitor.prototype.store_audio_bytes_decoded_per_second = function(interval, audio_bytes_decoded_per_second) {
	var audio_p = {
		current_video_position : interval,
        timestamp_of_audio_bytes_decoded : Date.now(),
        audio_bytes : audio_bytes_decoded_per_second
	}
	
	this.audio_bytes_decoded_per_second_.push(audio_p);
}

Monitor.prototype.audio_bytes_decoded_per_second = function() {
	return this.audio_bytes_decoded_per_second_;
}



Monitor.prototype.get_dropped_frames = function() {
	return this.video_element_.webkitDroppedFrameCount;
}


Monitor.prototype.recalculate_frame_rates = function(self, time_interval) {
	if (self.video_element_.readyState <= HTMLMediaElement.HAVE_CURRENT_DATA || self.is_paused()) {
		return;
	}
	decoded_frames_per_second = (self.video_element_.webkitDecodedFrameCount - self.decoded_frames_)/(time_interval/1000);
	self.decoded_frames_ = self.video_element_.webkitDecodedFrameCount;

	
	audio_bytes_decoded_per_second = (self.video_element_.webkitAudioDecodedByteCount - self.audio_bytes_decoded_)/(time_interval/1000);
	self.audio_bytes_decoded_ = self.video_element_.webkitAudioDecodedByteCount;

	video_bytes_decoded_per_second = (self.video_element_.webkitVideoDecodedByteCount - self.video_bytes_decoded_)/(time_interval/1000);
	self.video_bytes_decoded_ = self.video_element_.webkitVideoDecodedByteCount;


	self.store_frame_per_second(self.video_element_.currentTime, decoded_frames_per_second);
	self.store_audio_bytes_decoded_per_second(self.video_element_.currentTime, audio_bytes_decoded_per_second);
	self.store_video_bytes_decoded_per_second(self.video_element_.currentTime, video_bytes_decoded_per_second);


	//this.decoded_mean.record(decoded_frames_per_second);
	//this.audio_mean.record(audio_bytes_decoded_per_second);
	//this.video_mean.record(video_bytes_decoded_per_second);
	//console.log("Audio bytes decoded: " + videoElement.webkitAudioDecodedByteCount + " average p/s: " + audioMean.mean());
    //console.log("Video bytes decoded: " + videoElement.webkitVideoDecodedByteCount + " average p/s: " + videoMean.mean());
    //console.log("Decoded frames: " + videoElement.webkitDecodedFrameCount + " average p/s: " + decodedMean.mean());
    //console.log("Dropped frames: " + videoElement.webkitDroppedFrameCount + " average p/s: " + dropMean.mean());
} 



Monitor.prototype.stop_video_frames_monitor = function() {
	clearInterval(this.timer_for_frames_monitor_);
}

Monitor.prototype.start_video_frames_monitor = function(check_interval_in_miliseconds) {
	var self = this;
	this.timer_for_frames_monitor_ = setInterval(function(){
		if(self.has_ended()) {
			self.stop_video_frames_monitor();
		} else {
			self.recalculate_frame_rates(self, check_interval_in_miliseconds);
		}
	}, check_interval_in_miliseconds);
}


Monitor.prototype.stop_buffer_monitor = function() {
	clearInterval(this.timer_for_buffer_monitor_);
}

Monitor.prototype.store_time_in_buffer = function(buffer_obj) {
	this.seconds_available_to_play_in_buffer_.push(buffer_obj);
}

Monitor.prototype.time_in_buffer = function() {
	return this.seconds_available_to_play_in_buffer_;
}



Monitor.prototype.start_buffer_monitor = function(check_interval_in_miliseconds) {
	var self = this;
	this.timer_for_buffer_monitor_ = setInterval(function() {
		if(self.has_ended()) {
			self.stop_buffer_monitor();
		}
		else {
			if(self.video_element_.currentTime != null) {
				has_time = false;
				current_play_position = self.video_element_.currentTime;

				for(var i = 0; i <  self.video_element_.buffered.length; i++) {
					if(current_play_position >=  self.video_element_.buffered.start(i) && current_play_position <=  self.video_element_.buffered.end(i)) {
						var buffer_p = {
							current_video_position : current_play_position,
				            timestamp_of_time : Date.now(),
				            remaining_time_in_buffer : self.video_element_.buffered.end(i) - current_play_position
						};

						self.store_time_in_buffer(buffer_p);
						has_time = true;
					}
				}
				if(has_time == false) {
					var buffer_p = {
						current_video_position : current_play_position,
				        timestamp_of_time : Date.now(),
				        remaining_time_in_buffer : 0
					};

					self.store_time_in_buffer(buffer_p);
				}
			}
		}
	}, check_interval_in_miliseconds);
}



Monitor.prototype.buffer_time = function() {
	var buffered_time_interval = [];
	for(var i = 0; i < this.video_element_.buffered.length; i++) {
		buffered_time_interval.push({'start' : this.video_element_.buffered.start(i), 'end' : this.video_element_.buffered.end(i)});
	}

	return buffered_time_interval;
}


Monitor.prototype.stop_all_monitoring = function() {
	console.log("Stop all monitoring process");
	this.stop_buffer_monitor();
	this.stop_stall_monitor();
	this.stop_playback_quality_monitor();
	this.stop_video_frames_monitor();
	this.stop_muted_and_volume_monitor();
	this.stop_network_state_monitor();
	this.stop_skip_monitor();
}

Monitor.prototype.start_all_monitoring = function(interval_of_monitoring, duration_of_each_stall) {
	console.log("Start all monitoring process");
	console.log("Minimum detected stall " + duration_of_each_stall.toString());
	console.log("Minimum detected change of other process " + interval_of_monitoring.toString());

	this.start_stall_monitor(duration_of_each_stall);
	this.start_playback_quality_monitor(interval_of_monitoring);
	this.start_video_frames_monitor(interval_of_monitoring);
	this.start_buffer_monitor(interval_of_monitoring);
	this.start_muted_and_volume_monitor(interval_of_monitoring);
	this.start_network_state_monitor(interval_of_monitoring);
	this.start_skip_monitor();
}

Monitor.prototype.stop_muted_and_volume_monitor = function() {
	clearInterval(this.timer_for_muted_and_volume_);
}

Monitor.prototype.start_muted_and_volume_monitor = function(check_interval_in_miliseconds) {
	var self = this;

	this.timer_for_muted_and_volume_ = setInterval(function() {
		if(self.has_ended()) {
			self.stop_muted_and_volume_monitor();
		}
		else {
			if(self.video_element_.currentTime != null) {
				var volume_now = self.video_element_.volume;
				var muted_now = self.video_element_.muted;

				if(volume_now != self.previous_volume_) {
					var volume_p = {
						current_video_position : self.video_element_.currentTime,
			            timestamp_of_volume : Date.now(),
			            volume : volume_now

					};
					self.volume_at_time_.push(volume_p);
					self.previous_volume_ = volume_now;
				}

				//Muted mute_state = 1;
				//else 
				//mute_state = 0
				var mute_state = 1;
				if(muted_now == false)
					mute_state = 0;

				if(self.previous_mute_ != mute_state) {
					var mute_state_p = {
						  timestamp_of_mute_state : Date.now(),
			              current_video_position : self.video_element_.currentTime,
			              state: mute_state
					};
					self.mute_state_at_time_.push(mute_state_p);

					self.previous_mute_ = mute_state;
				}
			}
		}
	
	}, check_interval_in_miliseconds);
}

/*
Represents the current network state of the audio/video element:
0 = NETWORK_EMPTY - audio/video has not yet been initialized
1 = NETWORK_IDLE - audio/video is active and has selected a resource, but is not using the network
2 = NETWORK_LOADING - browser is downloading data
3 = NETWORK_NO_SOURCE - no audio/video source found
*/



Monitor.prototype.stop_network_state_monitor = function() {
	clearInterval(this.timer_for_network_state_);
}



Monitor.prototype.start_network_state_monitor = function(check_interval_in_miliseconds) {
	var self = this;

	this.timer_for_network_state_ = setInterval(function() {
		
		if(self.has_ended()) {
			self.stop_network_state_monitor();
		}
		else {
			if(self.video_element_.currentTime != null) {

				var current_network_state = self.video_element_.networkState;

				if(current_network_state != self.previous_network_state_) {
					var network_p = {
						timestamp_of_network_state : Date.now(),
            			current_video_position : self.video_element_.currentTime,
            			state: current_network_state
              		};
					self.network_state_at_time_.push(network_p);
					self.previous_network_state_ = current_network_state;
				}

			}
		}
	
	}, check_interval_in_miliseconds);
}


Monitor.prototype.store_skip_info = function(video_position, timestamp, skip_time) {
	var skip_p = {
		current_video_position : video_position,
        timestamp_of_skip : timestamp,
        skip_duration :  skip_time
	};

	this.skip_info_.push(skip_p);
}

Monitor.prototype.skip_info = function() {
	return this.skip_info_;
}


Monitor.prototype.stop_skip_monitor = function() {
	clearInterval(this.timer_for_skip_monitor_);
}

Monitor.prototype.start_skip_monitor = function() {
	var self = this;

	this.timer_for_skip_monitor_ = setInterval(function() {
		
		if(self.has_ended()) {
			self.stop_skip_monitor();
		}
		else {
			if(self.video_element_.currentTime != null) {
				var current_play_position = self.video_element_.currentTime;
				if(self.start_skip_ == true) {
					if(Math.abs(current_play_position - self.previous_video_position_) <= 0.15 && Math.abs(current_play_position - self.previous_video_position_) > 0) {
						self.start_skip_ = false;
						self.store_skip_info(self.start_video_position_, self.start_video_timestamp_, self.video_element_.currentTime - self.start_video_position_);
						self.previous_video_position_ = current_play_position;
					} else {
						self.previous_video_position_ = current_play_position;
					}
				}
				else {
					//console.log(Math.abs(current_play_position - self.previous_video_position_));
					if(Math.abs(current_play_position - self.previous_video_position_) > 0.15 || Math.abs(current_play_position - self.previous_video_position_) == 0) {
						self.start_skip_ = true;
						
					}
					else {
						self.previous_video_position_ = current_play_position;
						self.start_video_timestamp_ = Date.now();
						self.start_video_position_ = current_play_position;
					}
				}



				
			}
		}
	
	}, 100);
}






Monitor.prototype.network_state_at_time = function() {
	return this.network_state_at_time_;
}

Monitor.prototype.mute_state = function() {
	return this.mute_state_at_time_;
}

Monitor.prototype.volume_at_time = function() {
	return this.volume_at_time_;
}

Monitor.prototype.video_source = function() {
	var source_list = [];

	source_list.push(this.url_);
	
	if(this.video_element_.src != "") {
		source_list.push(this.video_element_.src);
	}

	for(var i = 0; i < this.video_element_.children.length; i++) {
		if(this.video_element_.children[i].src != "") {
			source_list.push(this.video_element_.children[i].src);
		}
	}

	return source_list;

}

Monitor.prototype.setNetmetricId = function(netmetric) {
	this.netmetric_ = netmetric;
}

Monitor.prototype.json = function() {
	var return_object = {};
	return_object["start_timestamp"] = this.start_timestamp;
	
	if(this.netmetric_ == null)
		this.netmetric_ = "";

	return_object["netmetric"] = this.netmetric_;
	return_object["left_time"] = this.get_left_time();
	return_object["video_preload"] = this.video_element_.preload;
	return_object["total_played_time"] = this.total_played_time();
	return_object["total_played_time_with_stall"] = this.total_played_time_with_stall();
	return_object["total_stall_length"] = this.total_stall_length();
	return_object["total_number_of_stall"] = this.total_number_of_stall();
	return_object["dropped_frames"] = this.get_dropped_frames();
	return_object["video_duration"] = this.video_duration();

	var stall_result = this.length_of_each_stall();

	if(this.loading_time_ && stall_result.length > 0)
		return_object["video_start_time"] = stall_result[0].duration_of_stall;
	else
		return_object["video_start_time"] = 0;
		
	return_object["length_of_each_stall"] = this.length_of_each_stall();
	return_object["playback_quality"] = this.playback_quality();
	return_object["mute_state"] = this.mute_state();
	return_object["volume_at_time"] = this.volume_at_time();
	return_object["played_time_interval"] = this.played_time();
	return_object["buffer_time"] = this.buffer_time();
	return_object["video_bytes_decoded_per_second"] = this.video_bytes_decoded_per_second();
	return_object["audio_bytes_decoded_per_second"] = this.audio_bytes_decoded_per_second();
	return_object["time_in_buffer"] = this.time_in_buffer();
	return_object["video_source"] = this.video_source();
	return_object["network_state_at_time"] = this.network_state_at_time();
	return_object["frame_per_second"] = this.frame_per_second();
	return_object["skip_play"] = this.skip_info();
	
	
	return return_object;
}
