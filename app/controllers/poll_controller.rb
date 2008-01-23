class PollController < ApplicationController
  before_filter :authorize
  
  def index
    @polls = Poll.find(:all, :order => "created_at DESC")
  end
  
  def questions
    @poll = Poll.find(params[:id])
  end
  
  def clone_poll
    Poll.transaction do
      poll = Poll.find(params[:id])
      new_poll = Poll.new
      new_poll.description = poll.description
      new_poll.save
      #to test transactions uncomment next line
      #raise "test rollback"
      poll.questions.each do |question|
        new_question = Question.new
        new_question.description = question.description
        new_question.poll = new_poll
        new_question.save
      end
    end #transaction
    flash[:notice] = 'Poll was successfully cloned!'
    redirect_to :action => 'index'
  end
  
  def delete_poll
    poll = Poll.find(params[:id])
    poll.questions.each do |question|
      question.votes.each do |vote|
        vote.destroy
      end
      question.destroy
    end  
    poll.destroy
    flash[:notice] = 'Poll was successfully deleted!'
    redirect_to :action => 'index'
  end
  
  def new_poll
    @poll = Poll.new(params[:poll])
    if request.post? and @poll.save
      flash[:notice] = 'New Poll Created'
      flash[:poll] = @poll
      render :action => 'add_questions'
    end
  end
  
  def add_questions
    @poll = flash[:poll]
    @question = Question.new(params[:question])
    @question.poll = @poll
    if request.post? and @question.save
      flash[:notice] = 'New Question added to the Poll'
      @question = Question.new
      @poll.reload
    end
    flash[:poll] = @poll
  end
  
  #corresponding template is rate_question.rjs
  def rate_question  
    question = Question.find(params[:id])
    vote = Vote.new
    vote.rate = params[:value]
    vote.question = question
    vote.save
    question.reload
    @question = question
    (session[:votes] ||= Hash.new)[@question.id] = @question.id
    #puts session[:votes].size
  end
end
