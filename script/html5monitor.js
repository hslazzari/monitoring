var monitor;
var simulador;
var config2;


function normalize(c) {
  if(c.monitorar == "true" || c.monitorar == "1") 
    c.monitorar = true;
  if(c.monitorar == "false" || c.monitorar == "0")
    c.monitorar = false;

  if(c.questionario == "true" || c.questionario == "1")
    c.questionario = true;
  if(c.questionario == "false" || c.questionario == "0")
    c.questionario = false;

  if(c.relatorio == "true" || c.relatorio == "1")
    c.relatorio = true;
  if(c.relatorio == "false" || c.relatorio == "0")
    c.relatorio = false;

  c.intervalo_minimo_de_stall = Number(c.intervalo_minimo_de_stall);
  c.intervalo_de_monitoramento = Number(c.intervalo_de_monitoramento);


  if(c.ativar_startup_stall == "true" || c.ativar_startup_stall == "1")
    c.ativar_startup_stall = true;
  if(c.ativar_startup_stall == "false" || c.ativar_startup_stall == "0")
    c.ativar_startup_stall = false;

  if(c.ativar_stall == "true" || c.ativar_stall == "1")
    c.ativar_stall = true;
  if(c.ativar_stall == "false" || c.ativar_stall == "0")
    c.ativar_stall = false;



    

  if(c.enviar_para_servidor == "true" || c.enviar_para_servidor == "1")
    c.enviar_para_servidor = true;
  if(c.enviar_para_servidor == "false" || c.enviar_para_servidor == "0")
    c.enviar_para_servidor = false;

 if(c.show_video_controls == "true" || c.show_video_controls == "1")
    c.show_video_controls = true;
  if(c.show_video_controls == "false" || c.show_video_controls == "0")
    c.show_video_controls = false;

 if(c.show_questionario_simulador == "true" || c.show_questionario_simulador == "1")
    c.show_questionario_simulador = true;
  if(c.show_questionario_simulador == "false" || c.show_questionario_simulador == "0")
    c.show_questionario_simulador = false;

if(c.ativar_troca_de_resolucao == "true" || c.ativar_troca_de_resolucao == "1")
    c.ativar_troca_de_resolucao = true;
  if(c.ativar_troca_de_resolucao == "false" || c.ativar_troca_de_resolucao == "0")
    c.ativar_troca_de_resolucao = false;

  if(c.receber_do_servidor == "true" || c.receber_do_servidor == "1")
    c.receber_do_servidor = true;
  if(c.receber_do_servidor == "false" || c.receber_do_servidor == "0")
    c.receber_do_servidor = false;


 c.startup_time = Number(c.startup_time);
 c.stall_duration = Number(c.stall_duration);

}

var config = null;
var $link = null;


function send_simulador(end, config, current_source, video_duration) {
	var return_object = {};
	return_object["start_timestamp"] = Date.now();
	return_object["ativar_stall"] = config.ativar_stall;
	return_object["ativar_startup_stall"] = config.ativar_startup_stall;
	return_object["ativar_troca_de_resolucao"] = config.ativar_troca_de_resolucao;
	return_object["show_video_controls"] = config.show_video_controls;
	return_object["stall_duration"] = config.stall_duration;
	return_object["startup_time"] = config.startup_time;
	return_object["url_page_simulador"] = config.url_page_simulador;
	return_object["url_resolucao_1"] = config.url_resolucao_1;
	return_object["url_resolucao_2"] = config.url_resolucao_2;
	return_object["url_resolucao_3"] = config.url_resolucao_3;
	return_object["url_resolucao_4"] = config.url_resolucao_4;
	return_object["url_resolucao_5"] = config.url_resolucao_5;
	return_object["url_resolucao_6"] = current_source;
	return_object["resolution_state"] = config.resolution_state;
	return_object["estado_stall"] = config.estado_stall;
	return_object["video_duration"] = video_duration;



	chrome.runtime.sendMessage({
		action: 'simulador',
		url: end,
		type: "POST",
		data: return_object,
	},  function(responseText) {
	});

}




