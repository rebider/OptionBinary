
function get_balance (accountId) {
	$.ajax({
		type: "GET",
		url: "/broker_accounts/" + accountId + "/current_balance",
		success: function(data){

			alert(data)

		}
	});
}
