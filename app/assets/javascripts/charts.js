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

  // games played by map donut
  $(function() {
    Highcharts.setOptions({
      colors: ['#72FF61', '#FF7070', '#DCDCDC', '#ffaadc', '#ddaacc', '#aacc33']
    });

    var chart = new Highcharts.Chart({
      chart: {
        renderTo: 'games_played_by_map_donut',
        type: 'pie'
      },

      title: {
        text: 'Games played by map'
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
            name: 'Dorado',
            y: gon.maps_statistics['dorado'],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
          {
            name: 'Eichenwalde',
            y: gon.maps_statistics['eichenwalde'],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
          {
            name: 'Hanamura',
            y: gon.maps_statistics['hanamura'],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
          {
            name: 'Hollywood',
            y: gon.maps_statistics['hollywood'],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
          {
            name: 'Ilios',
            y: gon.maps_statistics['ilios'],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
          {
            name: "King's Row",
            y: gon.maps_statistics["king_s_row"],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
          {
            name: 'Lijang Tower',
            y: gon.maps_statistics['lijang_tower'],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
          {
            name: 'Nepal',
            y: gon.maps_statistics['nepal'],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
          {
            name: 'Numbani',
            y: gon.maps_statistics['numbani'],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
          {
            name: 'Route 66',
            y: gon.maps_statistics['route_66'],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
          {
            name: 'Temple of Anubis',
            y: gon.maps_statistics['temple_of_anubis'],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
          {
            name: 'Volskaya Industries',
            y: gon.maps_statistics['volskaya_industries'],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
          {
            name: 'Watchpoint Gibraltar',
            y: gon.maps_statistics['watchpoint__gibraltar'],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
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
