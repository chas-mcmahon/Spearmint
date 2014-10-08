Spearmint.Collections.Transactions = Backbone.Collection.extend({

  model: Spearmint.Models.Transaction,
  url: "/api/transactions",

	sort_criterion: 'description',
	sort_direction: -1,

	comparator: function (transaction1, transaction2) {

		if (this.sort_criterion === 'category') {
			var first = transaction1.get(this.sort_criterion).name;
			var second = transaction2.get(this.sort_criterion).name;
		} else {
			var first = transaction1.get(this.sort_criterion);
			var second = transaction2.get(this.sort_criterion);
		}

		if (first === second) return 0;

		if (this.sort_direction === 1) {
			return first > second ? 1 : -1;
		} else {
			return second > first ? 1 : -1;
		}

		// if (this.sort_criterion === 'category') {
		// 	if (transaction1.get(this.sort_criterion).name > transaction2.get(this.sort_criterion).name) return -1;
		// 	if (transaction1.get(this.sort_criterion).name < transaction2.get(this.sort_criterion).name) return 1;
		// } else {
		// 	if (transaction1.get(this.sort_criterion) > transaction2.get(this.sort_criterion)) return -1;
		// 	if (transaction1.get(this.sort_criterion) < transaction2.get(this.sort_criterion)) return 1;
		// 	return 0;
		// }
	},

	sortTransactions: function (criterion) {
		this.sort_criterion = criterion;
		this.sort();
	}
 	
});	