class EventsController < ApplicationController
before_action :load_event, only: [:edit, :show, :update, :destroy]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new qualified_event_params

    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def show
  end

  def destroy
    @event.delete
    redirect_to root_path
  end

  def edit
  end

  def update
    @event.update qualified_event_params
    redirect_to @event
  end


end


private

  def load_event
    @event = Event.find(params[:id])
  end

  def qualified_event_params
    params.require(:event).permit(:title, :description, :location, :startdatetime, :enddatetime)
  end