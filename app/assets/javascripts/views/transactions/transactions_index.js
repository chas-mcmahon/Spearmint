Spearmint.Views.TransactionsIndex = Backbone.View.extend({

  template: JST['transactions/index'],

  // tagName:, ?

  events: {
    // eventually to have clickable things on transaction page to reset filter
  },

  initialize: function () {
    //listener here
  },

  render: function () {
    var renderedContent = this.template({
      transactions: this.collection
      // categories: this.categories
    });

    this.$el.html(renderedContent);
    return this;
  }

});
