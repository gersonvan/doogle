class WordsController < ApplicationController
  def index
    if  name_params = params[:name]
      @word = Word.find_by(name: name_params)

      if @word
        @word = Word.where(name: name_params)
      else
        @word = Word.dicapi_search(name_params)
      end
      
    end
  end
end
