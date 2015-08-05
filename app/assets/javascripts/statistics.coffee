# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery -> 
    Morris.Line
        element: 'all_trades_chart'
        data: $('#all_trades_chart').data('trades')
        xkey: 'created_at'
        ykeys: ['total_win', 'total_tie', 'total_lost']
        labels: ['WIN', 'TIE', 'LOST']
        lineColors: ['#449d44', '#ec971f', '#c9302c']


