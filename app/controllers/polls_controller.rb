class PollsController < ApplicationController
  load_and_authorize_resource

  before_filter :load_poll, only: [:show, :edit, :update, :nominate, :add_options, :vote]
  before_filter :load_places, only: [:show]
  before_filter :load_current_votes, only: [:show, :vote]

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
    params[:places].values.each do |place_id|
      existing = @poll.poll_options.detect { |po| po.place_id == place_id.to_i }
      @poll.poll_options.create(place_id: place_id) if existing.nil?
    end
    redirect_to poll_path(@poll)
  end

  def edit
  end

  def update
  end

  def show
    @votes_by_user = @poll.votes.each_with_object({}) do |vote, hsh|
      if hsh[vote.user_id].nil?
        hsh[vote.user_id] = [vote]
      else
        hsh[vote.user_id] << vote
      end
    end
  end

  def destroy
    Poll.find(params[:id]).destroy
    flash[:success] = "Poll deleted."
    redirect_to polls_path
  end

  def vote
    unless params[:poll_options].nil? || params[:poll_options].empty?
      current_votes = current_user.votes.where(poll_option_id: @poll.poll_options.map { |o| o.id })
      if current_votes.size + params[:poll_options].size <= @poll.max_votes_per_user
        params[:poll_options].values.each do |id|
          current_user.votes.create(poll_option_id: id)
        end
      else
        flash[:error] = "Unable to process #{"vote".pluralize(params[:poll_options].size)}. The maximum allowed votes for this poll is #{@poll.max_votes_per_user}."
      end
    end
    redirect_to poll_path(@poll)
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

  def load_current_votes
    @current_votes = current_user.votes.where(poll_option_id: @poll.poll_options) unless current_user.nil? || @poll.poll_options.empty?
  end

end
