class EntriesController < ApplicationController

def index
  @entries= Entry.all
end

def show
  @entry = Entry.find(params[:id])
  @keywords = @entry.alchemy
end

def new
    @entry = Entry.new
end

def create
    entry = params[:entry]
    @entry = Entry.new(entry_params)
    if @entry.save
        redirect_to @entry
    else
        redirect_to :new
    end
end

private
  def entry_params
    params.require(:entry).permit(:input)
  end


end
