// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .


//set default degree (360*5)
var degree = 1800;
//number of clicks = 0
var clicks = 0;

$(document).ready(function() {
  /*WHEEL SPIN FUNCTION*/
  $('#spin').click(function() {
    //add 1 every click
    clicks++; //1
    /*multiply the degree by number of clicks
    generate random number between 1 - 360,
    then add to the new degree*/
    var newDegree = degree * clicks; //1800*1
    var extraDegree = Math.floor(Math.random() * (360 - 1 + 1)) + 1; // 99
    totalDegree = newDegree + extraDegree; // 1800 + 99 = 1899
    revealChoice = setTimeout(function(){  // function executes ones after a specified number
      finalValue = totalDegree % 360
      switch (true) {
        case ((finalValue >= 0 && finalValue <= 27) || (finalValue >= 316 && finalValue <= 360)):
          var $drink = $("#drink0")   //trophy           
          break;
        case (finalValue >= 28 && finalValue <= 100):
          var $drink = $("#drink1")   //tint
          break;
        case (finalValue >= 101 && finalValue <= 164):
          var $drink = $("#drink2")   //fire
          break;
        case (finalValue >= 165 && finalValue <= 214):
          var $drink = $("#drink3")   //heart
          break;
        case (finalValue >= 215 && finalValue <= 260):
          var $drink = $("#drink4")   //bolt
          break;
        case (finalValue >= 261 && finalValue <= 315):
          var $drink = $("#drink5")   //star
          break;
      }
      var name = $drink.val();
      var drink_id = $drink.data('id');
      var wheel_id = $("#wheel-id").val();
      var user_id = $("#user-id").val();

      
      
      $.post( "wheels/" + wheel_id + "/spin", 
        { 
          user_id: user_id, 
          drink_id: drink_id 
        }
      )
      .done(function() {         // success callback 
      console.log($drink)             
        $('#txt').avgrund({
          width: 350,
          height: "auto",
          closeByEscape: true,
          closeByDocument: true,          
          template: "<div class='thumbnail'> <div class='row'> <div class='col-sm-5'><img src=" + $drink.data('url') +  "/></div> <div class='col-sm-5'> <div class='caption'> <h3>" + $drink.val() + "</h3> <h6>" + $drink.data('description') + "</h6> </div> </div> </div> </div>" 
          
        });  
        $('#txt').trigger('click')
      });
    }, 6000)
    /*let's make the spin btn to tilt every
    time the edge of the section hits
    the indicator*/
    $('#wheel .sec').each(function() {
      var t = $(this);
      var noY = 0;

      var c = 0;
      var n = 700;

      var interval = setInterval(function() {
        c++;
        if (c === n) {
          clearInterval(interval);
        }

        var aoY = t.offset().top;
        $("#txt").html(aoY);
        // console.log(aoY);

        /*23.7 is the minumum offset number that
        each section can get, in a 30 angle degree.
        So, if the offset reaches 23.7, then we know
        that it has a 30 degree angle and therefore,
        exactly aligned with the spin btn*/
        if (aoY < 23.89) {
          $('#spin').addClass('spin');
          setTimeout(function() {
            $('#spin').removeClass('spin');
          }, 100);
        }
      }, 10);

      $('#inner-wheel').css({
        'transform': 'rotate(' + totalDegree + 'deg)'
      });
      noY = t.offset().top;
    }); // end btn tilting
  });
}); //DOCUMENT READY
	
	

togglePanes = function(elem1, elem2){
	console.log("toggle");
  $(elem1).toggle();
  $(elem2).toggle();
}

// wheel is spinning.....and when it stops you have a result that is written to #txt
// #txt 12344.43754745


