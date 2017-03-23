$(document).on('turbolinks:load ajax:success', function() {
  elements = $('#heroes_statistics');
  if (!elements.length) {
    return
  }

  $(function () {
    $heroes_chart = $('#heroes_chart');

    Highcharts.chart('heroes_chart', {
      chart: {
        type: 'column',
      },
      title: {
        text: 'Games by heroes'
      },
      xAxis: {
        categories: [
          'Ana', 'Bastion', 'D.Va', 'Genji', 'Hanzo', 'Junkrat', 'Lucio',
          'McCree', 'Mei', 'Mercy', 'Orisa', 'Pharah', 'Reaper', 'Reinhardt',
          'Roadhog', 'Soldier 76', 'Sombra', 'Symmetra', 'Torbjorn',
          'Tracer', 'Widowmaker', 'Winston', 'Zarya', 'Zenyatta'
        ]
      },
      yAxis: {
        min: 0,
        title: {
          text: 'Games'
        },
        stackLabels: {
          enabled: true,
          style: {
            fontWeight: 'bold',
            color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
          }
        }
      },
      legend: {
        align: 'right',
        x: -30,
        verticalAlign: 'top',
        y: 25,
        floating: true,
        backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
        borderColor: '#CCC',
        borderWidth: 1,
        shadow: false
      },
      tooltip: {
        headerFormat: '<b>{point.x}</b><br/>',
        pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'
      },
      plotOptions: {
        column: {
          stacking: 'normal',
          dataLabels: {
            enabled: true,
            color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
          }
        }
      },
      series: [{
        name: 'Wins',
        data: $heroes_chart.data('wins'),
        color: '#72FF61'
      }, {
        name: 'Losses',
        data: $heroes_chart.data('losses'),
        color: '#FF7070'
      }, {
        name: 'Draws',
        data: $heroes_chart.data('draws'),
        color: '#dcdcdc'
      }]
    });
  });
});
