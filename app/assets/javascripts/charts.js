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


  // games played by hero donut
  $(function() {
    Highcharts.setOptions({
      colors: ['#72FF61', '#FF7070', '#DCDCDC', '#ffaadc', '#ddaacc', '#aacc33']
    });

    var chart = new Highcharts.Chart({
      chart: {
        renderTo: 'games_played_by_hero_donut',
        type: 'pie'
      },

      title: {
        text: 'Games played by hero'
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
            name: 'Ana',
            y: gon.heroes_statistics['ana'],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
          {
            name: 'Bastion',
            y: gon.heroes_statistics['bastion'],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
          {
            name: 'D.Va',
            y: gon.heroes_statistics['dva'],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
          {
            name: 'Genji',
            y: gon.heroes_statistics['genji'],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
          {
            name: 'Hanzo',
            y: gon.heroes_statistics['hanzo'],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
          {
            name: "Junkrat",
            y: gon.heroes_statistics["junkrat"],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
          {
            name: 'Lucio',
            y: gon.heroes_statistics['lucio'],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
          {
            name: 'McCree',
            y: gon.heroes_statistics['mc_cree'],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
          {
            name: 'Mei',
            y: gon.heroes_statistics['mei'],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
          {
            name: 'Mercy',
            y: gon.heroes_statistics['mercy'],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
          {
            name: 'Pharah',
            y: gon.heroes_statistics['pharah'],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
          {
            name: 'Reaper',
            y: gon.heroes_statistics['reaper'],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
          {
            name: 'Reinhardt',
            y: gon.heroes_statistics['reinhardt'],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
          {
            name: 'Roadhog',
            y: gon.heroes_statistics['roadhog'],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
          {
            name: 'Soldier 76',
            y: gon.heroes_statistics['soldier_76'],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
          {
            name: 'Sombra',
            y: gon.heroes_statistics['sombra'],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
          {
            name: 'Symmetra',
            y: gon.heroes_statistics['symmetra'],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
          {
            name: 'Torbjorn',
            y: gon.heroes_statistics['torbjorn'],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
          {
            name: 'Tracer',
            y: gon.heroes_statistics['tracer'],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
          {
            name: 'Widowmaker',
            y: gon.heroes_statistics['widowmaker'],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
          {
            name: 'Winston',
            y: gon.heroes_statistics['winston'],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
          {
            name: 'Zarya',
            y: gon.heroes_statistics['zarya'],
            colorIndex: true,
            dataLabels: { enabled: false }
          },
          {
            name: 'Zenyatta',
            y: gon.heroes_statistics['zenyatta'],
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
