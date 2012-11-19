/* Code for tabs */
$(document).ready(function() 
	{ $(".ASBTabs .ASBTab[id^=ASBTabMenu]").click(function() {var curMenu = $(this);
		var cur_index=curMenu.attr("id").split("ASBTabMenu")[1];
		var old_index=$(".ASBTabs .selected").attr("id").split("ASBTabMenu")[1];
			if (cur_index==old_index) 
			{return;}$(".ASBTabs .ASBTab[id^=ASBTabMenu]").removeClass("selected");
			curMenu.addClass("selected");
			$("#ASBTabContent"+old_index).slideUp('slow');
			$("#ASBTabContent"+cur_index).slideDown('slow');});});
			
			
/* Accordion js start V1
			$(document).ready(function(){$('.AccordionContent').hide();
			$('.AccordionHeader:first').addClass('active').next().show();
			$('.AccordionHeader').click(function(){if( $(this).next().is(':hidden') ) 
			{$('.AccordionHeader').removeClass('active').next().slideUp();
			$(this).toggleClass('active').next().slideDown();}
			return false;});});
			 */	
			
/*  Accordion js start V2 	*/ 
$(function(){
  //  Accordion Panels
  $(".ASBaccordion div.AccordionContent").show();
  setTimeout ("$('.ASBaccordion div.AccordionContent').slideToggle('slow');", 1000);
  $(".ASBaccordion h2").click(function(){
      $(this).next(".AccordionContent").slideToggle("slow").siblings(".pane:visible").slideUp("slow");
    $(this).toggleClass("active");
//    $(this).siblings("h2").removeClass("active");
  });
});

/* Toggle */
$(window).load(function(){
	$(".trigger").click(function(){
		$(this).next().slideToggle("slow");
	  });
});

/* Toggle  End*/