window.Spearmint = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    Spearmint.transactions = new Spearmint.Collections.Transactions();
    new Spearmint.Routers.TransactionRouter({

      //might need to be more specific about what I want $rootEl to be
      $rootEl: $(".transaction-main-content"),
      transactions: Spearmint.transactions

    })
    Backbone.history.start();
  }
};

// shouldn't this go in transaction's index.html.erb page?
// $(document).ready(function(){
//   Spearmint.initialize();
// });
