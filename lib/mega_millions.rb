class MegaMillions

  def initialize(how_many)
    @num_numbers = how_many
  end

  # get however many random numbers
  def random
    numbers = []
    while numbers.length < @num_numbers
    	pick = (rand(75) + 1).to_i
  		unless numbers.include?(pick)
  			numbers << pick
  		end
    end
    numbers
  end
end
