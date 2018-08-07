require 'open-uri'
require 'date'

class WordsController < ApplicationController

  def enter
    @random = []
    @start = Time.now
    10.times do
      @random << ('A'..'Z').to_a.shuffle.pop
    end
  end

  def check_word(word, array)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    serialized = open(url).read
    data = JSON.parse(serialized)
    word_array = word.split('').sort
    array = (array & word_array).flat_map { |n| [n]*[array.count(n), word_array.count(n)].min }
    if data["found"] && word_array == array.sort
      "#{word} is a valid word"
    elsif data['found']
       "#{word} exists but was not a valid option from the letters provided"
    else
      "#{word} is not a valid word"
    end
  end

  def score
    @start = params['time']
    @word = params['found'].upcase
    @random = params['random'].split(' ')
    @checking = check_word(@word, @random)
  end
end
