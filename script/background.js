/**
 * Possible parameters for request:
 *  action: "xhttp" for a cross-origin HTTP request
 *  method: Default "GET"
 *  url   : required, but not validated
 *  data  : data to send in a POST request
 *
 * The callback function is called upon completion of the request */

var config = null;
var monitor_questionario_join = null;
var simulador_questionario_join = null;
var remote_config = null;
var finish_load = false;

chrome.storage.sync.get({
    endereco: "http://0.0.0.0:3000",
    monitorar: true,
    questionario: true,
    relatorio: false,
    intervalo_minimo_de_stall : 50,
    intervalo_de_monitoramento : 1000,
    enviar_para_servidor : true,
    estado_stall : {"pos0":"undefined"},
    resolution_state : {"pos0":"undefined"},
    startup_time : 1000,
    stall_duration : 1000,
    simulador : "Ativar simulador",
    ativar_startup_stall : true,
    ativar_stall : true,
    show_video_controls : true,
    show_questionario_simulador : true,
    url_resolucao_1 : "",
    url_resolucao_2 : "",
    url_resolucao_3 : "",
    url_resolucao_4 : "",
    url_resolucao_5 : "",
    ativar_troca_de_resolucao : true,
    url_page_simulador : "",
    receber_do_servidor : true,
    timestamp : ""

}, function(items) {
        config = items;
});

chrome.storage.onChanged.addListener(function(changes, namespace) {
        for (key in changes) {
          var storageChange = changes[key];
          config[key] = storageChange.newValue;
        }
});


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


if(c.receber_do_servidor == "true" || c.receber_do_servidor == "1")
    c.receber_do_servidor = true;
  if(c.receber_do_servidor == "false" || c.receber_do_servidor == "0")
    c.receber_do_servidor = false;

    

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

  

 c.startup_time = Number(c.startup_time);
 c.stall_duration = Number(c.stall_duration);

}






chrome.runtime.onMessage.addListener(function(request, sender, sendResponse) {
    console.log(request);

    if (request.action == "get_remote") {
        if(finish_load) {
            remote_config['status'] = "OK";
            sendResponse(remote_config);
            finish_load = false;
        }
        else {
            sendResponse({'status':"WAIT"});
        }
    }


    if (request.action == "load") {
        $.ajax({
                    url: request.url + "/config/" + "can_load",
                    type: request.type,
                    data: JSON.stringify(request.data),
                    contentType: "application/json",
                    success: function(result) {
                        if($.parseJSON(result).can_load == "true") {
                            console.log("LOAD FROM SERVER");

                            $.ajax({
                                url: request.url + "/config/" + request.action,
                                type: request.type,
                                contentType: "application/json",
                                success: function(result) {
                                    var result_json = $.parseJSON(result);
                                    normalize(result_json);
                                    remote_config = result_json;
                                    finish_load = true;
                                }

                            });


                                
                        }
                        
                    }

        });
        
       
    }



    if (request.action == "monitor") {
        simulador_questionario_join = null;
        monitor_questionario_join = null;
        $.ajax({
            url: request.url + "/api/" + request.action,
            type: request.type,
            data: JSON.stringify(request.data),
            contentType: "application/json",
            success: function(result) {
                console.log(result);
                monitor_questionario_join = $.parseJSON(result);
            }

        });
       
    }

    if (request.action == "simulador") {
        simulador_questionario_join = null;
        monitor_questionario_join = null;
        $.ajax({
            url: request.url + "/api/" + request.action,
            type: request.type,
            data: JSON.stringify(request.data),
            contentType: "application/json",
            success: function(result) {
                console.log(result);
                simulador_questionario_join = $.parseJSON(result);
            }

        });


        $.ajax({
            url: request.url + "/api/" + "plugin",
            type: request.type,
            data: JSON.stringify(config),
            contentType: "application/json",
            success: function(result) {
                //console.log(result);
            }

        });


       
    }

    if (request.action == "questionario") {
        normalize(config)
        if(config.monitorar && monitor_questionario_join != null) {
            request.data["timestamp"] = monitor_questionario_join["timestamp"];
            request.data["hash"] = monitor_questionario_join["hash"];
            request.data["ip"] = monitor_questionario_join["ip"];
            simulador_questionario_join = null;
            monitor_questionario_join = null;
        } else if(config.simulador == "Desativar simulador" && simulador_questionario_join != null) {
                    request.data["timestamp"] = simulador_questionario_join["timestamp"];
                    request.data["hash"] = simulador_questionario_join["hash"];
                    request.data["ip"] = simulador_questionario_join["ip"];
          } else  {
                    request.data["timestamp"] = "";
                    request.data["hash"] = "";
                    request.data["ip"] = "";
            }

        $.ajax({
            url: request.url + "/api/" + request.action,
            type: request.type,
            data: JSON.stringify(request.data),
            contentType: "application/json",
            success: function(result) {
               
            }
        });
        
    }
    
    if(request.action == "getPreferences") {
        sendResponse(config);
    }
});

