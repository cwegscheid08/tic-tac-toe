# SHOULD THE BOARD HAVE A KEY OF NUMBERS 1-9 AND WITH A VALUE OF '-' AND WHEN PLAYERS
# PUTS A CHOICE IN IT WILL CHANGE '-' TO EITHER 'X' OR 'O' BASED ON WHICH PLAYERS IS 
# GOING.

class Game
	attr_accessor :player_1, :player_2, :p1_name, :p2_name, :p1_playing, :p2_playing
	@@board = []

	def initialize(p1_name, player_1, p2_name, player_2)
		@player_1 = player_1
		@player_2 = player_2
		@p1_name = p1_name
		@p2_name = p2_name
		@p1_playing = true
		@p2_playing = false
		game = Board.new
	end

	class Board < Game

		def initialize
			@@board = build_board
		end

		def build_board
			i = 0
			3.times do
				row = Hash.new
				3.times { i += 1; row[i] = "   " }
				@@board.push(row)
			end
			@@board
		end
	end

	def display_board
		puts @@board, "\n"
	end

	def make_move
		# SHOWS WHICH PLAYER IS PLAYING AND WHERE THEY WANT TO PUT THEIR CHARACTER
		puts @p1_playing ? "#{@p1_name.capitalize}'s Turn!" : "#{@p2_name.capitalize}'s Turn!"
		@p1_playing ? run_round(@player_1) : run_round(@player_2)

	end



	def run_round(player)	
		# UPDATES BOARD, CALLS GAME_OVER? (IF TRUE CALLS P1/P2_WIN?), DISPLAY'S BOARD 

		update_board(player, get_cell)

		display_board

		next_player

		game_over?(@@board) ? "You Win!" : make_move

	end

	def update_board(player, cell)
		# ASSIGNS VALUE TO CORESPONDING CELL IN @@BOARD
		@@board[cell[0]][cell[1]] == "   " ? @@board[cell[0]][cell[1]] = player : (puts "\n\nALREADY TAKEN!\nGO AGAIN!\n\n"; make_move )
	end

	def get_cell
		# FINDS CELL LOCATION
		puts "Give me the cell number you want:"
		move = gets.chomp.to_i
		move <= 3 ? [0, move] : (move <= 6 ? [1, move] : (move <= 9 ? [2, move] : "ERROR"))
	end

	def next_player
		# SWITCHES PLAYERS
		@player_1_playing ? @player_2_playing = true : @player_1_playing = true
		@p1_playing ? (@p2_playing = true; @p1_playing = false) : (@p2_playing = false; @p1_playing = true)
	end



	private

	def game_over?(board)
		# CHECK TO SEE IF THERE ARE ANY OF THE SAME CHARACTER IN A SEQUENCE OF THREE IN A ROW
		row = 0
		column = 1
		while row < 3
			while column <= 9
				# puts board[row][column], board[row][column+1], board[row][column+2] == "X", "O"
				if board[row][column] == board[row][column+1] && board[row][column+1] == board[row][column+2]
					if board[row][column] != "   "
						board[row][column] == "X" ? player_1_win : player_2_win
						return true
					end
				end

				column += 3
				row += 1
			end
		end

		row = 0
		column = 1

		while column <= 3
			if board[row][column] == board[row+1][column+3] && board[row+1][column+3] == board[row+2][column+6]
					if board[row][column] != "   "
						board[row][column] == "X" ? player_1_win : player_2_win
						return true
					end
			end
			column += 1
		end

		if board[0][1] == board[1][5] && board[1][5] == board[2][9]
			if board[1][5] != "   "
				board[1][5] == " X " ? player_1_win : player_2_win
				return true
			end
		elsif board[0][3] == board[1][5] && board[1][5] == board[2][7]
			if board[1][5] != "   "
				board[1][5] == " X " ? player_1_win : player_2_win
				return true
			end
		end

		false
	end

	def player_1_win
		# IF THE KEY OF THREE IN A ROW MATCHES P1, RETURNS "YOU WIN!" MESSAGE AND FINISHES PROGRAM
		puts "#{@p1_name.upcase} WINS!"

	end

	def player_2_win
		# IF THE KEY OF THREE IN A ROW MATCHES P2, RETURNS "YOU WIN!" MESSAGE AND FINISHES PROGRAM
		puts "#{p2_name.upcase} WINS!"
	end


end
puts "Player 1, give me your first name."
p1_name = gets.chomp.downcase
puts "Player 2, give me your first name."
p2_name = gets.chomp.downcase


game = Game.new(p1_name, " X ", p2_name, " O ")
game.display_board
game.make_move

# game.display_board