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
    el = $(this);
    content = parseInt(el.text());
    console.log(content)

    if (content >= 10) {
      klass = 'green_90'
    } else if (content == 9) {
      klass = 'green_90'
    } else if (content == 8) {
      klass = 'green_80'
    } else if (content == 7) {
      klass = 'green_70'
    } else if (content == 6) {
      klass = 'green_60'
    } else if (content == 5) {
      klass = 'green_50'
    } else if (content == 4) {
      klass = 'green_40'
    } else if (content == 3) {
      klass = 'green_30'
    } else if (content == 2) {
      klass = 'green_20'
    } else if (content == 1) {
      klass = 'green_10'
    } else if (content == 0) {
      klass = 'draw'
    } else if (content == -1) {
      klass = 'red_10'
    } else if (content == -2) {
      klass = 'red_20'
    } else if (content == -3) {
      klass = 'red_30'
    } else if (content == -4) {
      klass = 'red_40'
    } else if (content == -5) {
      klass = 'red_50'
    } else if (content == -6) {
      klass = 'red_60'
    } else if (content == -7) {
      klass = 'red_70'
    } else if (content == -8) {
      klass = 'red_80'
    } else if (content == -9) {
      klass = 'red_90'
    } else if (content <= -10) {
      klass = 'red_90'
    }

    el.addClass(klass);
  });

  // Color skill rating
  $('.skill-rating').each(function() {
    el = $(this);
    table = $('#matches');
    content = parseInt(el.text());
    first_match_sr = table.data('first');

    if (content > first_match_sr) {
      klass = 'win'
    } else if (content < first_match_sr) {
      klass = 'lose'
    } else {
      klass = 'draw'
    }

    el.addClass(klass);
  });


  // enable tooltips
  $(function () {
    $('[data-toggle="tooltip"]').tooltip();
  });

  // enable popovers
  $(function () {
    $('[data-toggle="popover"]').popover();
  })


  // Color percent values
  $('.wins-percent').each(function() {
    el = $(this)
    content = parseFloat(el.text());
    if (content == 50.0) {
      klass = null
    } else if (content > 90.0) {
      klass = 'green_90'
    } else if (content >= 80.0 && content < 90.0) {
      klass = 'green_80'
    } else if (content >= 80.0 && content < 90.0) {
      klass = 'green_80'
    } else if (content >= 70.0 && content < 80.0) {
      klass = 'green_70'
    } else if (content >= 60.0 && content < 70.0) {
      klass = 'green_60'
    } else if (content >= 50.0 && content < 60.0) {
      klass = 'green_50'
    } else if (content >= 40.0 && content < 50.0) {
      klass = 'red_60'
    } else if (content >= 30.0 && content < 40.0) {
      klass = 'red_70'
    } else if (content >= 20.0 && content < 30.0) {
      klass = 'red_80'
    } else if (content >= 0.0 && content < 20.0) {
      klass = 'red_90'
    }

    el.addClass(klass);
  });

  // Color percent values
  $('.losses-percent').each(function() {
    el = $(this)
    content = parseFloat(el.text());
    if (content == 50.0) {
      klass = null
    } else if (content > 90.0) {
      klass = 'red_90'
    } else if (content >= 80.0 && content < 90.0) {
      klass = 'red_80'
    } else if (content >= 80.0 && content < 90.0) {
      klass = 'red_80'
    } else if (content >= 70.0 && content < 80.0) {
      klass = 'red_70'
    } else if (content >= 60.0 && content < 70.0) {
      klass = 'red_60'
    } else if (content >= 50.0 && content < 60.0) {
      klass = 'red_50'
    } else if (content >= 40.0 && content < 50.0) {
      klass = 'green_60'
    } else if (content >= 30.0 && content < 40.0) {
      klass = 'green_70'
    } else if (content >= 20.0 && content < 30.0) {
      klass = 'green_80'
    } else if (content >= 0.0 && content < 20.0) {
      klass = 'green_90'
    }

    el.addClass(klass);
  });
});

