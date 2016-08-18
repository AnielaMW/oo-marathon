require_relative 'animal'

class Python < Animal
  include Reptile

  def speak
    "SSSSssssss..."
  end
end
