class EntriesController < ApplicationController
  before_action :require_login
  before_action :find_journal, only: [:show, :new, :index, :create, :edit]
  before_action :find_entry, only: [:show, :edit, :update, :destroy]

  #/journals/:journal_id/entries
  def index
    @entries = @journal.entries
  end

  def search
    @entry = Entry.search(params[:title])
    render :index
  end

  #/journals/:journal_id/entries/:id
  def show
  end

  #/journals/:journal_id/entries/:id/edit 
  def new
    @entry = @journal.entries.build
  end

  def create
    @entry = Entry.new(entry_params)
    #/journals/:journal_id/entries/:id
    if @entry.save
      redirect_to journal_entry_path(params[:journal_id], @entry)
    else
      flash.now[:error] = @entry.errors.full_messages[0]
      render :new
    end
  end

  def edit 
  end

  def update
    @entry.update(entry_params)
    redirect_to journal_entry_path(@entry.journal_id, @entry)
  end

  def destroy
    @entry.destroy
    flash[:notice] = "#{@entry.title} has been deleted"
    redirect_to journal_path  #need to redirect to the journal that it was deleted from show page
  end


  private

    def find_journal
      @journal = Journal.find(params[:journal_id])
    end

    def find_entry
     @entry = Entry.find(params[:id])
    end

    def entry_params
     params.require(:entry).permit(:title, :date, :description, :entry_type_id, :journal_id, :user_id) #not requiring a description
    end

end
