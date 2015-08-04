# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


jQuery -> 
    Morris.Donut
        element: 'performance_today_chart'
        data: $('#performance_today_chart').data('trades')
        colors: ['#449d44', '#ec971f', '#c9302c']

jQuery -> 
    Morris.Bar
        element: 'performance_last_days_trades_chart'
        data: $('#performance_last_days_trades_chart').data('trades')
        xkey: 'created_at'
        ykeys: ['total_win', 'total_tie', 'total_lost']
        labels: ['WIN', 'TIE', 'LOST']
        lineColors: ['#449d44', '#ec971f', '#c9302c']
        stacked: true

jQuery -> 
    Morris.Line
        element: 'performance_last_days_profit_chart'
        data: $('#performance_last_days_profit_chart').data('trades')
        xkey: 'date'
        ykeys: ['profit']
        labels: ['Profit']
        preUnits: '$'


