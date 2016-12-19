$(document).on('turbolinks:load', function() {
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



  // Win percent per map chart
  $(function () {
    // Create the chart
    Highcharts.chart('map_win_percentage', {
      chart: {
        type: 'column'
      },
      title: {
        text: 'Wins per map'
      },
      xAxis: {
        type: 'category'
      },
      yAxis: {
        title: {
          text: 'Wins percent'
        }
      },
      legend: {
        enabled: false
      },
      plotOptions: {
        series: {
          borderWidth: 0,
          dataLabels: {
            enabled: true,
            format: '{point.y:.1f}%'
          }
        }
      },
      tooltip: {
        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
      },
      series: [{
        name: 'Hero',
        colorByPoint: true,
        data: [
        {
          name: 'Dorado',
          y: gon.wins_per_map['dorado'],
        },
        {
          name: 'Eichenwalde',
          y: gon.wins_per_map['eichenwalde'],
        },
        {
          name: 'Hanamura',
          y: gon.wins_per_map['hanamura'],
        },
        {
          name: 'Hollywood',
          y: gon.wins_per_map['hollywood'],
        },
        {
          name: 'Ilios',
          y: gon.wins_per_map['ilios'],
        },
        {
          name: 'King\'s Row',
          y: gon.wins_per_map['king_s_row'],
        },
        {
          name: 'Lijiang Tower',
          y: gon.wins_per_map['lijiang_tower'],
        },
        {
          name: 'Nepal',
          y: gon.wins_per_map['nepal'],
        },
        {
          name: 'Numbani',
          y: gon.wins_per_map['numbani'],
        },
        {
          name: 'Oasis',
          y: gon.wins_per_map['oasis'],
        },
        {
          name: 'Route 66',
          y: gon.wins_per_map['route_66'],
        },
        {
          name: 'Temple of Anubis',
          y: gon.wins_per_map['temple_of_anubis'],
        },
        {
          name: 'Volskaya Industries',
          y: gon.wins_per_map['volskaya_industries'],
        },
        {
          name: 'Watchpoint: Gibraltar',
          y: gon.wins_per_map['watchpoint__gibraltar'],
        }]
      }]
    });
  });
});
