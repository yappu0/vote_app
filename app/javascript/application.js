// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import "./controllers";
import $ from 'jquery';
import Taggle from 'taggle';

$(window).on("turbo:render turbo:load", () => {
  const updateHiddenField = (taggle, hiddenField) => {
    hiddenField.val(taggle.getTags().values.join(" "));
  }

  const teamsTaggle = new Taggle("teams-input", {
    delimiter: " ",
    onTagAdd: () => {
      updateHiddenField(teamsTaggle, $("#event_teams"));
    },
    onTagRemove: () => {
      updateHiddenField(teamsTaggle, $("#event_teams"));
    },
  });

  const evaluationItemsTaggle = new Taggle("evaluation-items-input", {
    delimiter: " ",
    onTagAdd: () => {
      updateHiddenField(evaluationItemsTaggle, $("#event_evaluation_items"));
    },
    onTagRemove: () => {
      updateHiddenField(evaluationItemsTaggle, $("#event_evaluation_items"));
    },
  });
});
