class EntriesController < ApplicationController

before_action :authenticate, only: [:edit, :index, :update, :destroy]

def index
  @entries= Entry.all
end

def show
  @entry = Entry.find(params[:id])
  @keywords = @entry.alchemy
  @array = @keywords.map { |kw| kw["text"] }
  @number = params[:number].to_i
  if  @number == nil
    @number_of_keywords = 5
  else
    @number_of_keywords = @number
  end
  @kw = []
  @number_of_keywords.times do
    @kw << @array.shift
  end

  #wiki
  @wiki= Entry.wiki(@array[0])
  @wiki_titles = @wiki.map { |title| title["title"] }
  @wiki_snippet = @wiki.map { |snippet| snippet["snippet"] }

  #google
  # @google= Entry.google(@array[0])
  # @google_titles = @google.map { |title| title["title"] }
  # @google_snippets = @google.map { |snippet| snippet["snippet"] }
  # @google_images = @google.map { |image| image["pagemap"] }
  # @google_links = @google.map { |link| link["link"] }

  #souncloud
  @soundcloud = Entry.soundcloud(@wiki_titles[0])
  #video
  # @youtube = Entry.youtube(@array)

end

def keyword
  @entry = Entry.find(params[:id])
  @keywords = @entry.alchemy
  @array = @keywords.map { |kw| kw["text"] }
  @number = params[:number].to_i
  if  @number == nil
    @number_of_keywords = 5
  else
    @number_of_keywords = @number
  end
  @kw = []
  @number_of_keywords.times do
    @kw << @array.shift
  end

  @wiki= Entry.wiki(params[:keyword])
  @wiki_titles = @wiki.map { |title| title["title"] }
  @wiki_snippet = @wiki.map { |snippet| snippet["snippet"] }
  #google
  # @google= Entry.google(params[:keyword])
  # @google_titles = @google.map { |title| title["title"] }
  # @google_snippets = @google.map { |snippet| snippet["snippet"] }
  # @google_images = @google.map { |image| image["pagemap"] }
  # @google_links = @google.map { |link| link["link"] }

  #souncloud
  @soundcloud = Entry.soundcloud(@wiki_titles[0])
  #video
 # @youtube = Entry.youtube(@array[0])
end

def new
    @entry = Entry.new
end
def new2
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
    params.require(:entry).permit(:input, :number)
  end


end
