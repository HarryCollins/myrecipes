// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .


console.log("application.js loaded");

var ready;
ready = function() {

	$(".scroll_to_form").click(function() {
	    $('html, body').animate({
	        scrollTop: $("#scroll_target").offset().top - 100
	    }, 600, function() {
	    	$("#header_input").focus();
	    });
	});

};




$(document).ready(ready);
$(document).on("page:load", ready);