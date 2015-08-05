jQuery ->
    Morris.Line
        element: 'all_trades_chart'
        data: $('#all_trades_chart').data('trades')
        xkey: 'created_at'
        ykeys: ['total_win', 'total_tie', 'total_lost']
        labels: ['WIN', 'TIE', 'LOST']
        lineColors: ['#449d44', '#ec971f', '#c9302c']


