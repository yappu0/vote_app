class VotesController < ApplicationController
  before_action :set_event, only: %i[new create edit update]

  def new
    @vote = @event.votes.build
  end

  def create
    @vote = @event.votes.build
    @vote.save!
    redirect_to root_path, notice: t('controllers.created')
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end
