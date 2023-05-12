class VotesController < ApplicationController
  before_action :set_event, only: %i[new create edit update]

  def new
    @vote = @event.votes.build
  end

  def create
    @vote = @event.votes.build(vote_params)
    if @vote.save
      redirect_to root_path, notice: t('controllers.created')
    else
      render :new
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def vote_params
    params.require(:vote).permit(scores_attributes: [:team_id, :evaluation_item_id, :point])
  end
end
