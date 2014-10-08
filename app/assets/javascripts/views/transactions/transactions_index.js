Spearmint.Views.TransactionsIndex = Backbone.View.extend({

  template: JST['transactions/index'],

  // tagName:, ?

  events: {
    "click th": "newSort"
  },

  initialize: function () {
    this.listenTo(this.collection, "sort", this.render);
  },

  render: function () {
    var renderedContent = this.template({
      transactions: this.collection
    });

    this.$el.html(renderedContent);
    return this;
  },

  newSort: function(event) {
    var $target = $(event.currentTarget);
    var newCriterion = $target.attr('column');
    var oldCriterion = this.collection.sort_criterion;

    if (oldCriterion === newCriterion) {
      this.collection.sort_direction *= -1;
    } else {
      this.collection.sort_direction = 1;
    }

    this.collection.sortTransactions(newCriterion);
  }

});