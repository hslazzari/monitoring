
function normalize(c) {
  if(c.monitorar == "true")
    c.monitorar = true;
  if(c.monitorar == "false")
    c.monitorar = false;

  if(c.questionario == "true")
    c.questionario = true;
  if(c.questionario == "false")
    c.questionario = false;

  if(c.relatorio == "true")
    c.relatorio = true;
  if(c.relatorio == "false")
    c.relatorio = false;
}



// Saves options to chrome.storage
function save_options() {
  var ende = document.getElementById('endereco').value;
  chrome.storage.sync.set({
    endereco: ende,
    monitorar: $('input[name="monitorar"]:checked').val(),
    questionario: $('input[name="questionario"]:checked').val(),
    relatorio: $('input[name="relatorio"]:checked').val()
  }, function() {
    // Update status to let user know options were saved.
   /* var status = document.getElementById('status');
    status.textContent = 'Options saved.';
    setTimeout(function() {
      status.textContent = '';
    }, 750);*/
  });
}

// Restores select box and checkbox state using the preferences
// stored in chrome.storage.


function restore_options() {



  // Use default value color = 'red' and likesColor = true.
  chrome.storage.sync.get({
    endereco: "http://0.0.0.0:3000",
    monitorar: "true",
    questionario: "true",
    relatorio: "false"

  }, function(items) {

    normalize(items);
    //document.getElementById('color').value = items.favoriteColor;
    //document.getElementById('like').checked = items.likesColor;
    document.getElementById('endereco').value = items.endereco;
    if(items.monitorar) {
        $('input[name="monitorar"]')[0].checked = true;
    } else {
        $('input[name="monitorar"]')[1].checked = true;
    }

    if(items.questionario) {
        $('input[name="questionario"]')[0].checked = true;
    } else {
        $('input[name="questionario"]')[1].checked = true;
    }

    if(items.relatorio) {
        $('input[name="relatorio"]')[0].checked = true;
    } else {
        $('input[name="relatorio"]')[1].checked = true;
    }    
  });
}
document.addEventListener('DOMContentLoaded', restore_options);
document.getElementById('save').addEventListener('click',
    save_options);