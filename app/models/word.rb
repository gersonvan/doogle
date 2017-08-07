class Word < ApplicationRecord

  require 'mw_dictionary_api'
  require 'json'

  def self.search(name)
      where('name LIKE ?', "#{name}")
    end

  def dicapi_search(name)
      client = MWDictionaryAPI::Client.new("22db59d8-2b84-4309-849e-50978735b453", api_type: "collegiate")
      word = client.search(name.to_s)
      word= word.to_json
        #word.each do |definition|
        #  puts "#{definition['term']}: #{datum['text']}"
        #end
      word = JSON.parse(word)['entries'][0]['definitions'][0]['text']
      word
      puts word.inspect
    end
end
