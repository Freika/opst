$(document).on('turbolinks:load ajax:success', function() {
  elements = $('#heroes_statistics');
  if (!elements.length) {
    return
  }

  elements.each(function(index, el) {
    // games played by hero donut

    $heroes_statistics = $('#games_played_by_hero_donut');

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
              y: parseFloat($heroes_statistics.data('ana')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Bastion',
              y: parseFloat($heroes_statistics.data('bastion')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'D.Va',
              y: parseFloat($heroes_statistics.data('dva')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Genji',
              y: parseFloat($heroes_statistics.data('genji')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Hanzo',
              y: parseFloat($heroes_statistics.data('hanzo')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: "Junkrat",
              y: parseFloat($heroes_statistics.data("junkrat")),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Lucio',
              y: parseFloat($heroes_statistics.data('lucio')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'McCree',
              y: parseFloat($heroes_statistics.data('mccree')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Mei',
              y: parseFloat($heroes_statistics.data('mei')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Mercy',
              y: parseFloat($heroes_statistics.data('mercy')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Pharah',
              y: parseFloat($heroes_statistics.data('pharah')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Reaper',
              y: parseFloat($heroes_statistics.data('reaper')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Reinhardt',
              y: parseFloat($heroes_statistics.data('reinhardt')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Roadhog',
              y: parseFloat($heroes_statistics.data('roadhog')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Soldier 76',
              y: parseFloat($heroes_statistics.data('soldier76')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Sombra',
              y: parseFloat($heroes_statistics.data('sombra')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Symmetra',
              y: parseFloat($heroes_statistics.data('symmetra')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Torbjorn',
              y: parseFloat($heroes_statistics.data('torbjorn')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Tracer',
              y: parseFloat($heroes_statistics.data('tracer')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Widowmaker',
              y: parseFloat($heroes_statistics.data('widowmaker')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Winston',
              y: parseFloat($heroes_statistics.data('winston')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Zarya',
              y: parseFloat($heroes_statistics.data('zarya')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Zenyatta',
              y: parseFloat($heroes_statistics.data('zenyatta')),
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

    // Win percent per hero chart
    $wins_percentage_per_hero = $('#hero_win_percentage');


    $(function () {
      // Create the chart
      Highcharts.chart('hero_win_percentage', {
        chart: {
          type: 'column'
        },
        title: {
          text: 'Wins per hero'
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
              name: 'Ana',
              y: parseFloat($wins_percentage_per_hero.data('ana')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Bastion',
              y: parseFloat($wins_percentage_per_hero.data('bastion')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'D.Va',
              y: parseFloat($wins_percentage_per_hero.data('dva')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Genji',
              y: parseFloat($wins_percentage_per_hero.data('genji')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Hanzo',
              y: parseFloat($wins_percentage_per_hero.data('hanzo')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: "Junkrat",
              y: parseFloat($wins_percentage_per_hero.data("junkrat")),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Lucio',
              y: parseFloat($wins_percentage_per_hero.data('lucio')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'McCree',
              y: parseFloat($wins_percentage_per_hero.data('mccree')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Mei',
              y: parseFloat($wins_percentage_per_hero.data('mei')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Mercy',
              y: parseFloat($wins_percentage_per_hero.data('mercy')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Pharah',
              y: parseFloat($wins_percentage_per_hero.data('pharah')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Reaper',
              y: parseFloat($wins_percentage_per_hero.data('reaper')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Reinhardt',
              y: parseFloat($wins_percentage_per_hero.data('reinhardt')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Roadhog',
              y: parseFloat($wins_percentage_per_hero.data('roadhog')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Soldier 76',
              y: parseFloat($wins_percentage_per_hero.data('soldier76')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Sombra',
              y: parseFloat($wins_percentage_per_hero.data('sombra')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Symmetra',
              y: parseFloat($wins_percentage_per_hero.data('symmetra')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Torbjorn',
              y: parseFloat($wins_percentage_per_hero.data('torbjorn')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Tracer',
              y: parseFloat($wins_percentage_per_hero.data('tracer')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Widowmaker',
              y: parseFloat($wins_percentage_per_hero.data('widowmaker')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Winston',
              y: parseFloat($wins_percentage_per_hero.data('winston')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Zarya',
              y: parseFloat($wins_percentage_per_hero.data('zarya')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Zenyatta',
              y: parseFloat($wins_percentage_per_hero.data('zenyatta')),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
          ]
        }]
      });
    });
  });
});
