class EntriesController < ApplicationController

  #/journals/:journal_id/entries
  def index
    #see if I need an index page for all entries--> where will this be shown (user flow)
  end

  #/journals/:journal_id/entries/:id
  def show
    find_journal
    find_entry
  end

  #/journals/:journal_id/entries/:id/edit 
  def new
    find_journal
    @entry = @journal.entries.build
  end

  def create
    @entry = Entry.new
    #/journals/:journal_id/entries/:id
    if @entry.save
      redirect_to journal_entry_path(params[:journal_id], @entry)
    else
      render :new
    end
  end

  def edit
    find_journal
    find_entry
  end

  def update
    find_entry
    @entry.update(entry_params)
    redirect_to journal_path(@entry.journal_id)
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
