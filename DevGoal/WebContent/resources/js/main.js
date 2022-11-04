$(function() {

  var from_$input = $('#input_from').pickadate(),
    from_picker = from_$input.pickadate('picker')
    
  var to_$input = $('#input_to').pickadate(),
    to_picker = to_$input.pickadate('picker')
    
  var from2_$input = $('#input_from2').pickadate(),
   from2_picker = from2_$input.pickadate('picker')
    
  var to2_$input = $('#input_to2').pickadate(),
    to2_picker = to2_$input.pickadate('picker')


  // Check if there’s a “from” or “to” date to start with.
  if ( from_picker.get('value') ) {
    to_picker.set('min', from_picker.get('select'))
  }
  if ( to_picker.get('value') ) {
    from_picker.set('max', to_picker.get('select'))
  }
  if ( from2_picker.get('value') ) {
    to2_picker.set('min', from2_picker.get('select'))
  }
  if ( to2_picker.get('value') ) {
    from2_picker.set('max', to2_picker.get('select'))
  }

  // When something is selected, update the “from” and “to” limits.
  from_picker.on('set', function(event) {
    if ( event.select ) {
      to_picker.set('min', from_picker.get('select'))    
    }
    else if ( 'clear' in event ) {
      to_picker.set('min', false)
    }
  })
  to_picker.on('set', function(event) {
    if ( event.select ) {
      from_picker.set('max', to_picker.get('select'))
    }
    else if ( 'clear' in event ) {
      from_picker.set('max', false)
    }
  })
   from2_picker.on('set', function(event) {
    if ( event.select ) {
      to2_picker.set('min', from2_picker.get('select'))    
    }
    else if ( 'clear' in event ) {
      to2_picker.set('min', false)
    }
  })
  to2_picker.on('set', function(event) {
    if ( event.select ) {
      from2_picker.set('max', to2_picker.get('select'))
    }
    else if ( 'clear' in event ) {
      from2_picker.set('max', false)
    }
  })

});