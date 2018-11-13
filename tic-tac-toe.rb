# SHOULD THE BOARD HAVE A KEY OF NUMBERS 1-9 AND WITH A VALUE OF '-' AND WHEN PLAYERS
# PUTS A CHOICE IN IT WILL CHANGE '-' TO EITHER 'X' OR 'O' BASED ON WHICH PLAYERS IS 
# GOING.

class Game
	attr_accessor :player_1, :player_2, :p1_playing, :p2_playing
	@@board = []

	def initialize(player_1, player_2)
		@player_1 = player_1
		@player_2 = player_2
		@p1_playing = true
		@p2_playing = false
		game = Board.new
	end

	class Board < Game

		def initialize
			game_running = true
			@@board = build_board
		end

		def build_board
			i = 0
			3.times do
				row = Hash.new
				3.times { i += 1; row[i] = "-" }
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
		puts p1_playing		
		@p1_playing ? run_round(@player_1) : run_round(@player_2)

		# if player_1_playing == true
		# 	run_round(@player_1, get_cell)
		# else
		# 	run_round(@player_2, get_cell)
		# end
	end



	def run_round(player)	
		# UPDATES BOARD, CALLS GAME_OVER? (IF TRUE CALLS P1/P2_WIN?), DISPLAY'S BOARD 
		# while game_over?(@@board) == true

			# @player_1_playing ? update_board(@player_1, get_cell) : update_board(@player_2, get_cell)
			update_board(player, get_cell)

			display_board

			next_player

			game_over?(@@board) ? (player_1_win? || player_2_win?) : make_move
		# end
	end

	def update_board(player, cell)
		# ASSIGNS VALUE TO CORESPONDING CELL IN @@BOARD
		@@board[cell[0]][cell[1]] = player
	end

	def get_cell
		puts "Make your move."
		move = gets.chomp.to_i
		move <= 3 ? [0, move] : (move <= 6 ? [1, move] : (move <= 9 ? [2, move] : "ERROR"))
	end

	def next_player
		@player_1_playing ? @player_2_playing = true : @player_1_playing = true
		@p1_playing ? (@p2_playing = true; @p1_playing = false) : (@p2_playing = false; @p1_playing = true)
	end

	private

	def game_over?(board)
		# CHECK TO SEE IF THERE ARE ANY OF THE SAME CHARACTER IN A SEQUENCE OF THREE IN A ROW
		# puts board[1][5]
		false
	end

	def player_1_win?
		# IF THE KEY OF THREE IN A ROW MATCHES P1, RETURNS "YOU WIN!" MESSAGE AND FINISHES PROGRAM
		# true
		# puts "PLAYER_1 WINS!"
	end

	def player_2_win?
		# IF THE KEY OF THREE IN A ROW MATCHES P2, RETURNS "YOU WIN!" MESSAGE AND FINISHES PROGRAM
		# false
		# puts "PLAYER_2 WINS!"
	end


end

game = Game.new("X", "O")
game.display_board
game.make_move
# puts ""
# game.display_board