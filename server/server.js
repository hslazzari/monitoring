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

connection.on('close', function(err) {
  if (err) {
    // Oops! Unexpected closing of connection, lets reconnect back.
    connection = mysql.createConnection({
      host     : 'localhost',
      user     : 'root',
      password : 'prav',
      database: 'monitor'
    });
  } else {
    console.log('Connection closed normally.');
  }
});

app.set('view engine', 'ejs');


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

var fs = require('fs');


var sys = require('sys')
var exec = require('child_process').exec;

//function puts(error, stdout, stderr) { sys.puts(stdout) }
//exec("ls -la", puts);
    
app.get('/api/monitor', function (req, res) {
  connection.query(
    ' SELECT questionario.opinion, questionario.ip, video_information.video_information_id, video_information.start_timestamp, video_information.video_duration, video_information.total_stall_length, video_start_time' +
    ' FROM questionario' +
    ' INNER JOIN  video_information' + 
    ' ON questionario.ip=video_information.ip AND questionario.hash =video_information.hash AND questionario.timestamp = video_information.start_timestamp;'
, function(err, rows, fields) {
    if (err)
      console.log(err);
    else {
      
      for(var i = 0; i < rows.length; i++) {

        var date = new Date(Number(rows[i].start_timestamp));
        var hours = date.getHours();
        var minutes = "0" + date.getMinutes();
        var seconds = "0" + date.getSeconds();
        var formattedTime = hours + ':' + minutes.substr(-2) + ':' + seconds.substr(-2);
        
        rows[i].start_timestamp = formattedTime;
      
      }


  

      res.render('pages/monitor_result.ejs', {
        results : rows
      });


    }


    
  });

});






app.get('/tests', function (req, res) {
      res.render('pages/teste.ejs');
});
  



app.get('/full_testes', function (req, res) {
      res.render('pages/full_testes.ejs');
});
  



