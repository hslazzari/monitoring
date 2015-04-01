var express = require('express');
var mongoose = require('mongoose');
var bodyParser = require("body-parser");
var app = express()

//app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(express.static(__dirname + "/public"));

var Schema = mongoose.Schema;  
/*
{ total_played_time: 4.7832930000000005,
  played_time_interval: [ { start: 65.256707, end: 70.04 } ],
  total_played_time_with_stall: 4.884293,
  total_stall_length: 0.101,
  total_number_of_stall: 1,
  length_of_each_stall: [ 0.101 ],
  video_duration: 70.04,
  playback_quality: [ { first: 0, second: [Object] } ],
  frame_per_second: 
   [ { first: 65.841238, second: 0 },
     { first: 66.839651, second: 0 },
     { first: 67.826455, second: 0 },
     { first: 68.824868, second: 0 },
     { first: 69.823281, second: 0 } ],
  video_bytes_decoded_per_second: 
   [ { first: 65.841238, second: 0 },
     { first: 66.839651, second: 0 },
     { first: 67.826455, second: 0 },
     { first: 68.824868, second: 0 },
     { first: 69.823281, second: 0 } ],
  audio_bytes_decoded_per_second: 
   [ { first: 65.841238, second: 44930 },
     { first: 66.839651, second: 38661 },
     { first: 67.826455, second: 40751 },
     { first: 68.824868, second: 39707 },
     { first: 69.823281, second: 30302 } ],
  dropped_frames: 0,
  time_in_buffer: 
   [ { first: 65.256707, second: 4.7832930000000005 },
     { first: 65.256707, second: 4.7832930000000005 },
     { first: 65.256707, second: 4.7832930000000005 },
     { first: 65.256707, second: 4.7832930000000005 },
     { first: 65.841238, second: 4.198762000000002 },
     { first: 66.839651, second: 3.2003490000000028 },
     { first: 67.826455, second: 2.2135450000000105 },
     { first: 68.824868, second: 1.2151320000000112 },
     { first: 69.823281, second: 0.21671900000001187 } ],
  buffer_time: [ { start: 0, end: 20.616 }, { start: 64.462, end: 70.04 } ],
  mute_state: 
   [ { first: 65.256707, second: 0 },
     { first: 67.849062, second: 1 } ],
  volume_at_time: [ { first: 65.256707, second: 1 } ],
  video_preload: 'auto',
  video_source: [ 'http://localhost:3000/a.mp4' ],
  network_state_at_time: [ { first: 65.256707, second: 1 } ] }


*/
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

var UserQoEModel = mongoose.model('UserQoE', UserQoE);

mongoose.connect( 'mongodb://localhost/user_qoe' );

app.get('/api/users', function (req, res){
	UserQoEModel.find({}, function (err, docs) {
        res.json(docs);
    });
});

app.post('/api/users', function (req, res){
  console.log("Info received");
  
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

  
  userqoe.save(function (err) {
    if (!err) {
      return console.log("created");
    } else {
      return console.log(err);
    }
  });

});



var server = app.listen(3000, function () {

  var host = server.address().address
  var port = server.address().port

  console.log('Example app listening at http://%s:%s', host, port)

});