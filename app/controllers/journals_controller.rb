class JournalsController < ApplicationController
  before_action :require_login
  before_action :find_journal, only: [:show, :edit, :update, :destroy]

  #app/controllers/journals_controller.rb
  def search
    @journal = Journal.search(params[:title]).select { |j| j.user_id == current_user.id }
    render :index
  end

  def index
      @journal = current_user.journals
  end

  def show
  end

  def new
    @journal = Journal.new
  end

  def create
    @journal = Journal.new(journal_params)
    @journal.user = current_user
    if @journal.save
      redirect_to journals_path
    else
      flash.now[:error] = @journal.errors.full_messages[0]
      render :new
    end
  end

  def edit
  end

  def update
    if @journal.update(journal_params)
      redirect_to journal_path(@journal)
    else
      flash.now[:error] = @journal.errors.full_messages
      render :new
    end
  end

  def destroy
    @journal.destroy
    flash[:notice] = "#{@journal.title} has been deleted"
    redirect_to journals_path
  end

  private

    def find_journal
      @journal = Journal.find(params[:id])
    end

    def journal_params
      params.require(:journal).permit(:title, :description)
    end

end
