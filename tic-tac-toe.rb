# SHOULD THE BOARD HAVE A KEY OF NUMBERS 1-9 AND WITH A VALUE OF '-' AND WHEN PLAYERS
# PUTS A CHOICE IN IT WILL CHANGE '-' TO EITHER 'X' OR 'O' BASED ON WHICH PLAYERS IS 
# GOING.

class Game
	attr_accessor :player_1, :player_2, :play
	@@board

	def initialize(player_1, player_2)
		@player_1 = player_1
		@player_2 = player_2
		@@board = Board.new
		@@board.display_board
	end


	class Board

		def initialize
			# @@board = board
			game_running = true
			@@board = build_board
			# puts @@board
		end

		def build_board
			board = Array.new
			i = 0
			3.times do
				row = Hash.new
				3.times { i += 1; row[i] = "-" }
				board.push(row)
			end
			board[0][3] = "Hello"
			@@board = board
		end

		def display_board
			puts @@board
		end

		# puts @@board
	end

	# def display_board
	# 	puts @@board
	# end
end

game = Game.new("Chris", "Bry")
# puts game.display_board	