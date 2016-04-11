@Shipments = new Meteor.Collection "shipments"
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

Template.home.helpers
  graph_data: ->
    shipments = Shipments.find().fetch()
    chart_data_array = []
    for shipment in shipments
      chart_data = {}
      chart_data.date = shipment.date
      console.log chart_data.date
      chart_data.cost = shipment.cost
      chart_data_array.push chart_data
    console.log "chart_data_array " + (chart_data_array)
    return chart_data_array

Template.main.onCreated ->
  @subscribe 'shipments'
  console.log "subscribed"

Template.main.rendered = ->
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
#          data: shipments
        }
      ]
    return

console.log 'Hello world'

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