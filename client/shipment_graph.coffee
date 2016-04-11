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

#Global Functions

#shipment_dates = _.pluck(result, 'date')
#  results = _.chain(result).map(_.partial(_.pick, 'date', 'cost')).value()
#  console.log shipment_dates


result = Shipments.find().fetch()
_.mixin pluckMany: ->
  args = _.rest(arguments, 1)
  _.map arguments[0], (item) ->
    obj = {}
    _.each args, (arg) ->
      obj[arg] = item[arg]
      return
    obj
projected = _.chain(result).pluckMany('date', 'cost').value()
console.log JSON.stringify(projected)

Template.home.rendered = ->
  shipment_costs = _.pluck(result, 'cost')
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