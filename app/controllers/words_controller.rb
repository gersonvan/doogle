class WordsController < ApplicationController
  def index
    @word = Word.find_by name: (params[:name])
    if @word
      @word = Word.search(params[:name])
    else
      flash[:notice] = 'Palavra não encontrada.'
      Word.dicapi_search(params[:name])
    end
  end

  def show
    @word = Word.find(params[:id])
  end

  def edit
    @word = Word.find(params[:id])
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(params.require(:word).permit(:name, :definition))

    @word.save
    redirect_to @word
  end

  #private
  #def word_params
  #  params.require(:word).permit(:name, :definition)
  #end
end
