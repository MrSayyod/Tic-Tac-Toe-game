class Board
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def display_board(_element)
    array = Array.new(9, '')
    puts '  ' + array[0] + ' | ' + array[1] + ' | ' + array[2]
    puts separator = '-----------'
    puts '  ' + array[3] + ' | ' + array[4] + ' | ' + array[5]
    puts separator
    puts '  ' + array[6] + ' | ' + array[7] + ' | ' + array[8]
  end

  def winning
    [[array[0], array[1], array[2]],
     [array[0], array[3], array[6]],
     [array[1], array[4], array[7]],
     [array[2], array[5], array[8]],
     [array[3], array[4], array[5]],
     [array[6], array[7], array[8]],
     [array[0], array[4], array[8]],
     [array[2], array[4], array[6]]]
  end

  def current(*)
    switch = 0
    until switch == 9
      switch += 1
      current_player = if switch.odd?
                         [player1_name, player1_select, player1_choice]
                       else
                         [player2_name, player2_select, player2_choice]
                       end
    end
    current_player
  end

  def combination
    winning.each do |combos|
      if combos == player1_select
        puts "#{player1_name} wins"
      elsif combos == player2_select
        puts "#{player2_name} wins"
      else
        puts 'DRAW! Friendship wins)'
      end
    end
  end

  def checking
    index = current_player[2] - 1
    if array[index].empty? == true
      array[index] = current_player[1]
    else
      puts 'This cell was taken!!! Please, choose another option)'
    end
  end
end
