var express = require('express');
//var mongoose = require('mongoose');
var bodyParser = require("body-parser");
var app = express()

//app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(express.static(__dirname + "/public"));


var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'prav',
  database: 'monitor'
});
 
connection.connect();
var video_information_id_ = 0;

connection.query('SELECT MAX(video_information_id) AS result FROM video_information', function(err, rows, fields) {
  if (err)
    console.log(err);
  else {
    if(rows[0].result == null) 
        video_information_id_ = 0;
    else
        video_information_id_ = rows[0].result + 1;
  }

    
});


var XMLWriter = require('xml-writer');
var fs = require('fs');

var xw = new XMLWriter;


var sys = require('sys')
var exec = require('child_process').exec;

function puts(error, stdout, stderr) { sys.puts(stdout) }
exec("ls -la", puts);
    
  

/*
var Schema = mongoose.Schema;  

var UserQoE = new Schema({
  ip: String,
  timestamp : Number,
  total_played_time: Number,
  played_time_interval: [Schema.Types.Mixed],
  total_played_time_with_stall: Number,
  total_stall_length: Number,
  total_number_of_stall: Number,
  length_of_each_stall: [Number],
  video_duration: Number,
  playback_quality: [Schema.Types.Mixed],
  frame_per_second: [Schema.Types.Mixed],
  video_bytes_decoded_per_second: [Schema.Types.Mixed],
  audio_bytes_decoded_per_second: [Schema.Types.Mixed],
  dropped_frames: Number,
  time_in_buffer: [Schema.Types.Mixed],
  buffer_time: [Schema.Types.Mixed],
  mute_state: [Schema.Types.Mixed],
  volume_at_time: [Schema.Types.Mixed],
  video_preload: String,
  video_source: [String],
  network_state_at_time: [Schema.Types.Mixed],
  left_time : Number
});
*/
//var UserQoEModel = mongoose.model('UserQoE', UserQoE);

//mongoose.connect( 'mongodb://localhost/user_qoe' );

app.get('/api/users', function (req, res){
  /*

    UserQoEModel.find({}, function (err, docs) {
        res.json(docs);
    });



*/

  


});

function insert_into_video_information(req) {
  xw = new XMLWriter;
  
  xw.startDocument('1.0', 'UTF-8', false);
  xw.startElement('report');
  console.log(req.body.netmetric);
  xw.startElement("user").text("agentesslufrgs").endElement();
  xw.startElement("uuid").text("1a164c1b-9529-400b-b768-4fe50932669f").endElement();
  var timestamp_now = Date.now();
  xw.startElement('timestamp').text(timestamp_now /1000 | 0).endElement();
  xw.startElement('agent_type').text('linux').endElement();
  xw.startElement('meas_uuid').text(req.body.netmetric).endElement();
  xw.startElement('droidVersion').text('14.04').endElement();
  xw.startElement('version').text('6.1.3').endElement();
  xw.startElement('results');
  xw.startElement('video_information');
  var file_name = randomString(64, "aA#");



  var video_id = video_information_id_;

  var info  = { 
              ip: req.ip, 
              start_timestamp: req.body.start_timestamp,
              hash: randomString(64, "aA#"),
              total_played_time: req.body.total_played_time,
              total_played_time_with_stall: req.body.total_played_time_with_stall,
              total_stall_length: req.body.total_stall_length,
              total_number_of_stall: req.body.total_number_of_stall,
              video_duration: req.body.video_duration,
              dropped_frames: req.body.dropped_frames,
              left_time: req.body.left_time,
              video_preload : req.body.video_preload,
              video_start_time : req.body.video_start_time,
              netmetric : req.body.netmetric,
              video_information_id : video_id
            };

  xw.startElement('ip').text(req.ip).endElement();
  xw.startElement('start_timestamp').text(req.body.start_timestamp).endElement();
  xw.startElement('hash').text(file_name).endElement();
  xw.startElement('total_played_time').text(req.body.total_played_time).endElement();
  xw.startElement('total_played_time_with_stall').text(req.body.total_played_time_with_stall).endElement();
  xw.startElement('total_stall_length').text(req.body.total_stall_length).endElement();
  xw.startElement('total_number_of_stall').text(req.body.total_number_of_stall).endElement();
  xw.startElement('video_duration').text(req.body.video_duration).endElement();
  xw.startElement('dropped_frames').text(req.body.dropped_frames).endElement();
  xw.startElement('left_time').text(req.body.left_time).endElement();
  xw.startElement('video_preload').text(req.body.video_preload).endElement();
  xw.startElement('video_start_time').text(req.body.video_start_time).endElement();
  xw.startElement('netmetric').text(req.body.netmetric).endElement();
  xw.startElement('video_information_id').text(video_id).endElement();
  xw.endElement();




  video_information_id_ = video_information_id_+1;
  console.log("INSERIR")
  var query = connection.query('INSERT INTO video_information SET ?', info, function(err, result) {
    if(err)
      console.log(err);
    else
      console.log(result);
  });
  return {'video_id' : video_id, 'file_name' : timestamp_now.toString() + '-' + file_name};
}

