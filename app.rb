require 'rubygems'
require "sinatra"
require_relative 'board_app.rb'
require_relative 'unbeatable_app.rb'
require_relative 'classes_app.rb'
enable :sessions
require 'pg'
load './local_env.rb' if File.exist?('./local_env.rb')
# Aws.use_bundled_cert!

db_params = {
    host: ENV['host'],
    port: ENV['port'],
    dbname: ENV['db_name'],
    user: ENV['user'],
    password: ENV['password']
}

db = PG::Connection.new(db_params)

	get '/' do
	
		session[:board] = Board.new
		erb :pick_player, :locals => {board: session[:board]}

	end

	post '/select_players' do 

		session[:name1] = params[:pname1]
		session[:name2] = params[:pname2]

		session[:player1_type] = params[:player1]
		session[:player2_type] = params[:player2]
		session[:human1] = 'no'
		session[:human2] = 'no'
		
		if session[:player1_type] == 'Human'
			session[:player1] = Human.new('X')
			
			session[:human1] = 'yes'
		elsif session[:player1_type] == 'Easy'
			session[:player1] = Sequential.new('X')
		
		elsif session[:player1_type] == 'Medium'
			session[:player1] = RandomAI.new('X')
			
		elsif session[:player1_type] == 'Impossible!'
			session[:player1] = UnbeatableAI.new('X')
			
		end

		if session[:player2_type] == 'Human'
			session[:player2] = Human.new('O')
			session[:human2] = 'yes'

		elsif session[:player2_type] == 'Easy'
			session[:player2] = Sequential.new('O')

		elsif session[:player2_type] == 'Medium'
			session[:player2] = RandomAI.new('O')

		elsif session[:player2_type] == 'Impossible!'
			session[:player2] = UnbeatableAI.new('O')

		end

		session[:active_player] = session[:player1]
		
		if session[:human1] == 'yes'
			redirect '/board'
		else
			redirect '/make_move'
		end
	end

	get '/board' do

		if session[:active_player] == nil

		redirect '/'
		else
		end

		erb :main_board, :locals => {player1: session[:player1], player2: session[:player2], active_player: session[:active_player].marker, board: session[:board]}

	end

	get '/make_move' do
		
		if session[:active_player] == nil

		redirect '/'
		else
		end

		move = session[:active_player].get_move(session[:board].ttt_board)
		session[:board].update_position(move, session[:active_player].marker)

		redirect '/check_game_state'

	end

	post '/human_move' do

		move = params[:choice].to_i - 1
		
		if session[:board].valid_position?(move)
			
			session[:board].update_position(move, session[:active_player].marker)
			redirect '/check_game_state'
		else
			
		 	redirect '/board'
		end

	end

	get '/check_game_state' do
		if session[:active_player] == nil

		redirect '/'
		else
		end
	
		if session[:board].winner?(session[:active_player].marker)

			message = "#{session[:active_player].marker} is the winner!"
			if 
					session[:human1] = 'yes' or session[:human2] = 'yes'


			db.exec("INSERT INTO tic(name, name2, date, result) VALUES('#{session[:name1]}', '#{session[:name2]}', '#{Time.now}', '#{message}')"
			else
			end
			erb :game_over, :locals => {board: session[:board], message: message}
			
		elsif session[:board].full_board?

			message = "Cat Game!"
			if 
					session[:human1] = 'yes' or session[:human2] = 'yes'


			db.exec("INSERT INTO tic(name, name2, date, result) VALUES('#{session[:name1]}', '#{session[:name2]}', '#{Time.now}', '#{message}')"
			else
			end
			erb :game_over, :locals => {board: session[:board], message: message}
		
		else
			if session[:active_player] == session[:player1]
				session[:active_player] = session[:player2]
			else
				session[:active_player] = session[:player1]
			end

			if session[:active_player] == session[:player1] && session[:human1] == 'yes' || session[:active_player] == session[:player2] && session[:human2] == 'yes'
				redirect '/board'
			else
				redirect '/make_move'
			end
		end

	end

	get '/clear_sessions' do

		if session[:active_player] == nil

		redirect '/'
		else
		end


	
		session[:board] = nil
		session[:active_player] = nil
		session[:human1] = nil
		session[:human2] = nil
		session[:player1_type] = nil
		session[:player2_type] = nil

		session[:name1] = nil
		session[:name2] = nil

		redirect '/'

	end

# 	require "sinatra"
# require_relative "play_console_game.rb"
# require 'aws-sdk'
# load './local_env.rb' if File.exist?('./local_env.rb')
# Aws.use_bundled_cert!

# get '/' do
# erb :pick_player
# end 

# get '/pick_character' do
# erb :pick_player
# end


# post '/pick_character' do
# session[:p1] = params[:p1]
# w1 = session[:p1]
# session[:p2] = params[:p2]
# w2 = session[:p2]



# game = Web_game.new
# redirect '/isbn_out?isbn_done=' + isbn_done.to_s + '&isbn_data=' + isbn_data.to_s
# end 



# until game.check_winner || game.board.full_board?

# 	# game.display_board
# 	game.change_player
# 	game.update_board
# <script type="text/javascript">
# document.write ('<p><span id="date-time">', new Date().toLocaleString(), '<\/span>.<\/p>')
# if (document.getElementById) onload = function () {
#     setInterval ("document.getElementById ('date-time').firstChild.data = new Date().toLocaleString()", 50)
# }
# </script>