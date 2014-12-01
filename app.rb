require './lib/mega_millions'
require 'pry' # pry debugger allows you to stop the code at any point in running
require 'sinatra'
require 'humanize'

# Visit this page by going to
# http://localhost:4567

get '/' do
  # binding.pry # uncomment this line to see pry in action
  erb :index
end

# Visit this page by going to
# http://localhost:4567/simple_lotto

get '/simple_lotto' do
  dropdown_value = @params["numbers"]

  if dropdown_value == nil
    dropdown_value = 0
  end
  value_as_number = dropdown_value.to_i

  lotto = MegaMillions.new(value_as_number)

  @numbers = lotto.random

  erb :simple_lotto
end


# This example shortens the code and defaults selected number
get '/better_lotto' do
  # The following line is the same as lines 15-20 above
  @how_many = @params["numbers"].to_i

  lotto = MegaMillions.new(@how_many  || 0)

  @numbers = lotto.random

  erb :better_lotto
end
