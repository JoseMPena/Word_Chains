require 'ruby-dictionary'
require 'pry'

class WordChain
  def initialize(dictionary)
    @dictionary = dictionary
  end

  def find_chain(first = "cat", second = "dog")
    # Write your algorithm here
    output = first.dup
    puts output
    until output == second
      second.chars.each_with_index do |char, index|
        unless (output[index]) == char
          output[index] = char
          if @dictionary.exists?(output)
            puts output if output != second
          else
            output[index] = first[index]
          end
        end
      end
    end
    puts output
  end
end

dictionary = Dictionary.from_file("/usr/share/dict/words")
my_chain = WordChain.new(dictionary)
my_chain.find_chain("rice", "pine")