function insert_into_video_source_xml(req, video_id, index) {
  //xw.startElement('video_source');
  xw.startElement('source').text(req.body.video_source[index]).endElement();
  xw.startElement('video_information_id').text(video_id).endElement();
  //xw.endElement();
}

function insert_into_video_source(req, video_id) {
  if(req.body.video_source != null) {
    xw.startElement('video_source');
    for(i = 0; i < req.body.video_source.length; i++) {
      var info  = { 
                source : req.body.video_source[i],
                video_information_id : video_id 
      };
      
      if(req.body.video_source.length > 1) {
        xw.startElement("multiple_entry");
      }

      insert_into_video_source_xml(req, video_id, i);

      if(req.body.video_source.length > 1) {
        xw.endElement();
      }

      var query = connection.query('INSERT INTO video_source SET ?', info, function(err, result) {
        if(err)
          console.log(err);

      });
    }
    xw.endElement();
}
  
}

function insert_into_volume_state_xml(req, video_id, index) {
  //xw.startElement('volume_state');
  xw.startElement('current_video_position').text(req.body.volume_at_time[index].current_video_position).endElement();
  xw.startElement('timestamp_of_volume').text(req.body.volume_at_time[index].timestamp_of_volume).endElement();
  xw.startElement('video_information_id').text(video_id).endElement();
  xw.startElement('volume').text(req.body.volume_at_time[index].volume).endElement();
  //xw.endElement();
}

function insert_into_volume_state(req, video_id) {
  if(req.body.volume_at_time  != null) {
    xw.startElement('volume_state');
    for(i = 0; i < req.body.volume_at_time.length; i++) {
      var info  = { 
                current_video_position : req.body.volume_at_time[i].current_video_position,
                timestamp_of_volume : req.body.volume_at_time[i].timestamp_of_volume,
                video_information_id : video_id,
                volume : req.body.volume_at_time[i].volume
      };
      if(req.body.volume_at_time.length > 1) {
        xw.startElement("multiple_entry");
      }
      
      insert_into_volume_state_xml(req, video_id, i);
      
      if(req.body.volume_at_time.length > 1) {
        xw.endElement();
      }
      var query = connection.query('INSERT INTO volume_state SET ?', info, function(err, result) {
        if(err)
          console.log(err);
      });
    }
    xw.endElement();
  }
  
}

function insert_into_video_bytes_decoded_per_second_xml(req, video_id, index) {
  //xw.startElement('video_bytes_decoded_per_second');
  xw.startElement('current_video_position').text(req.body.video_bytes_decoded_per_second[index].current_video_position).endElement();
  xw.startElement('timestamp_of_video_bytes_decoded').text(req.body.video_bytes_decoded_per_second[index].timestamp_of_video_bytes_decoded).endElement();
  xw.startElement('video_information_id').text(video_id).endElement();
  xw.startElement('video_bytes').text(req.body.video_bytes_decoded_per_second[index].video_bytes).endElement();
  //xw.endElement();
}

function insert_into_video_bytes_decoded_per_second(req, video_id) {
  if(req.body.video_bytes_decoded_per_second != null) {
    xw.startElement('video_bytes_decoded_per_second');
    for(i = 0; i < req.body.video_bytes_decoded_per_second.length; i++) {
      var info  = { 
                current_video_position : req.body.video_bytes_decoded_per_second[i].current_video_position,
                timestamp_of_video_bytes_decoded : req.body.video_bytes_decoded_per_second[i].timestamp_of_video_bytes_decoded,
                video_information_id : video_id,
                video_bytes : req.body.video_bytes_decoded_per_second[i].video_bytes
      };

      if(req.body.video_bytes_decoded_per_second.length > 1) {
        xw.startElement("multiple_entry");
      }

      insert_into_video_bytes_decoded_per_second_xml(req, video_id, i);

      if(req.body.video_bytes_decoded_per_second.length > 1) {
        xw.endElement();
      }


      var query = connection.query('INSERT INTO video_bytes_decoded_per_second SET ?', info, function(err, result) {
        if(err)
          console.log(err);
      });
    }
    xw.endElement();
  }
  
}