function send_questionario(end, opinion) {
	var return_object = {};
	return_object["opinion"] = opinion;
	return_object["rating"] = $('#rating').raty('score');
	return_object["conteudo"] = $("#conteudo").val();
	return_object["diario"] = $("#diario").val();
	return_object["tempo"] = $('input[name="tempo"]:checked').val();
	return_object["idade"] = $("#idade").val();
	return_object["sexo"] = $('input[name="sex"]:checked').val();
	return_object["pais"] = $("#pais").val();
	return_object["comment"] = $("#comment").val();

	chrome.runtime.sendMessage({
		action: 'questionario',
		url: end,
		type: "POST",
		data: return_object,
	},  function(responseText) {
	});

}

function local_save_questionario(timestamp, opinion) {
	$("body").append("<a href='' id='dataLink2' download='questionario-"+ timestamp + ".csv'></a>");
	$link2 = $("#dataLink2");
	var saveFile = "Global,Rating,Conteudo,Tempo,Diario,Idade,Sexo,Pais,Comentarios\n";

	saveFile = saveFile + opinion + ",";

	saveFile = saveFile + $('#rating').raty('score') + ",";

	saveFile = saveFile + $("#conteudo").val() + ",";

	saveFile = saveFile + $('input[name="tempo"]:checked').val() + ",";

	saveFile = saveFile + $("#diario").val() + ",";

	saveFile = saveFile + $("#idade").val() + ",";

	saveFile = saveFile + $('input[name="sex"]:checked').val() + ",";

	saveFile = saveFile + $("#pais").val() + ",";

	saveFile = saveFile + $("#comment").val() + ",";
	console.log(saveFile);

	$link2.attr("href", 'data:Application/octet-stream,' + encodeURIComponent(saveFile))[0].click();
}