function insert_into_video_information(req) {
  
  var timestamp_now = Date.now();
  var file_name = randomString(64, "aA#");



  var video_id = video_information_id_;

  var info;

  if(req.body.teste_simulado == true) {
      info = { 
              ip: req.ip, 
              start_timestamp: req.body.timestamp,
              hash: req.body.hash,
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
              video_information_id : video_id,
              simulado : "true",
              perfil : req.body.perfil
            };
  } else {
      info  = { 
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

  }





  video_information_id_ = video_information_id_+1;
  var query = connection.query('INSERT INTO video_information SET ?', info, function(err, result) {
    if(err)
      console.log(err);
  });
  return {'video_id' : video_id, 'file_name' : timestamp_now.toString() + '-' + file_name, 'info':info};
}

function insert_into_video_source(req, video_id) {
  if(req.body.video_source != null) {
    for(i = 0; i < req.body.video_source.length; i++) {
      var info  = { 
                source : req.body.video_source[i],
                video_information_id : video_id 
      };
      
      if(req.body.video_source.length > 1) {
      }

      var query = connection.query('INSERT INTO video_source SET ?', info, function(err, result) {
        if(err)
          console.log(err);

      });
    }
}
  
}

function insert_into_volume_state(req, video_id) {
  if(req.body.volume_at_time  != null) {
    for(i = 0; i < req.body.volume_at_time.length; i++) {
      var info  = { 
                current_video_position : req.body.volume_at_time[i].current_video_position,
                timestamp_of_volume : req.body.volume_at_time[i].timestamp_of_volume,
                video_information_id : video_id,
                volume : req.body.volume_at_time[i].volume
      };
      
      var query = connection.query('INSERT INTO volume_state SET ?', info, function(err, result) {
        if(err)
          console.log(err);
      });
    }
  }
  
}


function insert_into_video_bytes_decoded_per_second(req, video_id) {
  if(req.body.video_bytes_decoded_per_second != null) {
    for(i = 0; i < req.body.video_bytes_decoded_per_second.length; i++) {
      var info  = { 
                current_video_position : req.body.video_bytes_decoded_per_second[i].current_video_position,
                timestamp_of_video_bytes_decoded : req.body.video_bytes_decoded_per_second[i].timestamp_of_video_bytes_decoded,
                video_information_id : video_id,
                video_bytes : req.body.video_bytes_decoded_per_second[i].video_bytes
      };




      var query = connection.query('INSERT INTO video_bytes_decoded_per_second SET ?', info, function(err, result) {
        if(err)
          console.log(err);
      });
    }
  }
  
}


function insert_into_audio_bytes_decoded_per_second(req, video_id) {
  if(req.body.audio_bytes_decoded_per_second != null) {
    for(i = 0; i < req.body.audio_bytes_decoded_per_second.length; i++) {
      var info  = { 
                current_video_position : req.body.audio_bytes_decoded_per_second[i].current_video_position,
                timestamp_of_audio_bytes_decoded : req.body.audio_bytes_decoded_per_second[i].timestamp_of_audio_bytes_decoded,
                video_information_id : video_id,
                audio_bytes : req.body.audio_bytes_decoded_per_second[i].audio_bytes
      };


      var query = connection.query('INSERT INTO audio_bytes_decoded_per_second SET ?', info, function(err, result) {
        if(err)
          console.log(err);
      });
    }
  }
  
}


function insert_into_time_in_buffer(req, video_id) {
  if(req.body.time_in_buffer != null) {
    for(i = 0; i < req.body.time_in_buffer.length; i++) {
      var info  = { 
                current_video_position : req.body.time_in_buffer[i].current_video_position,
                timestamp_of_time : req.body.time_in_buffer[i].timestamp_of_time,
                video_information_id : video_id,
                remaining_time_in_buffer : req.body.time_in_buffer[i].remaining_time_in_buffer
      };
      
      
      

      var query = connection.query('INSERT INTO time_in_buffer SET ?', info, function(err, result) {
        if(err)
          console.log(err);
      });
    }
  }
  
}



function insert_into_skip_play(req, video_id) {
  if(req.body.skip_play != null) {
    for(i = 0; i < req.body.skip_play.length; i++) {
      var info  = { 
                current_video_position : req.body.skip_play[i].current_video_position,
                timestamp_of_skip : req.body.skip_play[i].timestamp_of_skip,
                skip_duration : req.body.skip_play[i].skip_duration,
                video_information_id : video_id
      };



      var query = connection.query('INSERT INTO skip_play SET ?', info, function(err, result) {
        if(err)
          console.log(err);
      });
    }
  }
  
}




function insert_into_played_interval(req, video_id) {
  if(req.body.played_time_interval != null) {
    for(i = 0; i < req.body.played_time_interval.length; i++) {
      var info  = { 
                start_play : req.body.played_time_interval[i].start,
                end_play : req.body.played_time_interval[i].end,
                video_information_id : video_id
      };




      var query = connection.query('INSERT INTO played_interval SET ?', info, function(err, result) {
        if(err)
          console.log(err);
      });
    }
  }
  
}


function insert_into_playback_quality(req, video_id) {
  if(req.body.playback_quality != null) {
    for(i = 0; i < req.body.playback_quality.length; i++) {

      var info  = { 
                timestamp_of_quality : req.body.playback_quality[i].timestamp_of_quality,
                current_video_position : req.body.playback_quality[i].current_video_position,
                video_width : req.body.playback_quality[i].video_width,
                video_height: req.body.playback_quality[i].video_height,
                video_information_id : video_id
      };




      var query = connection.query('INSERT INTO playback_quality SET ?', info, function(err, result) {
        if(err)
          console.log(err);
      });
    }
  }
  
}


function insert_into_network_state(req, video_id) {
  if(req.body.network_state_at_time != null) {
    for(i = 0; i < req.body.network_state_at_time.length; i++) {
      var info  = { 
                timestamp_of_network_state : req.body.network_state_at_time[i].timestamp_of_network_state,
                current_video_position : req.body.network_state_at_time[i].current_video_position,
                state: req.body.network_state_at_time[i].state,
                video_information_id : video_id
      };


      var query = connection.query('INSERT INTO network_state SET ?', info, function(err, result) {
        if(err)
          console.log(err);
      });
    }
  }
}

function insert_into_mute_state(req, video_id) {
  if(req.body.mute_state != null) {
    for(i = 0; i < req.body.mute_state.length; i++) {
      var info  = { 
                timestamp_of_mute_state : req.body.mute_state[i].timestamp_of_mute_state,
                current_video_position : req.body.mute_state[i].current_video_position,
                state: req.body.mute_state[i].state,
                video_information_id : video_id
      };



      var query = connection.query('INSERT INTO mute_state SET ?', info, function(err, result) {
        if(err)
          console.log(err);
      });
    }
  }
}


function insert_into_length_of_stall(req, video_id) {
  if(req.body.length_of_each_stall != null) {
    for(i = 0; i < req.body.length_of_each_stall.length; i++) {
      var info  = { 
                timestamp_of_stall : req.body.length_of_each_stall[i].timestamp_of_stall,
                current_video_position : req.body.length_of_each_stall[i].current_video_position,
                duration_of_stall: req.body.length_of_each_stall[i].duration_of_stall,
                video_information_id : video_id
      };



      var query = connection.query('INSERT INTO length_of_stall SET ?', info, function(err, result) {
        if(err)
          console.log(err);
      });
    }
  }
}


function insert_into_frame_per_second(req, video_id) {
  if(req.body.frame_per_second != null) {
    for(i = 0; i < req.body.frame_per_second.length; i++) {
      var info  = { 
                timestamp_of_frame : req.body.frame_per_second[i].timestamp_of_frame,
                current_video_position : req.body.frame_per_second[i].current_video_position,
                number_of_frames: req.body.frame_per_second[i].number_of_frames,
                video_information_id : video_id
      };


      var query = connection.query('INSERT INTO frame_per_second SET ?', info, function(err, result) {
        if(err)
          console.log(err);
      });
    }
  }
}

function insert_into_buffer_interval(req, video_id) {
  if(req.body.buffer_time != null) {
    for(i = 0; i < req.body.buffer_time.length; i++) {
      var info  = { 
                start_buffer_time : req.body.buffer_time[i].start,
                end_buffer_time : req.body.buffer_time[i].end,
                video_information_id : video_id
      };



      var query = connection.query('INSERT INTO buffer_interval SET ?', info, function(err, result) {
        if(err)
          console.log(err);
      });
    }
  }
}





app.post('/api/simulador', function (req, res){
  console.log("Simulador info received");
 
  var info;

  if(req.body.teste_simulado == true) {
      info  = { 
              ip: req.ip, 
              start_timestamp: req.body.timestamp,
              hash: req.body.hash,
              video_duration: req.body.video_duration,
              ativar_stall : req.body.ativar_stall,
              ativar_startup_stall: req.body.ativar_startup_stall,
              ativar_troca_de_resolucao: req.body.ativar_troca_de_resolucao,
              show_video_controls: req.body.show_video_controls,
              stall_duration: req.body.stall_duration,
              startup_time: req.body.startup_time,
              url_page_simulador: req.body.url_page_simulador,
              url_resolucao_1: req.body.url_resolucao_1,
              url_resolucao_2: req.body.url_resolucao_2,
              url_resolucao_3: req.body.url_resolucao_3,
              url_resolucao_4: req.body.url_resolucao_4,
              url_resolucao_5: req.body.url_resolucao_5,
              url_resolucao_6: req.body.url_resolucao_6,
              perfil : req.body.perfil,
              simulado : 'true'
      };

  } else {
      info  = { 
              ip: req.ip, 
              start_timestamp: req.body.start_timestamp,
              hash: randomString(64, "aA#"),
              video_duration: req.body.video_duration,
              ativar_stall : req.body.ativar_stall,
              ativar_startup_stall: req.body.ativar_startup_stall,
              ativar_troca_de_resolucao: req.body.ativar_troca_de_resolucao,
              show_video_controls: req.body.show_video_controls,
              stall_duration: req.body.stall_duration,
              startup_time: req.body.startup_time,
              url_page_simulador: req.body.url_page_simulador,
              url_resolucao_1: req.body.url_resolucao_1,
              url_resolucao_2: req.body.url_resolucao_2,
              url_resolucao_3: req.body.url_resolucao_3,
              url_resolucao_4: req.body.url_resolucao_4,
              url_resolucao_5: req.body.url_resolucao_5,
              url_resolucao_6: req.body.url_resolucao_6
      };
  }


  

  var query = connection.query('INSERT INTO video_information_simulador SET ?', info, function(err, result) {
    if(err)
      console.log(err);
    else {
          //stall_position_simulador
        if(req.body.ativar_stall) {
          insert_into_position_simulador(req, result.insertId);
        }
          
        //troca_de_resolucao_simulador
        if(req.body.ativar_troca_de_resolucao) {
          insert_into_troca_de_resolucao_simulador(req, result.insertId);
        }

    }
    
  });


  var return_object = {};
  return_object["timestamp"] = info.start_timestamp;
  return_object["hash"] = info.hash;
  return_object["ip"] = info.ip;
  
  console.log("return hash: " + return_object["hash"]);
  res.json(JSON.stringify(return_object));

});

function insert_into_troca_de_resolucao_simulador(req, simulador_id) {
    var keys = Object.keys(req.body.resolution_state);
    
    for(i = 0; i < keys.length; i++) {
      var info  = { 
        id_simulador : simulador_id,
        position_percent : keys[i],
        url_resolucao : "url_resolucao_"+req.body.resolution_state[keys[i]]
      };  
      
      var query = connection.query('INSERT INTO troca_de_resolucao_simulador SET ?', info, function(err, result) {
          if(err)
            console.log(err);
      });
    }
}

function insert_into_position_simulador(req, simulador_id) {



       var keys = Object.keys(req.body.estado_stall);
       for(i = 0; i < keys.length; i++) {
          if(req.body.estado_stall[keys[i]] == "bad"){
            var info  = { 
              id_simulador : simulador_id,
              position_percent : keys[i]
            };  
            var query = connection.query('INSERT INTO stall_position_simulador SET ?', info, function(err, result) {
              if(err)
                console.log(err);
            });

          }
       }



}





app.post('/api/create_link', function(req, res) {
  var return_object = {};
  return_object["timestamp"] = Date.now();
  return_object["hash"] = randomString(64, "aA#");
  
  console.log("Criado Link - " + return_object["hash"]);


  res.json(JSON.stringify(return_object));

});



app.post('/api/monitor', function (req, res){


  console.log("Monitoring info received");



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
   
  
  var return_object = {};
  return_object["timestamp"] = results.info.start_timestamp;
  return_object["hash"] = results.info.hash;
  return_object["ip"] = results.info.ip;

  console.log("Monitoring info saved");

  res.json(JSON.stringify(return_object));


});









app.post('/api/questionario', function (req, res){
  console.log("received questionario");
  var return_object = insert_into_questionario(req);


  res.json(JSON.stringify(return_object));

});


/*
   SELECT distinct questionario.opinion, video_information_simulador.idvideo_information_simulador, video_information_simulador.url_page_simulador
   FROM questionario
   INNER JOIN  video_information_simulador
   ON questionario.ip=video_information_simulador.ip AND questionario.hash =video_information_simulador.hash AND questionario.timestamp = video_information_simulador.start_timestamp;
*/

function insert_into_questionario(req) {
  var info;

  if(req.body.teste_simulado == true) {
      info  = { 
        ip: req.ip, 
        timestamp: req.body.timestamp,
        hash: req.body.hash,
        opinion : req.body.opinion,
        rating : req.body.rating,
        conteudo : req.body.conteudo,
        diario : req.body.diario,
        idade : req.body.idade,
        sexo : req.body.sexo,
        pais : req.body.pais,
        comentario : req.body.comment,
        tempo : req.body.tempo,
        perfil : req.body.perfil,
        simulado : 'true'
      };

  } else {
      info  = { 
        ip: req.ip, 
        timestamp: req.body.timestamp,
        hash: req.body.hash,
        opinion : req.body.opinion,
        rating : req.body.rating,
        conteudo : req.body.conteudo,
        diario : req.body.diario,
        idade : req.body.idade,
        sexo : req.body.sexo,
        pais : req.body.pais,
        comentario : req.body.comment,
        tempo : req.body.tempo
      };

  }

  console.log("hash: " + info.hash);

  if(info.hash == "") {
    info.hash = randomString(64, "aA#");
    console.log(" NEw hash: " + info.hash);
  }

  info.ip = req.ip;
  
  if(info.timestamp == "") {
    info.timestamp = Date.now();
  }

  var query = connection.query('INSERT INTO questionario SET ?', info, function(err, result) {
  if(err)
    console.log(err);
  });

  console.log("Saved questionario!");
  var return_object = {status : 'OK'};

  return return_object;
}




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





app.get('/api/simulador', function (req, res){
  connection.query('SELECT  questionario.opinion, questionario.ip, video_information_simulador.start_timestamp, video_information_simulador.url_resolucao_6, video_information_simulador.ativar_stall, video_information_simulador.ativar_startup_stall, video_information_simulador.ativar_troca_de_resolucao'+
    ' FROM questionario' +
    ' INNER JOIN  video_information_simulador' +
    ' ON questionario.ip=video_information_simulador.ip AND questionario.hash =video_information_simulador.hash AND questionario.timestamp = video_information_simulador.start_timestamp;', function(err, rows, fields) {
    if (err)
      console.log(err);
    else {
      
      for(var i = 0; i < rows.length; i++) {
        if(rows[i].ativar_stall =='0')
          rows[i].ativar_stall = "False";
        else
          rows[i].ativar_stall = "True";
        
        if(rows[i].ativar_startup_stall =='0')
          rows[i].ativar_startup_stall = "False";
        else
          rows[i].ativar_startup_stall = "True";
        
        if(rows[i].ativar_troca_de_resolucao =='0')
          rows[i].ativar_troca_de_resolucao = "False";
        else
          rows[i].ativar_troca_de_resolucao = "True";

        var date = new Date(Number(rows[i].start_timestamp));
        var hours = date.getHours();
        var minutes = "0" + date.getMinutes();
        var seconds = "0" + date.getSeconds();
        var formattedTime = hours + ':' + minutes.substr(-2) + ':' + seconds.substr(-2);
        
        rows[i].start_timestamp = formattedTime;


        
      }


  

      res.render('pages/simulated_result.ejs', {
        results : rows
      });


    }


    
});




  //res.json(JSON.stringify(return_object));

});

var last_timestamp = -1;
var last_config = null;


// index page 
app.get('/', function(req, res) {
    res.render('pages/index');
});

app.get('/config/', function(req, res) {
    res.render('pages/config', {
        resource : 0
    });
});

app.get('/config/perfil_1', function(req, res) {
    res.render('pages/config', {
        resource : 1
    });
});

app.get('/config/perfil_2', function(req, res) {
    res.render('pages/config', {
        resource : 2
    });
});

app.get('/config/perfil_3', function(req, res) {
    res.render('pages/config', {
        resource : 3
    });
});

app.get('/config/perfil_4', function(req, res) {
    res.render('pages/config', {
        resource : 4
    });
});

app.get('/config/perfil_5', function(req, res) {
    res.render('pages/config', {
        resource : 5
    });
});



app.post('/config/save', function(req, res) {
    connection.query('SELECT * FROM config WHERE perfil = "'+ req.body.perfil + '" LIMIT 1;', function(err, rows, fields) {
      if (err)
        console.log(err);
      else {
        insert_save_config(req.body, rows.length);
      }
    });
});

app.post('/config/can_load', function(req, res) {
 if(last_timestamp != -1) {
      var return_object = {};

      if(last_timestamp > req.body.timestamp)
        return_object["can_load"] = "true";
      else
        return_object["can_load"] = "false";


      res.json(JSON.stringify(return_object));
  } else {
      connection.query('SELECT * FROM config;', function(err, rows, fields) {
        if (err)
          console.log(err);
        else {
          var return_object = {};
          if(rows.length == 0) {
            return_object["can_load"] = "false";
          } else {
            if(rows[0].timestamp > req.body.timestamp) {
              return_object["can_load"] = "true";
              last_timestamp = rows[0].timestamp;
            }
            else {
              return_object["can_load"] = "false";
              last_timestamp = rows[0].timestamp;
            }
              
          }

          res.json(JSON.stringify(return_object));
          
        }
      });
  }
  
});

  


app.post('/config/load', function(req, res) {
    console.log("LOAD")
    
    if(req.body.perfil == undefined) {
      req.body.perfil = '0';
    }

    console.log("Perfil: " + req.body.perfil);


    connection.query('SELECT * FROM config WHERE perfil = "' + req.body.perfil + '";', function(err, rows, fields) {
      if (err)
        console.log(err);
      else {

        
        if(rows.length > 0) {
            var return_data = rows[0];

            last_timestamp = rows[0].timestamp;
            
            return_data["resolution_state"] = {};
            return_data["estado_stall"] = {};

            connection.query('SELECT * FROM config_resolution_state WHERE perfil = "' + req.body.perfil + '";', function(err, rows, fields) {
              if (err)
                console.log(err);
              else {
                for(var i = 0; i < rows.length; i++) {
                    return_data["resolution_state"][rows[i].posicao] = rows[i].estado;
                }  

                connection.query('SELECT * FROM config_estado_stall WHERE perfil = "' + req.body.perfil + '";', function(err, rows, fields) {
                  if (err)
                    console.log(err);
                  else {
                    for(var i = 0; i < rows.length; i++) {
                        return_data["estado_stall"][rows[i].posicao] = rows[i].estado;
                    } 

                    last_config = return_data;
                    res.json(JSON.stringify(return_data));

                  }
                });
              
              }
            });

        }
        
      }
    });
});









//  res.json(JSON.stringify(return_object));


function insert_save_config(data, length) {
  var estado_stall = data.estado_stall;
  var resolution_state = data.resolution_state;

  last_config = data;

  delete data.estado_stall;
  delete data.resolution_state;

  data.timestamp = Date.now();

  last_timestamp = data.timestamp;
  last_config["timestamp"] = last_timestamp;


  console.log(data);

  if(length == 0) {
      var query = connection.query('INSERT INTO config SET ?', data, function(err, result) {
        if(err)
          console.log(err);
          
        console.log("INSERT");
      });

      var keys = Object.keys(resolution_state);

      for(var i = 0; i < keys.length; i++) {
        var info = {
          posicao : keys[i],
          estado : resolution_state[keys[i]],
          perfil : data.perfil
        }

        connection.query('INSERT INTO config_resolution_state SET ?', info, function(err, result) {
          if(err)
            console.log(err);
        });
      }


      var keys2 = Object.keys(estado_stall);

      for(var i = 0; i < keys2.length; i++) {
        var info = {
          posicao : keys2[i],
          estado : estado_stall[keys2[i]],
          perfil : data.perfil
        }

        connection.query('INSERT INTO config_estado_stall SET ?', info, function(err, result) {
          if(err)
            console.log(err);
        });
      }


  } else {
      var query = connection.query('UPDATE config SET ? WHERE perfil ="' + data.perfil + '"', data, function(err, result) {
        if(err)
          console.log(err);
          
        console.log("UPDATE");
      });


      var keys = Object.keys(resolution_state);

      for(var i = 0; i < keys.length; i++) {
        var info = {
          posicao : keys[i],
          estado : resolution_state[keys[i]],
          perfil : data.perfil
        }

        connection.query('UPDATE config_resolution_state SET ? WHERE posicao = "' + info.posicao +'" AND perfil = "' + data.perfil + '"', info, function(err, result) {
          if(err)
            console.log(err);
        });
      }
      


      var keys2 = Object.keys(estado_stall);

      for(var i = 0; i < keys2.length; i++) {
        var info = {
          posicao : keys2[i],
          estado : estado_stall[keys2[i]],
          perfil : data.perfil
        }

        connection.query('UPDATE config_estado_stall SET ? WHERE posicao = "' + info.posicao +'" AND perfil = "' + data.perfil + '"', info, function(err, result) {
          if(err)
            console.log(err);
        });
      }

  }
  
  console.log("Saved config!");

}




var server = app.listen(3000, function () {

  var host = server.address().address
  var port = server.address().port

  console.log('Monitoring server listening at http://%s:%s', host, port)

});