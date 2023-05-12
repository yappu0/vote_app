class EventsController < ApplicationController
  before_action :set_event, only: %i[show]

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to event_path(@event), notice: t('controllers.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(
      :name, :password, :point,
      teams_attributes: [:name],
      evaluation_items_attributes: [:name],
    )
  end
end
