// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$( document ).on('turbolinks:load',
	function(){
	$(".showTableBtn").click(function(){
		var target = $(this).data('target');
		$($(this).data('target')).show();
	});
	$(".hideTableBtn").click(function(){
		$($(this).data('target')).hide();
	});
	$(".add-row").click(function(){
		var number_cols = $(this).data('numcols');
		var markup = "<tr><td><a href='#' class='glyphicon glyphicon-floppy-disk'></a></td>";
		for (i = 1; i < number_cols; i++) {
			markup += "<td></td>";
		}
		markup += "</tr>";
		$($(this).data('target')).append(markup);
	});
	$(".delete-partner-membership").click(function(){
		var partner_membership_id = $(this).data('partner_membership_id');
		location.href='/partner_memberships/' + partner_membership_id;
	});
});