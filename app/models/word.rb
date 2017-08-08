class Word < ApplicationRecord

  require 'mw_dictionary_api'
  require 'json'

  def self.dicapi_search(search_name)
      client = MWDictionaryAPI::Client.new("22db59d8-2b84-4309-849e-50978735b453", api_type: "collegiate")
      word = client.search(search_name.to_s)
      word= word.to_json
      puts word
      json = JSON.parse(word)
      result = if json['entries'].empty?
        json['suggestions']
        # Colocar sugestões para aparecer na tela junto com "Did you mean?"
      else
        res = []
        json['entries'].each do |entry|
          entry['definitions'].each do |definition|
            create name: search_name, definition: definition['text']
            res << self.new(name: search_name, definition: definition['text'])
          end
        end
        res
      end
      result
    end
end
