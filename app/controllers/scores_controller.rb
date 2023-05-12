class ScoresController < ApplicationController
  before_action :set_event, only: %i[create destroy]

  def create
    @evaluation_item = @event.evaluation_items.find(params[:evaluation_item_id])
    @team = @event.teams.find(params[:team_id])
    @score = @team.scores.build(evaluation_item: @evaluation_item, team: @team)
    @score.save!
  end

  def destroy
    @evaluation_item = @event.evaluation_items.find(params[:evaluation_item_id])
    @team = @event.teams.find(params[:team_id])
    @score = @team.scores.find_by!(evaluation_item: @evaluation_item, team: @team)
    @score.destroy!
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end