function local_save(result) {

	$("body").append("<a href='' id='dataLink' download='resultados-"+ result.start_timestamp + ".csv'></a>");
	$link = $("#dataLink");


	var saveFile = "Start timestamp,Netmetric,Left time,Video preload,Total played time,Total played time with stall,Total stall length,Total number of stall,Dropped frames,Video duration,Video start time\n";
	saveFile = saveFile + result.start_timestamp + ",";
	saveFile = saveFile + result.netmetric + ",";
	saveFile = saveFile + result.left_time + ",";
	saveFile = saveFile + result.video_preload + ",";
	saveFile = saveFile + result.total_played_time + ",";
	saveFile = saveFile + result.total_played_time_with_stall + ",";
	saveFile = saveFile + result.total_stall_length + ",";
	saveFile = saveFile + result.total_number_of_stall + ",";
	saveFile = saveFile + result.dropped_frames + ",";
	saveFile = saveFile + result.video_duration + ",";
	saveFile = saveFile + result.video_start_time + "\n\n";

	
	saveFile = saveFile + "Length of each stall\n";
	saveFile = saveFile + "Video position,Timestamp,Duration of stall\n";
	for(var i = 0; i < result.length_of_each_stall.length; i++) {
		saveFile = saveFile + result.length_of_each_stall[i].current_video_position + ",";
		saveFile = saveFile + result.length_of_each_stall[i].timestamp_of_stall+ ",";
		saveFile = saveFile + result.length_of_each_stall[i].duration_of_stall + ",";
		saveFile = saveFile + "\n";

	}

	saveFile = saveFile + "\n";
	

	saveFile = saveFile + "Volume at time\n";
	saveFile = saveFile + "Video position,Timestamp,Volume\n";
	for(var i = 0; i < result.volume_at_time.length; i++) {
		saveFile = saveFile + result.volume_at_time[i].current_video_position + ",";
		saveFile = saveFile + result.volume_at_time[i].timestamp_of_volume+ ",";
		saveFile = saveFile + result.volume_at_time[i].volume + ",";
		saveFile = saveFile + "\n";
	}


	saveFile = saveFile + "\n";
	saveFile = saveFile + "Playback quality\n";
	saveFile = saveFile + "Video position,Timestamp,Width,Height\n";
	for(var i = 0; i < result.playback_quality.length; i++) {
		saveFile = saveFile + result.playback_quality[i].current_video_position + ",";
		saveFile = saveFile + result.playback_quality[i].timestamp_of_quality+ ",";
		saveFile = saveFile + result.playback_quality[i].video_width + ",";
		saveFile = saveFile + result.playback_quality[i].video_height + ",";
		
		saveFile = saveFile + "\n";
	}


	saveFile = saveFile + "\n";
	saveFile = saveFile + "Mute state\n";
	saveFile = saveFile + "Video position,Timestamp,State\n";
	for(var i = 0; i < result.mute_state.length; i++) {
		saveFile = saveFile + result.mute_state[i].current_video_position + ",";
		saveFile = saveFile + result.mute_state[i].timestamp_of_mute_state+ ",";
		saveFile = saveFile + result.mute_state[i].state + ",";
		
		saveFile = saveFile + "\n";
	}



	saveFile = saveFile + "\n";
	saveFile = saveFile + "Played time interval\n";
	saveFile = saveFile + "Start,End\n";
	for(var i = 0; i < result.played_time_interval.length; i++) {
		saveFile = saveFile + result.played_time_interval[i].start + ",";
		saveFile = saveFile + result.played_time_interval[i].end + ",";
		
		saveFile = saveFile + "\n";
	}

	saveFile = saveFile + "\n";
	saveFile = saveFile + "Buffer time\n";
	saveFile = saveFile + "Start,End\n";
	for(var i = 0; i < result.buffer_time.length; i++) {
		saveFile = saveFile + result.buffer_time[i].start + ",";
		saveFile = saveFile + result.buffer_time[i].end + ",";
		
		saveFile = saveFile + "\n";
	}

		
	saveFile = saveFile + "\n";
	saveFile = saveFile + "Video bytes decoded per second\n";
	saveFile = saveFile + "Video position,Timestamp,Bytes decoded\n";
	for(var i = 0; i < result.video_bytes_decoded_per_second.length; i++) {
		saveFile = saveFile + result.video_bytes_decoded_per_second[i].current_video_position + ",";
		saveFile = saveFile + result.video_bytes_decoded_per_second[i].timestamp_of_video_bytes_decoded+ ",";
		saveFile = saveFile + result.video_bytes_decoded_per_second[i].video_bytes + ",";
		
		saveFile = saveFile + "\n";
	}


	saveFile = saveFile + "\n";
	saveFile = saveFile + "Audio bytes decoded per second\n";
	saveFile = saveFile + "Video position,Timestamp,Bytes decoded\n";
	for(var i = 0; i < result.audio_bytes_decoded_per_second.length; i++) {
		saveFile = saveFile + result.audio_bytes_decoded_per_second[i].current_video_position + ",";
		saveFile = saveFile + result.audio_bytes_decoded_per_second[i].timestamp_of_audio_bytes_decoded+ ",";
		saveFile = saveFile + result.audio_bytes_decoded_per_second[i].audio_bytes + ",";
		
		saveFile = saveFile + "\n";
	}


	saveFile = saveFile + "\n";
	saveFile = saveFile + "Time in buffer\n";
	saveFile = saveFile + "Video position,Timestamp,Remaining time in buffer\n";
	for(var i = 0; i < result.time_in_buffer.length; i++) {
		saveFile = saveFile + result.time_in_buffer[i].current_video_position + ",";
		saveFile = saveFile + result.time_in_buffer[i].timestamp_of_time + ",";
		saveFile = saveFile + result.time_in_buffer[i].remaining_time_in_buffer + ",";
		
		saveFile = saveFile + "\n";
	}


	saveFile = saveFile + "\n";
	saveFile = saveFile + "Video Source\n";
	saveFile = saveFile + "Index,Source\n";
	for(var i = 0; i < result.video_source.length; i++) {
		saveFile = saveFile + i + "," + result.video_source[i] + ",";

		saveFile = saveFile + "\n";
	}

	saveFile = saveFile + "\n";
	saveFile = saveFile + "Network state at time\n";
	saveFile = saveFile + "Video position,Timestamp,State\n";
	for(var i = 0; i < result.network_state_at_time.length; i++) {
		saveFile = saveFile + result.network_state_at_time[i].current_video_position + ",";
		saveFile = saveFile + result.network_state_at_time[i].timestamp_of_network_state + ",";
		saveFile = saveFile + result.network_state_at_time[i].state + ",";
		
		saveFile = saveFile + "\n";
	}

	saveFile = saveFile + "\n";
	saveFile = saveFile + "Frames per second\n";
	saveFile = saveFile + "Video position,Timestamp,Number of frames\n";
	for(var i = 0; i < result.frame_per_second.length; i++) {
		saveFile = saveFile + result.frame_per_second[i].current_video_position + ",";
		saveFile = saveFile + result.frame_per_second[i].timestamp_of_frame + ",";
		saveFile = saveFile + result.frame_per_second[i].number_of_frames + ",";
		
		saveFile = saveFile + "\n";
	}


	saveFile = saveFile + "\n";
	saveFile = saveFile + "Skip play\n";
	saveFile = saveFile + "Video position,Timestamp,Duration of skip\n";
	for(var i = 0; i < result.skip_play.length; i++) {
		saveFile = saveFile + result.skip_play[i].current_video_position + ",";
		saveFile = saveFile + result.skip_play[i].timestamp_of_skip + ",";
		saveFile = saveFile + result.skip_play[i].skip_duration + ",";
		
		saveFile = saveFile + "\n";
	}

	$link.attr("href", 'data:Application/octet-stream,' + encodeURIComponent(saveFile))[0].click();
}

