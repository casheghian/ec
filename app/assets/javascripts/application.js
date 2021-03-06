// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require twitter/bootstrap/bootstrap-transition
//= require twitter/bootstrap/bootstrap-alert
//= require twitter/bootstrap/bootstrap-modal
//= require twitter/bootstrap/bootstrap-dropdown
//= require twitter/bootstrap/bootstrap-scrollspy
//= require twitter/bootstrap/bootstrap-tab
//= require twitter/bootstrap/bootstrap-tooltip
//= require twitter/bootstrap/bootstrap-popover
//= require twitter/bootstrap/bootstrap-button
//= require twitter/bootstrap/bootstrap-collapse
//= require twitter/bootstrap/bootstrap-carousel
//= require twitter/bootstrap/bootstrap-typeahead
$(document).ready(function() {

	$('.secondary li').hide();

	if($('#offer_options input[type="checkbox"]').first().prop('checked') === true ){
		$('#advanced_search select').attr('disabled', false);}
	else {
		$('#advanced_search select').attr('disabled', true);
	}


	$('.main-options input:checked').each(function() {
		$(this).parent().show();
	 	$('.modal-body input[id="' + $(this).val() + '"]').prop("checked", this.checked);
	});
	

	$(".main-options input").change(function() {
		$("#search_form").submit();
   		$('.modal-body input[id="' + $(this).val() + '"]').prop("checked", this.checked);
	});
		

	$(".modal-body input").change(function() {
		$("#search_form").submit();

		if( $('.main-options input[value="' + $(this).attr('name') + '"]').is(':visible')){
   		$('.main-options input[value="' + $(this).attr('name') + '"]').prop("checked", this.checked);
		}
		else {	
		$('.secondary input[value="' + $(this).attr('name') + '"]').parent().show();
		$('.secondary input[value="' + $(this).attr('name') + '"]').prop("checked", this.checked);
		}	
	});

	$("#offer_options input").change(function() {
		$("#search_form").submit();
			if( $('#offer_options input[type="checkbox"]').first().prop('checked') === true ){
				$('select').attr('disabled', false);}
		else {	
		  $('select').attr('disabled', true);}
		});

	$("#availability_options input").change(function() {
		$("#search_form").submit();
	
	});

	$("#search_max_party_input").change(function() {
		$("#search_form").submit();
	
	});

	$('.accordion-body').each(function(){
	    if ($(this).hasClass('in')) {
	        $(this).collapse('toggle');
	    }
	});
	  $(".listing").on("mouseover", function() {
	  	$(this).addClass("active");

	    $('.my-marker[id="' + $(this).attr('id') + '"]').addClass("marker-active");
	  });
	  $(".listing").on("mouseleave", function() {
	  	$(this).removeClass("active");
	    $('.my-marker[id="' + $(this).attr('id') + '"]').removeClass("marker-active");
	  });

	  $('.tag').tooltip({
	  	placement: 'bottom'

	  });
});
