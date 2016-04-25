#chart_data_array  = new ReactiveVar(null)

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
  chart_data_array: ->
    shipments = Shipments.find({}, {sort: {'date':1}}).fetch()
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

Template.home.rendered = ->
  data_array= [
    [
      Date.UTC(1970, 9, 21)
      320
    ]
    [
      Date.UTC(1970, 10, 4)
      17
    ]
    [
      Date.UTC(1970, 10, 9)
      225
    ]
    [
      Date.UTC(1970, 10, 27)
      302
    ]
    [
      Date.UTC(1970, 11, 2)
      28
    ]
    [
      Date.UTC(1970, 11, 16)
      428
    ]
    [
      Date.UTC(1970, 11, 29)
      47
    ]
    [
      Date.UTC(1971, 0, 11)
      79
    ]
    [
      Date.UTC(1971, 0, 26)
      172
    ]
    [
      Date.UTC(1971, 1, 3)
      102
    ]
    [
      Date.UTC(1971, 1, 11)
      212
    ]
  ]
  Tracker.autorun ->
    $ ->
      $('#container').highcharts
        chart: type: 'line'
        title: text: 'Shipments'
        subtitle: text: 'Shipment Cost Over Time'
        xAxis:
          type: 'datetime'
          dateTimeLabelFormats:
            month: '%e. %b'
            year: '%b'
          title: text: 'Date'
        yAxis:
          title: text: 'Cost ($)'
          min: 0
        tooltip:
          headerFormat: '<b>{series.name}</b><br>'
          pointFormat: '{point.x:%e. %b}: ${point.y:.2f}'
        plotOptions: spline: marker: enabled: true
        series: [
          {
            name: '2015-2016'
            data: data_array
          }
        ]
      shipments = Shipments.find().fetch()
      chart_data_array = []
      for shipment in shipments
        chart_data = {}
        chart_data.date = shipment.date
        console.log chart_data.date
        chart_data.cost = shipment.cost
        chart_data_array.push chart_data
      console.log "chart_data_array " + (chart_data_array)
#      $('#shipment_count').highcharts
#        title:
#          text: 'Shipment Cost Over Time'
#          x: -20
#        subtitle:
#          text: ''
#          x: -20
#        xAxis:
#          type: 'datetime'
#        yAxis:
##          labels:
##            format: '${value}'
#          title:
#            text: 'Dollars'
#          plotLines: [ {
#            value: 0
#            width: 1
#            color: '#808080'
#          } ]
#        plotOptions: [
#          series: {
#            pointStart: Date.UTC(2016, 0, 1)
#            pointIntervalUnit: 'month'
#          }
#        ]
#        tooltip: valuePrefix: '$'
#        legend:
#          layout: 'vertical'
#          align: 'right'
#          verticalAlign: 'middle'
#          borderWidth: 0
#        series: chart_data_array
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