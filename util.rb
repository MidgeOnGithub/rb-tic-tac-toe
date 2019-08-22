def ask(prompt)
  puts prompt + ' [yes/no]:'
  yes_or_no?
end

def yes_or_no?
  first_try = true
  response = ''
  until %w[yes y no n].include?(response)
    puts "Input one of 'yes'/'y' or 'no'/'n'." unless first_try
    response = gets.chomp.downcase
    first_try = false
  end

  %w[yes y].include?(response)
end
