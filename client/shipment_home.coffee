Template.home.rendered = ->
  Tracker.autorun ->
#		$ ->
#    $('#ltl_shipment_count').highcharts
#      chart:
#        plotBackgroundColor: null
#        plotBorderWidth: null
#        plotShadow: false
#        type: 'pie'
#      title: text: 'Total LTL Savings'
#      tooltip: pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
#      plotOptions: pie:
#        allowPointSelect: true
#        cursor: 'pointer'
#        dataLabels:
#          enabled: true
#          format: '<b>{point.name}</b>: {point.percentage:.1f} %'
#          style: color: Highcharts.theme and Highcharts.theme.contrastTextColor or 'black'
#      series: [ {
#        name: 'Total LTL Savings'
#        colorByPoint: true
#        data: [
#          {
#            name: 'Audit Savings'
#            y: 56.1
#          }
#          {
#            name: 'Consulting Savings'
#            y: 24
#            sliced: true
#            selected: true
#          }
#          {
#            name: 'Technology Savings'
#            y: 20.9
#          }
#        ]
#      } ]
    #		return
    $('#shipment_count').highcharts
      title:
        text: 'LTL Audit and Savings Calculations'
        x: -20
      subtitle:
        text: ''
        x: -20
      xAxis: categories: [
        'Jan'
        'Feb'
        'Mar'
        'Apr'
        'May'
        'Jun'
        'Jul'
        'Aug'
        'Sep'
        'Oct'
        'Nov'
        'Dec'
      ]
      yAxis:
        title: text: 'Dollar amount ($)'
        plotLines: [ {
          value: 0
          width: 1
          color: '#808080'
        } ]
      tooltip: valuePrefix: '$'
      legend:
        layout: 'vertical'
        align: 'right'
        verticalAlign: 'middle'
        borderWidth: 0
      series: [
        {
          name: 'Net Charges'
          data: [
            7.0
            6.9
            9.5
            14.5
            18.2
            21.5
            25.2
            26.5
            23.3
            18.3
            13.9
            9.6
          ]
        }
        {
          name: 'Audit Savings'
          data: [
            0.2
            0.8
            5.7
            11.3
            17.0
            22.0
            24.8
            24.1
            20.1
            14.1
            8.6
            2.5
          ]
        }
        {
          name: 'Consulting Savings'
          data: [
            5.9
            0.6
            3.5
            8.4
            13.5
            17.0
            18.6
            17.9
            14.3
            9.0
            3.9
            1.0
          ]
        }
        {
          name: 'Tech Savings'
          data: [
            4.9
            5.2
            6.7
            8.5
            11.9
            15.2
            17.0
            16.6
            14.2
            10.3
            9.6
            4.8
          ]
        }
        {
          name: 'Total LTL Savings'
          data: [
            1.7
            3.9
            4.2
            5.7
            8.5
            11.9
            15.2
            17.0
            16.6
            14.2
            10.3
            6.6
          ]
        }
        {
          name: 'LTL Profit'
          data: [
            3.9
            4.2
            5.7
            8.5
            15
            18.2
            19.0
            23
            14.2
            12.3
            6.6
            7.8
          ]
        }
      ]
    return
