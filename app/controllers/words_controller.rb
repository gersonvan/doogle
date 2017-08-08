class WordsController < ApplicationController
  def index
    @suggestions = []
    @word = []
    if  name_params = params[:name]
      @word = Word.find_by(name: name_params)

      if @word
        @word = Word.where(name: name_params)
      else
        result = Word.dicapi_search(name_params)
        @word = result[:words]
        @suggestions = result[:suggestions]
      end
      puts "The word is : #{@word}"
      puts "The suggestions are : #{@suggestions}"
    end
  end
end