function insert_into_audio_bytes_decoded_per_second_xml(req, video_id, index) {
  //xw.startElement('audio_bytes_decoded_per_second');
  xw.startElement('current_video_position').text(req.body.audio_bytes_decoded_per_second[index].current_video_position).endElement();
  xw.startElement('timestamp_of_audio_bytes_decoded').text(req.body.audio_bytes_decoded_per_second[index].timestamp_of_audio_bytes_decoded).endElement();
  xw.startElement('video_information_id').text(video_id).endElement();
  xw.startElement('audio_bytes').text(req.body.audio_bytes_decoded_per_second[index].audio_bytes).endElement();
  //xw.endElement();
}

function insert_into_audio_bytes_decoded_per_second(req, video_id) {
  if(req.body.audio_bytes_decoded_per_second != null) {
    xw.startElement('audio_bytes_decoded_per_second');
    for(i = 0; i < req.body.audio_bytes_decoded_per_second.length; i++) {
      var info  = { 
                current_video_position : req.body.audio_bytes_decoded_per_second[i].current_video_position,
                timestamp_of_audio_bytes_decoded : req.body.audio_bytes_decoded_per_second[i].timestamp_of_audio_bytes_decoded,
                video_information_id : video_id,
                audio_bytes : req.body.audio_bytes_decoded_per_second[i].audio_bytes
      };

      if(req.body.audio_bytes_decoded_per_second.length > 1) {
        xw.startElement("multiple_entry");
      }

      insert_into_audio_bytes_decoded_per_second_xml(req, video_id, i);

      if(req.body.audio_bytes_decoded_per_second.length > 1) {
        xw.endElement();
      }

      var query = connection.query('INSERT INTO audio_bytes_decoded_per_second SET ?', info, function(err, result) {
        if(err)
          console.log(err);
      });
    }
    xw.endElement();
  }
  
}

function insert_into_time_in_buffer_xml(req, video_id, index) {
  //xw.startElement('time_in_buffer');
  xw.startElement('current_video_position').text(req.body.time_in_buffer[index].current_video_position).endElement();
  xw.startElement('timestamp_of_time').text(req.body.time_in_buffer[index].timestamp_of_time).endElement();
  xw.startElement('video_information_id').text(video_id).endElement();
  xw.startElement('remaining_time_in_buffer').text(req.body.time_in_buffer[index].remaining_time_in_buffer).endElement();
  //xw.endElement();
}

function insert_into_time_in_buffer(req, video_id) {
  if(req.body.time_in_buffer != null) {
    xw.startElement('time_in_buffer');
    for(i = 0; i < req.body.time_in_buffer.length; i++) {
      var info  = { 
                current_video_position : req.body.time_in_buffer[i].current_video_position,
                timestamp_of_time : req.body.time_in_buffer[i].timestamp_of_time,
                video_information_id : video_id,
                remaining_time_in_buffer : req.body.time_in_buffer[i].remaining_time_in_buffer
      };
      
      if(req.body.time_in_buffer.length > 1) {
        xw.startElement("multiple_entry");
      }
      
      insert_into_time_in_buffer_xml(req, video_id, i);

      if(req.body.time_in_buffer.length > 1) {
        xw.endElement();
      }

      var query = connection.query('INSERT INTO time_in_buffer SET ?', info, function(err, result) {
        if(err)
          console.log(err);
      });
    }
    xw.endElement();
  }
  
}

function insert_into_skip_play_xml(req, video_id, index) {
  //xw.startElement('skip_play');
  xw.startElement('current_video_position').text(req.body.skip_play[index].current_video_position).endElement();
  xw.startElement('timestamp_of_skip').text(req.body.skip_play[index].timestamp_of_skip).endElement();
  xw.startElement('skip_duration').text(req.body.skip_play[index].skip_duration).endElement();
  xw.startElement('video_information_id').text(video_id).endElement();
  //xw.endElement();
}


