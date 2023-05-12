// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import Taggle from 'taggle';
import $ from 'jquery';

document.addEventListener("turbo:render", function () {
  function updateHiddenField(taggle, hiddenField) {
    let tags = taggle.getTags().values;
    hiddenField.val(tags.join(" "));
  }

  let teamsTaggle = new Taggle("teams-input", {
    delimiter: " ",
    onTagAdd: function (event, tag) {
      updateHiddenField(teamsTaggle, $("#event_teams"));
    },
    onTagRemove: function (event, tag) {
      updateHiddenField(teamsTaggle, $("#event_teams"));
    },
  });

  let evaluationItemsTaggle = new Taggle("evaluation-items-input", {
    delimiter: " ",
    onTagAdd: function (event, tag) {
      updateHiddenField(evaluationItemsTaggle, $("#event_evaluation_items"));
    },
    onTagRemove: function (event, tag) {
      updateHiddenField(evaluationItemsTaggle, $("#event_evaluation_items"));
    },
  });

  $(".plus").on("click", function () {
    let currentScore = parseInt($("#score").text(), 10);
    $(".score").text(currentScore + 1);
  });

  $(".minus").on("click", function () {
    let currentScore = parseInt($("#score").text(), 10);
    if (currentScore > 0) {
      $(".score").text(currentScore - 1);
    }
  });
});
