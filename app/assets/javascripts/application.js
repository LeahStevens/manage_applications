// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

//= require foundation
$(document).foundation();

'use strict';
$(document).ready(initialize);

function initialize(){
  $('#detailsButton').click(masterFunction);
  $('table').on('click', '.remove', remove);
  $('.deleteStepsButton').click(deleteStep);
}


function masterFunction(){
  submitStep();
  transferSteps();
}

 function submitStep() {
  var value = $('#step').val();
  var projectId = $(projectIdAddToList).data("id")

      $.ajax({
           type:'GET',
           url: 'steps/new',
           data: "name=" + value + "&project_id=" + projectId
      });
  document.getElementById("step").value = '';
 }


function deleteStep(){
  // console.log("button clicked");
  // console.log(this);

  var thisId = $(this).data("id");
  // console.log(thisId);



  $.ajax({
    url: "/steps/" + thisId,
    type: "post",
    dataType: "json",
    data: {"_method":"delete"}
  });
}


 // function submitSteps() {
 //      $.ajax({
 //           type:'POST',
 //           url: 'steps/new',
 //           data: {"checked": this.checked}
 //      });
 // }



function transferSteps(){
  var step = $('#step').val();


  var $tr = $('<tr>');


  var $stepTd = $('<td>');
  $stepTd.text(step);

  var $done = $('<td>');
  $done.addClass('done');

  var $checkbox = $('<input>');
  $checkbox.attr('type', 'checkbox');
  $checkbox.addClass('checkbox');

  var $remove = $('<td>');
  $remove.addClass('remove');
  var $removeEntry = $('<input>');
  $removeEntry.attr('type', 'button');
  $removeEntry.val('Remove');
  $removeEntry.addClass('removeEntry');


  $done.append($checkbox);
  $remove.append($removeEntry);
  $tr.append($stepTd, $done, $remove);
  $('table').append($tr);


}



function remove(){
  var $removeEntry = $(this);
  $removeEntry.parent().remove();
}