function insert_into_skip_play(req, video_id) {
  if(req.body.skip_play != null) {
    xw.startElement('skip_play');
    for(i = 0; i < req.body.skip_play.length; i++) {
      var info  = { 
                current_video_position : req.body.skip_play[i].current_video_position,
                timestamp_of_skip : req.body.skip_play[i].timestamp_of_skip,
                skip_duration : req.body.skip_play[i].skip_duration,
                video_information_id : video_id
      };

      if(req.body.skip_play.length > 1) {
        xw.startElement("multiple_entry");
      }

      insert_into_skip_play_xml(req, video_id, i);

      if(req.body.skip_play.length > 1) {
        xw.endElement();
      }

      var query = connection.query('INSERT INTO skip_play SET ?', info, function(err, result) {
        if(err)
          console.log(err);
      });
    }
    xw.endElement();
  }
  
}

function insert_into_played_interval_xml(req, video_id, index) {
  //xw.startElement('played_interval');
  xw.startElement('start_play').text(req.body.played_time_interval[index].start).endElement();
  xw.startElement('end_play').text(req.body.played_time_interval[index].end).endElement();
  xw.startElement('video_information_id').text(video_id).endElement();
  //xw.endElement();
}



function insert_into_played_interval(req, video_id) {
  if(req.body.played_time_interval != null) {
    xw.startElement('played_interval');
    for(i = 0; i < req.body.played_time_interval.length; i++) {
      var info  = { 
                start_play : req.body.played_time_interval[i].start,
                end_play : req.body.played_time_interval[i].end,
                video_information_id : video_id
      };

      if(req.body.played_time_interval.length > 1) {
        xw.startElement("multiple_entry");
      }

      insert_into_played_interval_xml(req, video_id, i);

      if(req.body.played_time_interval.length > 1) {
        xw.endElement();
      }

      var query = connection.query('INSERT INTO played_interval SET ?', info, function(err, result) {
        if(err)
          console.log(err);
      });
    }
    xw.endElement();
  }
  
}

function insert_into_playback_quality_xml(req, video_id, index) {
  //xw.startElement('playback_quality');
  xw.startElement('timestamp_of_quality').text(req.body.playback_quality[index].timestamp_of_quality).endElement();
  xw.startElement('current_video_position').text(req.body.playback_quality[index].current_video_position).endElement();
  xw.startElement('video_width').text(req.body.playback_quality[index].video_width).endElement();
  xw.startElement('video_height').text(req.body.playback_quality[index].video_height).endElement();
  xw.startElement('video_information_id').text(video_id).endElement();
  //xw.endElement();

}

function insert_into_playback_quality(req, video_id) {
  if(req.body.playback_quality != null) {
    xw.startElement('playback_quality');
    for(i = 0; i < req.body.playback_quality.length; i++) {

      var info  = { 
                timestamp_of_quality : req.body.playback_quality[i].timestamp_of_quality,
                current_video_position : req.body.playback_quality[i].current_video_position,
                video_width : req.body.playback_quality[i].video_width,
                video_height: req.body.playback_quality[i].video_height,
                video_information_id : video_id
      };

      if(req.body.playback_quality.length > 1) {
        xw.startElement("multiple_entry");
      }

      insert_into_playback_quality_xml(req, video_id, i);

      if(req.body.playback_quality.length > 1) {
        xw.endElement();
      }

      var query = connection.query('INSERT INTO playback_quality SET ?', info, function(err, result) {
        if(err)
          console.log(err);
      });
    }
    xw.endElement();
  }
  
}

function insert_into_network_state_xml(req, video_id, index) {
  //xw.startElement('network_state');
  xw.startElement('timestamp_of_network_state').text(req.body.network_state_at_time[index].timestamp_of_network_state).endElement();
  xw.startElement('current_video_position').text(req.body.network_state_at_time[index].current_video_position).endElement();
  xw.startElement('state').text(req.body.network_state_at_time[index].state).endElement();
  xw.startElement('video_information_id').text(video_id).endElement();
  //xw.endElement();
}

function insert_into_network_state(req, video_id) {
  if(req.body.network_state_at_time != null) {
    xw.startElement('network_state');
    for(i = 0; i < req.body.network_state_at_time.length; i++) {
      var info  = { 
                timestamp_of_network_state : req.body.network_state_at_time[i].timestamp_of_network_state,
                current_video_position : req.body.network_state_at_time[i].current_video_position,
                state: req.body.network_state_at_time[i].state,
                video_information_id : video_id
      };

      if(req.body.network_state_at_time.length > 1) {
        xw.startElement("multiple_entry");
      }

      insert_into_network_state_xml(req, video_id, i);

      if(req.body.network_state_at_time.length > 1) {
        xw.endElement();
      }

      var query = connection.query('INSERT INTO network_state SET ?', info, function(err, result) {
        if(err)
          console.log(err);
      });
    }
    xw.endElement();
  }
}

