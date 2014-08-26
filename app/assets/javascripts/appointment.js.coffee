class AppointmentCalendar
  init: ->
    
    $.ajaxSetup { cache: false }

    this.getData()
    $('#start_date, #end_date').datepicker({ dateFormat: 'dd/mm/yy' })
    
    default_action = $('form').attr 'action'
    action = ''
    method ='POST'
    
    $('#start_date, #end_date, #state').change ()->

      status = parseInt $('#state').val()
      $('form').attr 'action', default_action

      if status == 2
        
        start = $('#start_date').val()
        end = $('#end_date').val()

        if start && end
          url = "/remove_appointments/space/#{ $('#space_id').val()}"
          $('form').attr 'action', url

  getData: ->
    url = "/get_bookings/space/#{ $('#space_id').val()}"
    $.ajax({dataType: 'json', data : {}, url : url, success : (data) -> wireResults(data) })

  wireResults=(results) ->

    $('.day').removeClass 'booked';
    $.each results, (i, item) ->
      daystart = new Date(item.start_date).getDate()
      dayend   = new Date(item.end_date).getDate()
      
      $.each [daystart .. dayend], (i, item) ->
        $("[day_num=#{item}]").addClass 'booked'

@Appearhere = {} unless @Appearhere?
@Appearhere.appointment_cal = new AppointmentCalendar()
$(document).ready -> Appearhere.appointment_cal.init()
