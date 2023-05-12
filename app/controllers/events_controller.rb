class EventsController < ApplicationController
  before_action :set_event, only: %i[show]

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.teams = params[:event][:teams].split(' ').map { |team_name| Team.new(name: team_name) }
    @event.evaluation_items = params[:event][:evaluation_items].split(' ').map { |item_name| EvaluationItem.new(name: item_name) }

    if @event.save
      redirect_to event_path(@event), notice: t('controllers.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def result
    @event = Event.find(params[:event_id])
    if @event.password == params[:password]
      render :result
    else
      redirect_to event_path(@event), notice: "パスワードが正しくありません。再度入力してください。"
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :password, :point)
  end
end
