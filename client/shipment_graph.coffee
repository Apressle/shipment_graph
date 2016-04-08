@Shipments = new Mongo.Collection "shipments"
Shipments.allow
  insert: () -> true
  update: () -> true

Router.route '/register',
  template: 'register'

Router.configure
  layoutTemplate: 'main'

Router.route '/',
  template: 'home'
  name: 'home'

Template.home.rendered = ->
  result = Shipments.find().fetch()
  shipment_dates = _.pluck(result, 'date')
  shipment_costs = _.pluck(result, 'cost')

#  results = _.chain(result).map(_.partial(_.pick, 'date', 'cost')).value()
  console.log shipment_dates
  Tracker.autorun ->
		$ ->
    $('#shipment_count').highcharts
      title:
        text: 'Shipment Cost Over Time'
        x: -20
      subtitle:
        text: ''
        x: -20
      xAxis:[
        {type: 'datetime'
        minTickInterval: 24 * 3600 * 1000}
      {type: "datetime"
      opposite: true
      minTickInterval: 24 * 3600 * 1000}
      ]
      yAxis:
        labels:
          format: '${value}'
        title:
          text: 'Dollars'
        plotLines: [ {
          value: 0
          width: 1
          color: '#808080'
        } ]
#      tooltip: valuePrefix: '$'
      legend:
        layout: 'vertical'
        align: 'right'
        verticalAlign: 'middle'
        borderWidth: 0
      series: [
        {
          name: 'Shipments'
#          data: results
        }
      ]
    return


console.log 'Hello world'

#if Meteor.isClient
console.log 'Hello client'

random = 0.5
# For later, when random shipment creation is used.
#$('#button').click ->
#  chart = $('#shipment_count').highcharts()
#  chart.series[0].addPoint [
#    (random or Math.random()) * 12
#    (random or Math.random()) * 200
#  ]
#  random = null
#  return