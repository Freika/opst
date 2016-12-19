$(document).on('turbolinks:load ajax:success', function() {
  elements = $('#heroes_statistics');
  if (!elements.length) {
    return
  }

  elements.each(function(index, el) {
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

    // Win percent per hero chart
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
          name: 'Map',
          colorByPoint: true,
          data: [

            {
              name: 'Ana',
              y: gon.wins_percentage_per_hero['ana'],
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Bastion',
              y: gon.wins_percentage_per_hero['bastion'],
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'D.Va',
              y: gon.wins_percentage_per_hero['dva'],
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Genji',
              y: gon.wins_percentage_per_hero['genji'],
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Hanzo',
              y: gon.wins_percentage_per_hero['hanzo'],
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: "Junkrat",
              y: gon.wins_percentage_per_hero["junkrat"],
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Lucio',
              y: gon.wins_percentage_per_hero['lucio'],
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'McCree',
              y: gon.wins_percentage_per_hero['mc_cree'],
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Mei',
              y: gon.wins_percentage_per_hero['mei'],
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Mercy',
              y: gon.wins_percentage_per_hero['mercy'],
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Pharah',
              y: gon.wins_percentage_per_hero['pharah'],
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Reaper',
              y: gon.wins_percentage_per_hero['reaper'],
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Reinhardt',
              y: gon.wins_percentage_per_hero['reinhardt'],
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Roadhog',
              y: gon.wins_percentage_per_hero['roadhog'],
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Soldier 76',
              y: gon.wins_percentage_per_hero['soldier_76'],
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Sombra',
              y: gon.wins_percentage_per_hero['sombra'],
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Symmetra',
              y: gon.wins_percentage_per_hero['symmetra'],
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Torbjorn',
              y: gon.wins_percentage_per_hero['torbjorn'],
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Tracer',
              y: gon.wins_percentage_per_hero['tracer'],
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Widowmaker',
              y: gon.wins_percentage_per_hero['widowmaker'],
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Winston',
              y: gon.wins_percentage_per_hero['winston'],
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Zarya',
              y: gon.wins_percentage_per_hero['zarya'],
              colorIndex: true,
              dataLabels: { enabled: false }
            },
            {
              name: 'Zenyatta',
              y: gon.wins_percentage_per_hero['zenyatta'],
              colorIndex: true,
              dataLabels: { enabled: false }
            },
          ]
        }]
      });
    });
  });
});
