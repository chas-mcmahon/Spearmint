Spearmint.Views.TransactionsIndex = Backbone.View.extend({

  template: JST['transactions/index'],

  events: {

  },

  initialize: function () {

  },

  render: function () {
    var renderedContent = this.template({
      transactions: this.collection
    });
    this.$el.html(renderedContent);
    return this;
  }

});
