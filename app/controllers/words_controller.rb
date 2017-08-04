class WordsController < ApplicationController
  def index
    @words = Word.all
  end

  def show
    @word = Word.find(params[:id])
  end

  def new
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
