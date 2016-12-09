$(document).on('turbolinks:load', function() {
  $(function() {
    Highcharts.setOptions({
      colors: ['#72FF61', '#FF7070', '#DCDCDC']
    });

    var chart = new Highcharts.Chart({
      chart: {
        renderTo: 'results_donut',
        type: 'pie'
      },

      plotOptions: {
        pie: {
          borderColor: '#000000',
          innerSize: '60%'
        }
      },
      series: [{
        data: [
          {name: 'wins', y: gon.results_donut['wins'], colorIndex: true},
          {name: 'loses', y: gon.results_donut['loses'], colorIndex: true},
          {name: 'draws', y: gon.results_donut['draws'], colorIndex: true}
        ],
      }]
    },
    // using

    function(chart) { // on complete
      var xpos = '50%';
      var ypos = '53%';
      var circleradius = 102;

      // Render the circle
      chart.renderer.circle(xpos, ypos, circleradius).attr({
        fill: '#ddd',
      }).add();
    });
  });
});
