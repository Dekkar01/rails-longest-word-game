require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
    @data_start = Time.now.strftime("%H:%M:%S")
  end
  def score
    base_uri = 'https://dictionary.lewagon.com'
    @answered = params[:word]
    url = "#{base_uri}/#{@answered}"
    response = URI.open(url).read
    @response = JSON.parse(response)
    @found = @response['found']
    @date_end = Time.now.strftime("%H:%M:%S")
  end
end
