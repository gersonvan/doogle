class WordsController < ApplicationController
  def index
    @words = Word.search(params[:name])
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