$(document).ready(function() {

	var counter = 0;
	var wait_tree_seconds;
	

	chrome.runtime.sendMessage({
			    action: 'getPreferences'
				},  function(response) {
			   			config = response;
			    	});





    wait_tree_seconds = setInterval(function() {
		
		if((counter == 200 || document.getElementsByTagName('video').length > 0) && (config != null) && (document.getElementsByTagName('video').length > 0 && isNaN(document.getElementsByTagName('video')[0].duration) == false)) {
			clearInterval(wait_tree_seconds);
			
			normalize(config);

			console.log(config);

			
			
			if(config.monitorar == true && config.simulador == "Ativar simulador" && document.URL.indexOf("tests") == -1) {
				start_monitor(config);
			}
			else {
				console.log("Não monitorar");
			}

			if(config.monitorar == true && config.simulador == "Desativar simulador" && document.URL.indexOf("tests") == -1) {
				start_simulator(config);
				start_monitor(config);
			}
		}
		else {
			counter++;
		}
	
	}, 50);

	

/*
while(document.getElementsByTagName('video').length == 0) {
	console.log("ERR");
}*/



// From http://www.jquerybyexample.net/2012/06/get-url-parameters-using-jquery.html

function GetURLParameter(sParam) {
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++)
    {
        var sParameterName = sURLVariables[i].split('=');
        if ((sParameterName[0]).toUpperCase() == sParam.toUpperCase())
        {
            return sParameterName[1];
        }
    }
}

function start_simulator(configuration) {
	var send_to_server = configuration.enviar_para_servidor;
	var has_already_sent_to_server = false;


	

	if(document.getElementsByTagName('video')[0] != null) {

		var url = document.URL;
		var video_element = document.getElementsByTagName('video')[0];
		
		simulador = new Simulador(video_element);

		console.log(video_element.duration);
		
		if(config.show_questionario_simulador && config.enviar_para_servidor) {
			send_simulador(configuration.endereco, configuration, video_element.currentSrc, video_element.duration);
		}

		if(config.show_video_controls)
		 	video_element.controls = true;
		else
			video_element.controls = false;
		video_element.play();
		console.log(video_element);
		console.log("Init simulador");
		
		if(config.ativar_startup_stall)
			simulador.simulate_startup_time();

		
		if(config.ativar_troca_de_resolucao && url == config.url_page_simulador) {
			simulador.add_url_to_change("1", config.url_resolucao_1.trim());
			simulador.add_url_to_change("2", config.url_resolucao_2.trim());
			simulador.add_url_to_change("3", config.url_resolucao_3.trim());
			simulador.add_url_to_change("4", config.url_resolucao_4.trim());
			simulador.add_url_to_change("5", config.url_resolucao_5.trim());
		
			simulador.add_change_at_point(config.resolution_state);
			simulador.start_change_creator();
		}
		
		

		if(config.ativar_stall) {
			simulador.add_stall_duration(config.stall_duration);
			simulador.add_stalls_at_point(config.estado_stall);
			simulador.start_stall_creator();
		}
		
			if(document.URL.indexOf("tests") == -1) {
				document.getElementsByTagName('video')[0].addEventListener("ended", function() {
					if(config.show_questionario_simulador) {
						simulador.stop_all_simulation();
						BootstrapDialog.show( {
				   			title: "Qualidade de experiência - Simulada",
					   		message: $('<div></div>').load(chrome.extension.getURL("remote.html")),
					   		closable: true,
					    	closeByBackdrop: false,
					    	closeByKeyboard: false,
					   	 buttons: [{
					       	label: 'Boa',
					        cssClass: 'btn-primary',
					        action: function(dialogItself) {
					        			if(config.enviar_para_servidor)
						              		send_questionario(configuration.endereco, "Boa");
										dialogItself.close();
				               		}
					       	}, {
					            label: 'Ruim',
					            cssClass: 'btn-danger',
					            action: function(dialogItself) {
					            		if(config.enviar_para_servidor)
											send_questionario(configuration.endereco, "Ruim");
										dialogItself.close();
					               	}
					        }, {
					            label: 'Cancelar',
					            action: function(dialogItself) {
							                dialogItself.close();
					                	}
					        }]
					    });
					}
				});
			}
		

		

	}
}

function start_monitor(configuration) {

	var send_to_server = configuration.enviar_para_servidor;
	var has_already_sent_to_server = false;


	

	if(document.getElementsByTagName('video')[0] != null) {

		var url = document.URL;
		var video_element = document.getElementsByTagName('video')[0];
		var time_interval = configuration.intervalo_de_monitoramento; //In miliseconds
		monitor = new Monitor(video_element, url);

		var uuid = GetURLParameter('uuid');
		if(uuid != null && uuid.length > 0)
			monitor.setNetmetricId(uuid);

		 $(window).on('beforeunload', function() {
			monitor.set_left_time();
			monitor.stop_all_monitoring();
			if(send_to_server && !has_already_sent_to_server) {
				var dt = monitor.json();
				has_already_sent_to_server = true;
			
				chrome.runtime.sendMessage({
			    action: 'monitor',
			    url: configuration.endereco,
				type: "POST",
				data: dt,
				},  function(responseText) {
			    });
			}
			return undefined;

		});

		//Start all monitoring process

		monitor.start_all_monitoring(time_interval, configuration.intervalo_minimo_de_stall);
		
		
		if(document.URL.indexOf("tests") == -1) {
			document.getElementsByTagName('video')[0].addEventListener("ended", function() {
				monitor.stop_all_monitoring();
				console.log(monitor.json());
				if(configuration.relatorio) {
					local_save(monitor.json());
				}
				var dt = monitor.json();
				
				if(send_to_server && !has_already_sent_to_server) {
					has_already_sent_to_server = true;
					chrome.runtime.sendMessage({
				    action: 'monitor',
				    url: configuration.endereco,
					type: "POST",
					data: dt,
					},  function(responseText) {
				   			/*Callback function to deal with the response*/
				    	});
				}
			
					
					

					if(configuration.questionario) {
						BootstrapDialog.show({
			    			title: "Qualidade de experiência",
			    			message: $('<div></div>').load(chrome.extension.getURL("remote.html")),
			    			closable: true,
				            closeByBackdrop: false,
				            closeByKeyboard: false,
				            buttons: [{
				            	label: 'Boa',
				                cssClass: 'btn-primary',
				                action: function(dialogItself){
				                	if(configuration.relatorio) {
										local_save_questionario(monitor.json().start_timestamp, "Boa");
									}
									if(configuration.enviar_para_servidor) {
										send_questionario(configuration.endereco, "Boa");
									}
									dialogItself.close();
				                }
				            }, {
				                label: 'Ruim',
				                cssClass: 'btn-danger',
				                action: function(dialogItself){
									if(configuration.relatorio) {
										local_save_questionario(monitor.json().start_timestamp, "Ruim");
									}
									if(configuration.enviar_para_servidor) {
										send_questionario(configuration.endereco, "Ruim");
									}
									dialogItself.close();
				                }
				            }, {
				                label: 'Cancelar',
				                action: function(dialogItself){
				                    dialogItself.close();
				                }
				            }]
				        });
					}
			});	
		}
		

	}
}

});