function insert_into_mute_state_xml(req, video_id, index) {
  //xw.startElement('mute_state');
  xw.startElement('timestamp_of_mute_state').text(req.body.mute_state[index].timestamp_of_mute_state).endElement();
  xw.startElement('current_video_position').text(req.body.mute_state[index].current_video_position).endElement();
  xw.startElement('state').text(req.body.mute_state[index].state).endElement();
  xw.startElement('video_information_id').text(video_id).endElement();
  //xw.endElement();
}

function insert_into_mute_state(req, video_id) {
  if(req.body.mute_state != null) {
    xw.startElement('mute_state');
    for(i = 0; i < req.body.mute_state.length; i++) {
      var info  = { 
                timestamp_of_mute_state : req.body.mute_state[i].timestamp_of_mute_state,
                current_video_position : req.body.mute_state[i].current_video_position,
                state: req.body.mute_state[i].state,
                video_information_id : video_id
      };

      if(req.body.mute_state.length > 1) {
        xw.startElement("multiple_entry");
      }

      insert_into_mute_state_xml(req, video_id, i);

      if(req.body.mute_state.length > 1) {
        xw.endElement();
      }


      var query = connection.query('INSERT INTO mute_state SET ?', info, function(err, result) {
        if(err)
          console.log(err);
      });
    }
    xw.endElement();
  }
}


function insert_into_length_of_stall_xml(req, video_id, index) {
  //xw.startElement('length_of_stall');
  xw.startElement('timestamp_of_stall').text(req.body.length_of_each_stall[index].timestamp_of_stall).endElement();
  xw.startElement('current_video_position').text(req.body.length_of_each_stall[index].current_video_position).endElement();
  xw.startElement('duration_of_stall').text(req.body.length_of_each_stall[index].duration_of_stall).endElement();
  xw.startElement('video_information_id').text(video_id).endElement();
  //xw.endElement();
}

function insert_into_length_of_stall(req, video_id) {
  if(req.body.length_of_each_stall != null) {
    xw.startElement('length_of_stall');
    for(i = 0; i < req.body.length_of_each_stall.length; i++) {
      var info  = { 
                timestamp_of_stall : req.body.length_of_each_stall[i].timestamp_of_stall,
                current_video_position : req.body.length_of_each_stall[i].current_video_position,
                duration_of_stall: req.body.length_of_each_stall[i].duration_of_stall,
                video_information_id : video_id
      };

      if(req.body.length_of_each_stall.length > 1) {
        xw.startElement("multiple_entry");
      }

      insert_into_length_of_stall_xml(req, video_id, i);

      if(req.body.length_of_each_stall.length > 1) {
        xw.endElement();
      }

      var query = connection.query('INSERT INTO length_of_stall SET ?', info, function(err, result) {
        if(err)
          console.log(err);
      });
    }
    xw.endElement();
  }
}

function insert_into_frame_per_second_xml(req, video_id, index) {
  //xw.startElement('frame_per_second');
  xw.startElement('timestamp_of_frame').text(req.body.frame_per_second[index].timestamp_of_frame).endElement();
  xw.startElement('current_video_position').text(req.body.frame_per_second[index].current_video_position).endElement();
  xw.startElement('number_of_frames').text(req.body.frame_per_second[index].number_of_frames).endElement();
  xw.startElement('video_information_id').text(video_id).endElement();
  //xw.endElement();
}

function insert_into_frame_per_second(req, video_id) {
  if(req.body.frame_per_second != null) {
    xw.startElement('frame_per_second');
    for(i = 0; i < req.body.frame_per_second.length; i++) {
      var info  = { 
                timestamp_of_frame : req.body.frame_per_second[i].timestamp_of_frame,
                current_video_position : req.body.frame_per_second[i].current_video_position,
                number_of_frames: req.body.frame_per_second[i].number_of_frames,
                video_information_id : video_id
      };

      if(req.body.frame_per_second.length > 1) {
        xw.startElement("multiple_entry");
      }

      insert_into_frame_per_second_xml(req, video_id, i);

      if(req.body.frame_per_second.length > 1) {
        xw.endElement();
      }

      var query = connection.query('INSERT INTO frame_per_second SET ?', info, function(err, result) {
        if(err)
          console.log(err);
      });
    }
    xw.endElement();
  }
}

