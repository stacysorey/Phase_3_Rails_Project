class EntryTypesController < ApplicationController
#should not be accessible/edited by users 

  def new
    @entry_type = EntryType.new
  end

  def create 
    @entry_type = EntryType.new(entry_type_params)
  end

  private
  
  def entry_type_params
      params.require(:entry_type).permit(:category)
  end
end 