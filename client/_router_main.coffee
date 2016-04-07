Router.route '/', ->
  @render 'Home'
  return

Router.configure
  layoutTemplate: 'main'
#Router.route '/shipment_home', ->
#  @render 'shipment_home'
#  return