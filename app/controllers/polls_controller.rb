class PollsController < ApplicationController
  before_filter :load_poll, only: [:show, :edit, :update, :nominate, :add_options]
  before_filter :load_places, only: [:show]

  def index
    @polls = Poll.paginate(page: params[:page])
  end

  def new
    @poll = Poll.new
  end

  def create
    @poll = current_user.polls_started.create(params[:poll])
    if @poll
      flash[:success] = "Poll created"
      redirect_to poll_path(@poll)
    else
      flash[:error] = "Unable to create poll."
      render "new"
    end
  end

  def nominate
    @places = Place.all
  end

  def add_options
    params[:places].each do |val|
      @poll.poll_options.create(place_id: val[0])
    end
    redirect_to poll_path(@poll)
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
    Poll.find(params[:id]).destroy
    flash[:success] = "Poll deleted."
    redirect_to polls_path
  end

  private

  def load_poll
    @poll = Poll.find(params[:id])
    if @poll.nil?
      flash[:error] = "Unable to find poll."
      redirect_to polls_path
    end
  end

  def load_places
    @places = Place.find @poll.poll_options.map { |o| o.place_id }
  end
end
