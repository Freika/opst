$(document).on('turbolinks:load', function() {
  $('.select2').select2();

  // Color win/lose/draw
  $('.result').each(function() {
    var $el = $(this);
    var content = $el.text().toLowerCase();

    if (content == 'win') {
      klass = 'win'
    } else if (content == 'lose') {
      klass = 'lose'
    } else {
      klass = 'draw'
    }

    $el.addClass(klass);
  });


  // Color skill rating diff
  $('.skill-rating-diff').each(function() {
    $el = $(this)
    content = $el.text();
    if (parseInt(content) > 0) {
      klass = 'win'
    } else if (parseInt(content) < 0) {
      klass = 'lose'
    } else {
      klass = 'draw'
    }

    $el.addClass(klass);
  });


  // Color streak
  $('.streak').each(function() {
    $el = $(this)
    content = $el.text();
    if (parseInt(content) > 0) {
      klass = 'win'
    } else if (parseInt(content) < 0) {
      klass = 'lose'
    } else {
      klass = 'draw'
    }

    $el.addClass(klass);
  });
});