if(document.URL.indexOf("tests") > -1) {
	var video_element = document.getElementsByTagName('video')[0];
	var avaliados = 1;


	var source_o = video_element.currentSrc;

	video_element.pause();

	var counter_start = 9;

	var dialogIt = BootstrapDialog.show( {
			title: "Configuração dos testes",
			message: "O teste iniciará em 10 segundos!",
		   	closable: true,
		    closeByBackdrop: false,
		    closeByKeyboard: false
			
	});

	var timer_5_seconds = setInterval(function() {
		if(counter_start > 0) {
			$('.bootstrap-dialog-message').html("O teste iniciará em " + counter_start + " segundos!");
			counter_start--;
		} else {
			clearInterval(timer_5_seconds);
			dialogIt.close();
			var url = document.URL;
			var time_interval = config2.intervalo_de_monitoramento; //In miliseconds
			monitor = new Monitor(video_element, url);
			console.log(config2);
			monitor.start_all_monitoring(time_interval, config2.intervalo_minimo_de_stall);
			simulador = new Simulador(video_element);
			video_element.controls = false;
			
			if(config2.ativar_startup_stall) {
								setTimeout(function() {
									video_element.play();
								}, config2.startup_time);
			} else
				video_element.play();

			
			if(config2.ativar_troca_de_resolucao && url == config2.url_page_simulador) {
				simulador.add_url_to_change("1", config.url_resolucao_1.trim());
				simulador.add_url_to_change("2", config.url_resolucao_2.trim());
				simulador.add_url_to_change("3", config.url_resolucao_3.trim());
				simulador.add_url_to_change("4", config.url_resolucao_4.trim());
				simulador.add_url_to_change("5", config.url_resolucao_5.trim());
			
				simulador.add_change_at_point(config2.resolution_state);
				simulador.start_change_creator();
			}
			
			

			if(config2.ativar_stall) {
				simulador.add_stall_duration(config2.stall_duration);
				simulador.add_stalls_at_point(config2.estado_stall);
				simulador.start_stall_creator();
			}


			

		}
		
	}, 1000);




	



	setTimeout(function() {
		

		chrome.runtime.sendMessage({
				action: 'load',
				data : {'perfil':avaliados},
				url: config.endereco,
				type: "POST",
			}, function(responseText) {
					
				}
			);



		//Start monitoring
	
		

	}, 2000);



	setTimeout(function() {
		

		chrome.runtime.sendMessage({
			action: 'create_link',
			url: config.endereco,
			type: "POST",
		}, function(responseText) {
				
			}
		);



		//Start monitoring
	
		

	}, 3000);

		




		



	setTimeout(function() {
			
			chrome.runtime.sendMessage({
				action: 'get_remote',
				url: config.endereco,
				type: "POST",
			}, function(responseText) {
				console.log(responseText);
					config2 = responseText;
				}
			);
	}, 4000);




	



	//Load config avaliados 1





	$("#avaliar").click(function() {

		//simulador.stop_all_simulation();
		



		//Enviar dados da simulacao

		monitor.stop_all_monitoring();
		simulador.stop_all_simulation();




		var dt = monitor.json();
		dt["teste_simulado"] = true;
		dt["perfil"] = avaliados;
		dt["end_o"] = "0.0.0.0:3000";
		
		chrome.runtime.sendMessage({
			action: 'monitor',
			url: config2.endereco,
			type: "POST",
			data: dt,
		},  function(responseText) {
		
			}
		);



		var return_object = {};

		return_object["start_timestamp"] = Date.now();
		return_object["ativar_stall"] = config2.ativar_stall;
		return_object["ativar_startup_stall"] = config2.ativar_startup_stall;
		return_object["ativar_troca_de_resolucao"] = config2.ativar_troca_de_resolucao;
		return_object["show_video_controls"] = config2.show_video_controls;
		return_object["stall_duration"] = config2.stall_duration;
		return_object["startup_time"] = config2.startup_time;
		return_object["url_page_simulador"] = config2.url_page_simulador;
		return_object["url_resolucao_1"] = config2.url_resolucao_1;
		return_object["url_resolucao_2"] = config2.url_resolucao_2;
		return_object["url_resolucao_3"] = config2.url_resolucao_3;
		return_object["url_resolucao_4"] = config2.url_resolucao_4;
		return_object["url_resolucao_5"] = config2.url_resolucao_5;
		return_object["url_resolucao_6"] = source_o;
		return_object["resolution_state"] = config2.resolution_state;
		return_object["estado_stall"] = config2.estado_stall;
		return_object["video_duration"] = video_element.duration;
		return_object["perfil"] = avaliados;
		return_object["teste_simulado"] = true;

		chrome.runtime.sendMessage({
			action: 'simulador',
			url: config.endereco,
			type: "POST",
			data: return_object,
		},  function(responseText) {

		});





		chrome.runtime.sendMessage({
			action: 'load',
			url: config.endereco,
			data : {'perfil' : avaliados+1},
			type: "POST",
		}, function(responseText) {
				
			}
		);


		setTimeout(function() {
			
			chrome.runtime.sendMessage({
				action: 'get_remote',
				url: config.endereco,
				type: "POST",
			}, function(responseText) {
					config2 = responseText;
				}
			);
		}, 1500);








		//Envia parametros do simulador

		//send_simulador(config.endereco, config, video_element.currentSrc, video_element.duration);



		clearInterval(timer_for_change_);
		avaliados = avaliados + 1;
		var duration = video_element.duration;
	
		video_element.pause();
		video_element.currentTime = video_element.currentTime - 1;
	
		timer_for_change_= setInterval(function() {
			if(video_element.currentTime > avaliados * (video_element.duration/5.0)) {
				clearInterval(timer_for_change_);
				$("#avaliar").click();
			}
		}, 300);



		// LOAD PROXIMO MOS



		BootstrapDialog.show( {
			title: "Qualidade de experiência - Simulada",
			message: $('<div></div>').load("../resources/html/remote.html"),
		   	closable: true,
		    closeByBackdrop: false,
		    closeByKeyboard: false,
			buttons: [{
			      		label: 'Boa',
			        	cssClass: 'btn-primary',
				        action: function(dialogItself) {
				       		
				       		var return_object = {};
							return_object["opinion"] = "Boa";
							return_object["rating"] = $('#rating').raty('score');
							return_object["conteudo"] = $("#conteudo").val();
							return_object["diario"] = $("#diario").val();
							return_object["tempo"] = $('input[name="tempo"]:checked').val();
							return_object["idade"] = $("#idade").val();
							return_object["sexo"] = $('input[name="sex"]:checked').val();
							return_object["pais"] = $("#pais").val();
							return_object["comment"] = $("#comment").val();
							return_object["perfil"] = avaliados-1
							return_object["teste_simulado"] = true;
							return_object["end_o"] = "";

							chrome.runtime.sendMessage({
								action: 'questionario',
								url: config.endereco,
								type: "POST",
								data: return_object,
							},  function(responseText) {
							});


				       		

							var time_interval = config2.intervalo_de_monitoramento; //In miliseconds
							var url = document.URL;
							video_element.currentTime = (avaliados-1) * (video_element.duration/5.0);
							
							monitor = new Monitor(video_element, url);
							monitor.start_all_monitoring(time_interval, config2.intervalo_minimo_de_stall);



							simulador = new Simulador(video_element);
							video_element.controls = false;
							
							if(config2.ativar_startup_stall) {
								setTimeout(function() {
									video_element.play();
								}, config2.startup_time);
							}
								//simulador.simulate_startup_time();

							
							
							if(config2.ativar_troca_de_resolucao && url == config2.url_page_simulador) {
								simulador.add_url_to_change("1", config2.url_resolucao_1.trim());
								simulador.add_url_to_change("2", config2.url_resolucao_2.trim());
								simulador.add_url_to_change("3", config2.url_resolucao_3.trim());
								simulador.add_url_to_change("4", config2.url_resolucao_4.trim());
								simulador.add_url_to_change("5", config2.url_resolucao_5.trim());
							
								simulador.add_change_at_point(config.resolution_state);
								simulador.start_change_creator();
							}
							
							

							if(config2.ativar_stall) {
								simulador.add_stall_duration(config2.stall_duration);
								simulador.add_stalls_at_point(config2.estado_stall);
								simulador.start_stall_creator();
							}





							if(avaliados < 6 && config2.ativar_startup_stall == false)
								video_element.play();
								


							dialogItself.close();
				       	}	
					}, {
					    label: 'Ruim',
					    cssClass: 'btn-danger',
						action: function(dialogItself) {
						    var return_object = {};
							return_object["opinion"] = "Ruim";
							return_object["rating"] = $('#rating').raty('score');
							return_object["conteudo"] = $("#conteudo").val();
							return_object["diario"] = $("#diario").val();
							return_object["tempo"] = $('input[name="tempo"]:checked').val();
							return_object["idade"] = $("#idade").val();
							return_object["sexo"] = $('input[name="sex"]:checked').val();
							return_object["pais"] = $("#pais").val();
							return_object["comment"] = $("#comment").val();
							return_object["perfil"] = avaliados-1
							return_object["teste_simulado"] = true;
							return_object["end_o"] = "0.0.0.0:3000";

							chrome.runtime.sendMessage({
								action: 'questionario',
								url: config.endereco,
								type: "POST",
								data: return_object,
							},  function(responseText) {
							});



							var time_interval = config2.intervalo_de_monitoramento; //In miliseconds
							var url = document.URL;
							video_element.currentTime = (avaliados-1) * (video_element.duration/5.0);
							
							monitor = new Monitor(video_element, url);
							monitor.start_all_monitoring(time_interval, config2.intervalo_minimo_de_stall);



							simulador = new Simulador(video_element);
							video_element.controls = false;
							
							
							if(config2.ativar_startup_stall) {
								setTimeout(function() {
									video_element.play();
								}, config2.startup_time);
							}

								
							
							
							if(config2.ativar_troca_de_resolucao && url == config2.url_page_simulador) {
								simulador.add_url_to_change("1", config2.url_resolucao_1.trim());
								simulador.add_url_to_change("2", config2.url_resolucao_2.trim());
								simulador.add_url_to_change("3", config2.url_resolucao_3.trim());
								simulador.add_url_to_change("4", config2.url_resolucao_4.trim());
								simulador.add_url_to_change("5", config2.url_resolucao_5.trim());
							
								simulador.add_change_at_point(config2.resolution_state);
								simulador.start_change_creator();
							}
							
							

							if(config2.ativar_stall) {
								simulador.add_stall_duration(config2.stall_duration);
								simulador.add_stalls_at_point(config2.estado_stall);
								simulador.start_stall_creator();
							}





							if(avaliados < 6 && config2.ativar_startup_stall == false)
								video_element.play();



							dialogItself.close();


						}
					}]
		});
	});

	var timer_for_change_= setInterval(function() {
		if(video_element.currentTime > avaliados * (video_element.duration/5.0)) {
			clearInterval(timer_for_change_);
			$("#avaliar").click();
			
			
		}
	}, 300);
}

