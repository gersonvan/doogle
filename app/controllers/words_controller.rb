class WordsController < ApplicationController
  def index

    if  name_params = params[:name]
      @word = Word.find_by(name: name_params)


      if @word
        @word = Word.where(name: name_params)
      else
        @word = Word.dicapi_search(name_params)
      end

      # if !@word.is_a? Array
      #   @word = [@word]
      # end

      puts "The word is : #{@word}"
      #   Word.search(name_params)
      # else
      #   flash[:notice] = 'Palavra não encontrada.'
      #   Word.dicapi_search(name_params)
      # end
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
