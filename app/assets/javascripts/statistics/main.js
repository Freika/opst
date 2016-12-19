$(document).on('turbolinks:load', function() {
  // Wins/draws/loses donut
  $(function() {
    Highcharts.setOptions({
      colors: ['#72FF61', '#FF7070', '#DCDCDC']
    });

    var chart = new Highcharts.Chart({
      chart: {
        renderTo: 'results_donut',
        type: 'pie'
      },

      title: {
        text: 'Wins/Losses/Draws'
      },

      tooltip: {
        pointFormat: '<b>{point.percentage:.1f}%</b>'
      },

      plotOptions: {
        pie: {
          borderColor: '#000000',
          innerSize: '60%'
        }
      },
      series: [{
        data: [
          {
            name: 'wins',
            y: gon.results_donut['wins'],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
          {
            name: 'loses',
            y: gon.results_donut['losses'],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
          {
            name: 'draws',
            y: gon.results_donut['draws'],
            colorIndex: true,
            dataLabels: { enabled: false }
          }
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


  // Skill rating chart
  $(function () {
    Highcharts.chart('skill_rating_chart', {
      title: {
        text: 'Season skill rating over time',
        x: -20 //center
      },
      xAxis: {
        title: {
          text: 'Games'
        }
      },
      yAxis: {
        title: {
          text: 'Skill Rating'
        },
        plotLines: [{
          value: 0,
          width: 1,
          color: '#808080'
        }]
      },
      series: [{
        name: 'Skill Rating',
        data: gon.skill_rating_chart
      }]
    });
  });

  // Streaks chart
  $(function () {
    Highcharts.chart('streaks', {
      chart: {
        type: 'line'
      },
      title: {
        text: 'Streaks'
      },
      subtitle: {
        text: 'Win and lose streaks'
      },
      series: [{
        name: 'Streak',
        data: gon.streaks
      }]
    });
  });
});
