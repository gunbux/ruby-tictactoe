#TODO: Gets user input (username,1p2p,first square)

def playerMode()
  # Selects the gamemode the player wants to play. Returns 1 for solo play and 2 for multiplay
  puts "1 Player or 2 Player? (1/2)"
  playerNumber = gets.chomp
  ##puts "playerNumber is #{playerNumber}" #- Working as intended
  if (playerNumber=='1')
    puts "Solo Play Selected. Starting game..."
  elsif (playerNumber=='2')
    puts "Two Player Mode Selected. Starting game..."
  else
    puts "Error. Please select type either 1 or 2 to start the game."
    playerNumber = playerMode()
  end
  return playerNumber.to_i
end

def getUser(placeholder=nil)
  # Gets the user's username
  if (placeholder == nil)
    puts "Please enter a username: "
    user = gets.chomp
  else
    puts "#{placeholder}, please enter a username: "
    user = gets.chomp
  end
  return user
end

##Test Cases
#puts getUser()
#puts getUser('player 1')
#puts getUser('nm21')

#TODO: Get inputs from user, parameters - username, returns location of x/o
def getInput(user,currentboard)
  #Gets input from the user, and returns the digit of square
  while true
    puts "#{user}'s turn. Please pick a square:"
    output = gets.chomp.to_i
    if (currentboard[output-1]==nil && output < 10 && output > 0)
      return output
    else
      puts "Invalid input. Has the square already been taken?"
    end
  end
end

#TODO: Function that draws the board using a given list of inputs.

def drawBoard(board)
  board.each_with_index do |item,index|
    #TODO: Draw the board with items, and squares with index are replaced with numbers instead.
    if index==3 || index==6
      puts ""
      puts "---------"
    end

    if (item==nil)
      print "|#{index+1}|"
    else
      print "|#{item}|"
    end

    if index==8
      puts ""
      puts ""
    end
  end
end

##Test Cases
#board1 = [nil,nil,nil,nil,nil,nil,nil,nil,nil] #Working as intended
#board2 = ['x',nil,nil,nil,'x',nil,nil,nil,nil] #Working as intended
#drawBoard(board1) #Working as intended
#drawBoard(board2) #Working as intended

def checkWinCondition(input,board)
  #Win Condition 1: horizontal row

  if [board[0],board[1],board[2]] == [input,input,input] || [board[3],board[4],board[5]] == [input,input,input] || [board[6],board[7],board[8]] == [input,input,input]
    return true
  end

  #Win Condition 2: vertical row
  
  if [board[0],board[3],board[6]] == [input,input,input] || [board[2],board[5],board[8]] == [input,input,input] || [board[3],board[6],board[9]] == [input,input,input]
    return true
  end

  #Win Condition 3: Diag row

  if [board[0],board[4],board[8]] == [input,input,input] || [board[2],board[4],board[6]] == [input,input,input]
    return true
  end

end

#Run the playerMode function to select mode.
mode = playerMode()

#TODO: Start the game loop using information taken previously given inputs.
if (mode==2)
  #TODO: Multiplay mode -- Get username of both players, then get inputs from both users each turn

  player1 = getUser('Player 1')
  player2 = getUser('Player 2')
  isCompleted = false
  turnnumber = 0
  board = [nil,nil,nil,nil,nil,nil,nil,nil,nil]

  until isCompleted == true do
    #Start of game loop
    
    if !board.include?nil
      isCompleted = true
      drawBoard(board)
      puts "Game Over! Draw!"
      break
    end
    
    ##TODO: Check for win condition
    if checkWinCondition('x',board)
      isCompleted = true
      drawBoard(board)
      puts "Player 1 wins!"
      break
    end

    if checkWinCondition('o',board)
      isCompleted = true
      drawBoard(board)
      puts "Player 2 wins!"
      break
    end

    turnnumber += 1
    if turnnumber.odd?
      drawBoard(board)
      input = getInput(player1,board) -1
      board[input] = 'x'
    else
      drawBoard(board)
      input = getInput(player2,board) -1
      board[input] = 'o'
    end


  end
else
  #TODO: Solo Play Mode
end