function insert_into_buffer_interval_xml(req, video_id, index) {
  //xw.startElement('buffer_interval');
  xw.startElement('start_buffer_time').text(req.body.buffer_time[index].start).endElement();
  xw.startElement('end_buffer_time').text(req.body.buffer_time[index].end).endElement();
  xw.startElement('video_information_id').text(video_id).endElement();
  //xw.endElement();
}


function insert_into_buffer_interval(req, video_id) {
  if(req.body.buffer_time != null) {
    xw.startElement('buffer_interval');
    for(i = 0; i < req.body.buffer_time.length; i++) {
      var info  = { 
                start_buffer_time : req.body.buffer_time[i].start,
                end_buffer_time : req.body.buffer_time[i].end,
                video_information_id : video_id
      };

      if(req.body.buffer_time.length > 1) {
        xw.startElement("multiple_entry");
      }

      insert_into_buffer_interval_xml(req, video_id, i);

      if(req.body.buffer_time.length > 1) {
        xw.endElement();
      }

      var query = connection.query('INSERT INTO buffer_interval SET ?', info, function(err, result) {
        if(err)
          console.log(err);
      });
    }
    xw.endElement();
  }
}











app.post('/api/users', function (req, res){
  console.log("Info received");
  /*
  userqoe = new UserQoEModel({
    ip : req.ip,
    timestamp : Date.now(),
    total_played_time: req.body.total_played_time,
    played_time_interval: req.body.played_time_interval,
    total_played_time_with_stall: req.body.total_played_time_with_stall,
    total_stall_length: req.body.total_stall_length,
    total_number_of_stall: req.body.total_number_of_stall,
    length_of_each_stall: req.body.length_of_each_stall,
    video_duration: req.body.video_duration,
    playback_quality: req.body.playback_quality,
    frame_per_second: req.body.frame_per_second,
    video_bytes_decoded_per_second: req.body.video_bytes_decoded_per_second,
    audio_bytes_decoded_per_second: req.body.audio_bytes_decoded_per_second,
    dropped_frames: req.body.dropped_frames,
    time_in_buffer: req.body.time_in_buffer,
    buffer_time: req.body.buffer_time,
    mute_state: req.body.mute_state,
    volume_at_time: req.body.volume_at_time,
    video_preload: req.body.video_preload,
    video_source: req.body.video_source,
    network_state_at_time: req.body.network_state_at_time,
    left_time : req.body.left_time
  });
*/

  var results = insert_into_video_information(req);
  var video_id = results.video_id;

  insert_into_video_source(req, video_id);
  insert_into_volume_state(req, video_id);
  insert_into_video_bytes_decoded_per_second(req, video_id);
  insert_into_audio_bytes_decoded_per_second(req, video_id);
  insert_into_time_in_buffer(req, video_id);
  insert_into_skip_play(req, video_id);
  insert_into_played_interval(req, video_id);
  insert_into_playback_quality(req, video_id);
  insert_into_network_state(req, video_id);
  insert_into_mute_state(req, video_id);
  insert_into_length_of_stall(req, video_id);
  insert_into_frame_per_second(req, video_id);
  insert_into_buffer_interval(req, video_id);
  xw.endDocument();
  // https://www.npmjs.com/package/xml-writer#startdocument-string-version-1-0-string-encoding-null-boolean-standalone-false
  fs.writeFile('./results/' + results.file_name + '.xml', xw.toString(), function (err) {
    if (err) throw err;
    console.log('It\'s saved!');
    //function puts(error, stdout, stderr) { sys.puts(stdout) }
    //exec("ls -la", puts);


  });
  //console.log(xw.toString());
  

  /*

    userqoe.save(function (err) {
    if (!err) {
      return console.log("created");
    } else {
      return console.log(err);
    }
  });
*/

});



function randomString(length, chars) {
    var mask = '';
    if (chars.indexOf('a') > -1) mask += 'abcdefghijklmnopqrstuvwxyz';
    if (chars.indexOf('A') > -1) mask += 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    if (chars.indexOf('#') > -1) mask += '0123456789';
    if (chars.indexOf('!') > -1) mask += '~`!@#$%^&*()_+-={}[]:";\'<>?,./|\\';
    var result = '';
    for (var i = length; i > 0; --i) result += mask[Math.round(Math.random() * (mask.length - 1))];
    return result;
}





var server = app.listen(3000, function () {

  var host = server.address().address
  var port = server.address().port

  console.log('Example app listening at http://%s:%s', host, port)

});