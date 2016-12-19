$(document).on('turbolinks:load ajax:success', function() {
  elements = $('#heroes_statistics');
  if (!elements.length) {
    return
  }

  elements.each(function(index, el) {
    // games played by hero donut

    $heroes_statistics = $('#games_played_by_hero_donut');
    console.log($heroes_statistics.data())


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
              y: $heroes_statistics.data('ana'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Bastion',
              y: $heroes_statistics.data('bastion'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'D.Va',
              y: $heroes_statistics.data('dva'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Genji',
              y: $heroes_statistics.data('genji'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Hanzo',
              y: $heroes_statistics.data('hanzo'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: "Junkrat",
              y: $heroes_statistics.data("junkrat"),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Lucio',
              y: $heroes_statistics.data('lucio'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'McCree',
              y: $heroes_statistics.data('mccree'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Mei',
              y: $heroes_statistics.data('mei'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Mercy',
              y: $heroes_statistics.data('mercy'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Pharah',
              y: $heroes_statistics.data('pharah'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Reaper',
              y: $heroes_statistics.data('reaper'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Reinhardt',
              y: $heroes_statistics.data('reinhardt'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Roadhog',
              y: $heroes_statistics.data('roadhog'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Soldier 76',
              y: $heroes_statistics.data('soldier76'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Sombra',
              y: $heroes_statistics.data('sombra'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Symmetra',
              y: $heroes_statistics.data('symmetra'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Torbjorn',
              y: $heroes_statistics.data('torbjorn'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Tracer',
              y: $heroes_statistics.data('tracer'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Widowmaker',
              y: $heroes_statistics.data('widowmaker'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Winston',
              y: $heroes_statistics.data('winston'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Zarya',
              y: $heroes_statistics.data('zarya'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Zenyatta',
              y: $heroes_statistics.data('zenyatta'),
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
              y: $wins_percentage_per_hero.data('ana'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Bastion',
              y: $wins_percentage_per_hero.data('bastion'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'D.Va',
              y: $wins_percentage_per_hero.data('dva'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Genji',
              y: $wins_percentage_per_hero.data('genji'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Hanzo',
              y: $wins_percentage_per_hero.data('hanzo'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: "Junkrat",
              y: $wins_percentage_per_hero.data("junkrat"),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Lucio',
              y: $wins_percentage_per_hero.data('lucio'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'McCree',
              y: $wins_percentage_per_hero.data('mccree'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Mei',
              y: $wins_percentage_per_hero.data('mei'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Mercy',
              y: $wins_percentage_per_hero.data('mercy'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Pharah',
              y: $wins_percentage_per_hero.data('pharah'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Reaper',
              y: $wins_percentage_per_hero.data('reaper'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Reinhardt',
              y: $wins_percentage_per_hero.data('reinhardt'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Roadhog',
              y: $wins_percentage_per_hero.data('roadhog'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Soldier 76',
              y: $wins_percentage_per_hero.data('soldier76'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Sombra',
              y: $wins_percentage_per_hero.data('sombra'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Symmetra',
              y: $wins_percentage_per_hero.data('symmetra'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Torbjorn',
              y: $wins_percentage_per_hero.data('torbjorn'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Tracer',
              y: $wins_percentage_per_hero.data('tracer'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Widowmaker',
              y: $wins_percentage_per_hero.data('widowmaker'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Winston',
              y: $wins_percentage_per_hero.data('winston'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Zarya',
              y: $wins_percentage_per_hero.data('zarya'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Zenyatta',
              y: $wins_percentage_per_hero.data('zenyatta'),
              colorIndex: true,
              dataLabels: { enabled: false }
            },
          ]
        }]
      });
    });
  });
});
