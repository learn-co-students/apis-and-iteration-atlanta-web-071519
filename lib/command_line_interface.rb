def welcome
  puts "Hello and Thank you for using this CLI... \n \n"
end

def get_character_from_user
  puts "please enter a character name"
  # use gets to capture the user's input. This method should return that input, downcased.
  character = gets.chomp
  character.downcase!
  return character
end
