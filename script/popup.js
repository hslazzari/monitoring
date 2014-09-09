// Copyright (c) 2012 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/*
function click(e) {
  chrome.tabs.executeScript(null,
      //{code:"document.body.style.backgroundColor='" + e.target.id + "'"});
	{code:"document.body.style.backgroundColor='" + "red" + "'"});

  window.close();
}
*/
document.addEventListener('DOMContentLoaded', function () {
	$("#btn").click(function() {
	  	if($(this).html() === "Start Monitoring") {
	  		$(this).html("Stop Monitoring");
			$(this).removeClass("green");
			$(this).addClass("red");
		} else {
			$(this).html("Start Monitoring");
			$(this).removeClass("red");
			$(this).addClass("green");
		}
	});
});
