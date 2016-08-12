require_relative 'para'
$VERBOSE = nil
def numbers
  [
    {
      symbol: "℮",
      number: 2.718281828
    },
    {
      symbol: "√2",
      number: 1.414213,
    },
    {
      symbol: "⌈𝜋⌉",
      number: 4
    },
    {
      symbol: "⌊𝜋⌋",
      number: 3
    },
    {
      symbol: "⌊℮⌋",
      number: 2
    },
    {
      symbol: "⌊Φ⌋",
      number: 1
    },
    {
      symbol: "Φ",
      number: 1.618033989
    },
    {
      symbol: "𝜋",
      number: 3.141592654,
    },
    
  ]
end

def operators
  [
    '**',
    '*',
    '/',
    '-',
    '+'
  ]
end

def operator_permutations(number_of_numbers)
  operators.repeated_permutation(number_of_numbers-1).to_a
end
def number_permutations(number_of_numbers)
  numbers.repeated_permutation(number_of_numbers).to_a
end

def factorial(n)
  (1..n).inject(:*) || 1
end

runs = 0
6.times do |number_of_numbers|
  puts number_of_numbers
  number_permutations(number_of_numbers).each do |number_permutation|
    operator_permutations(number_of_numbers).each do |operator_permutation|
      
      runs += 1
      formula = []
      formula_pretty = []
      number_permutation.each_with_index do |number, ni|
        formula << number[:number]
        formula_pretty << number[:symbol]
        formula << operator_permutation[ni]
        formula_pretty << operator_permutation[ni]
      end
      
      formula_string = formula.join(" ")
      result = eval(formula_string)
      if result < 1338 && result > 1336
        result_floor = result.floor
        result_ceil = result.ceil
        
        which_way = if result_floor == 1337
          'floor'
        elsif result_ceil == 1337
          'ceil'
        else
          "no no no"
        end
        
        puts result.to_s + " = " + formula_pretty.join(" ").to_s + "--------" + which_way.to_s
      end
    end
  end
end
          
puts runs
