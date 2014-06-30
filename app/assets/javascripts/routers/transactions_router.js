Spearmint.Routers.TransactionsRouter = Backbone.Router.extend({

  initialize: function (options) {
    this.transactions = options.transactions;
    // this.categories = options.categories;
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "" : "index",
    "new" : "new",
    ":id/edit" : "edit"
  },

  index: function () {
    // console.log("made it to index route");
    var indexView = new Spearmint.Views.TransactionsIndex({
      collection: this.transactions,
      // categories: this.categories
    });

    return this._swapView(indexView)
  },

  new: function () {
    var formView = new Spearmint.Views.TransactionForm({
      collection: this.transactions,
      model: new Spearmint.Models.Transaction()
    });

    return this._swapView(formView)
  },

  edit: function (id) {
    var formView = new Spearmint.Views.TransactionForm({
      model: this.transactions.get(id)
    });

    return this._swapView(formView)
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

});
