// Generated by CoffeeScript 1.10.0
(function() {
  var random;

  this.Shipments = new Meteor.Collection("shipments");

  Shipments.allow({
    insert: function() {
      return true;
    },
    update: function() {
      return true;
    }
  });

  Router.route('/register', {
    template: 'register'
  });

  Router.configure({
    layoutTemplate: 'main'
  });

  Router.route('/', {
    template: 'home',
    name: 'home'
  });

  Template.main.onCreated(function() {
    this.subscribe('shipments');
    return console.log("subscribed");
  });

  Template.main.rendered = function() {
    Tracker.autorun(function() {});
    return $(function() {
      $('#shipment_count').highcharts({
        title: {
          text: 'Shipment Cost Over Time',
          x: -20
        },
        subtitle: {
          text: '',
          x: -20
        },
        xAxis: [
          {
            type: 'datetime',
            minTickInterval: 24 * 3600 * 1000
          }, {
            type: "datetime",
            opposite: true,
            minTickInterval: 24 * 3600 * 1000
          }
        ],
        yAxis: {
          labels: {
            format: '${value}'
          },
          title: {
            text: 'Dollars'
          },
          plotLines: [
            {
              value: 0,
              width: 1,
              color: '#808080'
            }
          ]
        },
        legend: {
          layout: 'vertical',
          align: 'right',
          verticalAlign: 'middle',
          borderWidth: 0
        },
        series: [
          {
            name: 'Shipments',
            data: chart_data_setup()
          }
        ]
      });
    });
  };

  this.chart_data_setup = function() {
    var chart_data, chart_data_array, i, len, shipment, shipments;
    console.log(Shipments.find().count());
    shipments = Shipments.find().fetch();
    console.log(JSON.stringify(shipments));
    chart_data_array = [];
    for (i = 0, len = shipments.length; i < len; i++) {
      shipment = shipments[i];
      chart_data = {};
      chart_data.date = shipment.date;
      chart_data.cost = shipment.cost;
      chart_data_array.push(chart_data);
    }
    console.log("chart_data_array " + chart_data_array);
    return chart_data_array;
  };

  console.log('Hello world');

  random = 0.5;

}).call(this);

//# sourceMappingURL=shipment_graph.js.map
