$(document).on('turbolinks:load ajax:success', function() {
  elements = $('#maps_stats')
  if (!elements.length) {
    return
  }

  elements.each(function(index, el) {
    $maps = $('#games_played_by_map_donut');

    $(function() {
      // Highcharts.setOptions({
      //   colors: ['#72FF61', '#FF7070', '#DCDCDC', '#ffaadc', '#ddaacc', '#aacc33']
      // });

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
            innerSize: '60%',
            dataLabels: {
              enabled: true
            },
            showInLegend: true
          }
        },
        series: [{
          data: [
            {
              name: 'Dorado',
              y: parseFloat($maps.data('dorado')),
              // colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Eichenwalde',
              y: parseFloat($maps.data('eichenwalde')),
              // colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Hanamura',
              y: parseFloat($maps.data('hanamura')),
              // colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Hollywood',
              y: parseFloat($maps.data('hollywood')),
              // colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Ilios',
              y: parseFloat($maps.data('ilios')),
              // colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: "King's Row",
              y: parseFloat($maps.data("kingsrow")),
              // colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Lijiang Tower',
              y: parseFloat($maps.data('lijiangtower')),
              // colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Nepal',
              y: parseFloat($maps.data('nepal')),
              // colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Numbani',
              y: parseFloat($maps.data('numbani')),
              // colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Route 66',
              y: parseFloat($maps.data('route66')),
              // colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Temple of Anubis',
              y: parseFloat($maps.data('anubis')),
              // colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Volskaya Industries',
              y: parseFloat($maps.data('volskaya')),
              // colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Watchpoint Gibraltar',
              y: parseFloat($maps.data('gibraltar')),
              // colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Oasis',
              y: parseFloat($maps.data('oasis')),
              // colorIndex: true,
              dataLabels: { enabled: false }
            },
          ],
        }]
      },
      // using

      function(chart) { // on complete
        var xpos = '50%';
        var ypos = '45%';
        var circleradius = 102;

        // Render the circle
        chart.renderer.circle(xpos, ypos, circleradius).attr({
          fill: '#ddd',
        }).add();
      });
    });

    // Win percent per map chart
    $wins_per_map = $('#map_win_percentage');

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
          name: 'Map',
          colorByPoint: true,
          data: [
          {
            name: 'Dorado',
            y: parseFloat($wins_per_map.data('dorado')),
          },
          {
            name: 'Eichenwalde',
            y: parseFloat($wins_per_map.data('eichenwalde')),
          },
          {
            name: 'Hanamura',
            y: parseFloat($wins_per_map.data('hanamura')),
          },
          {
            name: 'Hollywood',
            y: parseFloat($wins_per_map.data('hollywood')),
          },
          {
            name: 'Ilios',
            y: parseFloat($wins_per_map.data('ilios')),
          },
          {
            name: 'King\'s Row',
            y: parseFloat($wins_per_map.data('kingsrow')),
          },
          {
            name: 'Lijiang Tower',
            y: parseFloat($wins_per_map.data('lijiangtower')),
          },
          {
            name: 'Nepal',
            y: parseFloat($wins_per_map.data('nepal')),
          },
          {
            name: 'Numbani',
            y: parseFloat($wins_per_map.data('numbani')),
          },
          {
            name: 'Route 66',
            y: parseFloat($wins_per_map.data('route66')),
          },
          {
            name: 'Temple of Anubis',
            y: parseFloat($wins_per_map.data('anubis')),
          },
          {
            name: 'Volskaya Industries',
            y: parseFloat($wins_per_map.data('volskaya')),
          },
          {
            name: 'Watchpoint: Gibraltar',
            y: parseFloat($wins_per_map.data('gibraltar')),
          }]
        }]
      });
    });

  });

});
