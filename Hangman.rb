class Hangman

  #class attributes
  attr_reader :word
  attr_reader :letters
  attr_accessor :display
  attr_reader :lives

  def initialize
    @word = words.sample #method sample selects a random element of an array
    #@word.first - gets the first element of the word array; .length - gets the number of letters of the word;
    #Array.new() - will create a new array with the given number of letters and each letter is initially '_'
    @display = Array.new(@word.first.length, "_ ") 
    @lives = 6
  end

  #Array with the group of words to use
  def words
    [
      ["Primavera", "Estação do ano"],
      ["Caramelo","doce"],
      ["Futebol", "desporto de equipa"],
      ["Festival", "Envolve musica"]
    ]
  end

  #ask user for a letter
  def begin
    
    puts "Guess the word!\n\n"
    puts "Your clue is #{@word.last}\n\n" #@word.last - gets the second element of the word array
    
   until !@display.include?("_ ") || lives == 0 #until the display array doesn't include "_ " anymore, do the loop
      found = false #flag to check if the letter exists in the word
      print display.join(" ") #join() - joins/converts the elements of the array into a string separated by the given character
      print "\n\nEnter a letter: "
      $stdout.flush
      guess = gets&.chomp #O caracter & faz com que o sistema só chame o método .chomp se o input for diferente de null e evita erros de processamento
     print "\n"
      @word.first.chars.each_with_index do |char, index| #each_with_index - function that is used to iterate over the array and returns the value of each element
        if char.downcase == guess.downcase #downcase is important here. If the system compares a capital letter with a lowercase letter, it will return false
          display[index] = guess.downcase
          found = true
        end
      end 
     puts "This letter doesn't exist!\n\n" if found == false
    @lives -= 1 if found == false
    end #until

    if @lives == 0
      puts "You lost!\n\n"
    else
      puts "Congratulations! You won!\n\n"
    end
  end
end
 
#test  
game = Hangman.new
game.begin


