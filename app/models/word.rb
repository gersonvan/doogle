class Word < ApplicationRecord
  require 'mw_dictionary_api'

  client = MWDictionaryAPI::Client.new(ENV['MW_COLLEGIATE_API_KEY'], api_type: "collegiate")

  def self.search(name)
      result = where('name LIKE ?', "#{name}").order('name DESC')
      if !result.to_s.empty?
        result
      else
        client.search(name)
      end
    end
  end
