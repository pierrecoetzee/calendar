class AppointmentCalendar
  init: ->
    
    getData()
    $('input[type=date]').datepicker()
    
    default_action = $('form').attr 'action'
    action = ''
    method ='POST'
    
    $('#state').change ()->
      status = parseInt $(this).val()
      $('form').attr 'action', default_action

      if status == 2
        start = $('#start_date').val()
        end = $('#end_date').val()
        if start && end
          $('form').attr 'action', "/remove_appointments"

  getData=() ->
    url = '/get_bookings/space/887608180'
    $.ajax({dataType: 'json', data : {}, url : url, success : (data) -> wireResults(data) })

  wireResults=(results) ->

    $.each results, (i, item) ->
      daystart = new Date(item.start_date).getDate()
      dayend   = new Date(item.end_date).getDate()
      
      $.each [daystart .. dayend], (i, item) ->
        $("[day_num=#{item}]").addClass 'booked'

    


@Appearhere = {} unless @Appearhere?
@Appearhere.appointment_cal = new AppointmentCalendar()
$(document).ready -> Appearhere.appointment_cal.init()
