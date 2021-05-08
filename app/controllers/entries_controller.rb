class EntriesController < ApplicationController
  before_action :find_journal, only: [:show, :new, :edit]
  before_action :find_entry, only: [:show, :edit, :update, :destroy]

  #/journals/:journal_id/entries
  def index
    #see if I need an index page for all entries--> where will this be shown (user flow)
  end

  #/journals/:journal_id/entries/:id
  def show
  end

  #/journals/:journal_id/entries/:id/edit 
  def new
    @entry = @journal.entries.build
  end

  def create
    @entry = Entry.new
    #/journals/:journal_id/entries/:id
    if @entry.save
      redirect_to journal_entry_path(params[:journal_id], @entry)
    else
      flash.now[:error] = @entry.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    @entry.update(entry_params)
    redirect_to journal_path(@entry.journal_id)
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
     params.require(:entry).permit(:title, :date, :category) #not requiring a description
    end
    
end
