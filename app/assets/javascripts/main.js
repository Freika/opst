$(document).on('turbolinks:load ajax:success', function() {
  $('.select2').select2();

  // Color win/lose/draw
  $('.result').each(function() {
    el = $(this);
    klass = el.text().toLowerCase();

    el.addClass(klass);
  });


  // Color skill rating diff
  $('.skill-rating-diff').each(function() {
    el = $(this);
    klass = el.siblings('.result').text().toLowerCase();

    el.addClass(klass);
  });


  // Color streak
  $('.streak').each(function() {
    el = $(this)
    content = parseInt(el.text());

    if (content > 0) {
      klass = 'win'
    } else if (content < 0) {
      klass = 'lose'
    } else {
      klass = 'draw'
    }

    el.addClass(klass);
  });


  // Color skill rating
  $('.skill-rating').each(function() {
    el = $(this)
    content = parseInt(el.text());
    first_match_sr = gon.first_match_sr

    if (content > first_match_sr) {
      klass = 'win'
    } else if (content < first_match_sr) {
      klass = 'lose'
    } else {
      klass = 'draw'
    }

    el.addClass(klass);
  });
});

