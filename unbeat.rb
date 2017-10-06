
class Unbeat
  attr_accessor :marker, :opponent, :center, :corners, :opposite_corners, :diagonals, :edges, :winning_spaces, :fork_spaces, :priorities

def get_opponent(marker)
        opponent = 'X'

        if 
            @marker == 'X'
            opponent = 'O'
        
        else
            opponent = 'X'
        end
        opponent
    end

  def initialize(marker)
      @marker = marker
      
      @opponent = get_opponent(marker)

      @center = 4

      @corners = [0, 2, 6, 8]

      @opposite_corners = { 0 => 8, 8 => 0, 2 => 6, 6 => 2}

      @diagonals = [[0, 4, 8], [2, 4, 6]]

      @edge_spaces = [[1, 5, 7, 3]]

      # spaces on board that will win
      @winning_spaces = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

      # spaces on board that will create a fork
      @fork_spaces = [[0, 2, 8], [2, 8, 6], [8, 6, 0], [6, 0, 2], [1, 2, 5], [5, 8, 7], [7, 6, 3], [3, 0, 1]]

      # Order in which we should check for wins/forks
      @priorities = [[0, 1, 2], [0, 2, 1], [1, 2, 0]]



   def get_win_or_block(ttt_board, player)

        possible_winning_combos_on_board = [
      [ttt_board[0], ttt_board[1], ttt_board[2]],
      [ttt_board[3], ttt_board[4], ttt_board[5]],
      [ttt_board[6], ttt_board[7], ttt_board[8]],
      [ttt_board[0], ttt_board[3], ttt_board[6]],
      [ttt_board[1], ttt_board[4], ttt_board[7]],
      [ttt_board[2], ttt_board[5], ttt_board[8]],
      [ttt_board[0], ttt_board[4], ttt_board[8]],
      [ttt_board[2], ttt_board[4], ttt_board[6]]
        ]
        
        possible_winning_combos = winning_spaces

        move = nil

        possible_winning_combos_on_board.each_with_index do |winning_combo_line, index_position_of_winning_array_set|
            if winning_combo_line.count(player) == 2 && winning_combo_line.count('') == 1
                winning_empty_space = winning_combo_line.index('')
                move = possible_winning_combos[index_position_of_winning_array_set][winning_empty_space]
            else
                move
            end
        end
        move
    end
      
      def next_move
        attack || block || create_fork || force_defend || block_fork || center || opposite_corner || empty_corner || empty_edge
      end

      def attack
        if get_win_or_block(@board.ttt_board, @marker) == nil 
        nil
        else
        ttt_board[get_win_or_block] = marker 
      end
      end

      def block
        get_win_or_block(ttt_board, opponent)
      end

      def create_fork
        get_fork_or_block(ttt_board, marker)
      end

      def block_fork
        fork_move(ttt_board, opponent)
      end

      def center
        return CENTER if @board.space_available? CENTER
      end

      def opposite_corner
        CORNERS.each do |corner|
          if @board.tiles[corner] == OPPONENT
            opposite = OPPOSITE_CORNERS[corner]
            return opposite if @board.space_available? opposite
          end
        end
        nil
      end

      # def force_def(ttt_board, player, opponent)
      #    possible_def_combos = diagonals

      #   possible_def_combos_on_board.each_with_index do |winning_combo_line, index_position_of_winning_array_set|
      #       if winning_combo_line.count(player) == 1 winning_combo_line.count(opponent) == 1 && winning_combo_line.count('') == 1
      #           winning_empty_space = winning_combo_line.index('')
      #           move = possible_def_combos[index_position_of_winning_array_set][winning_empty_space]
      #       else
      #           move
      #       end
      #   end
      #   move

      def force_defend
        diagonals.each do |position|
          if @board.tiles[position[0]] == OPPONENT && @board.tiles[position[1]] == @marker && @board.tiles[position[2]] == OPPONENT
            return empty_edge
          end
        end
        nil
      end

      def empty_corner
        while true
          space = CORNERS[rand(4)]
          return space if @board.space_available? space
        end
      end


        
 def get_edge(ttt_board)
        if 
            ttt_board[1] == ''
            move = 1

        elsif 
            ttt_board[3] == ''
            move = 3

        elsif 
            ttt_board[5] == ''
            move = 5
        
        elsif 
            ttt_board[7] == ''
            move = 7

        else 
            move = nil
        end
        move
    end

 def get_corner(ttt_board)
        if 
            ttt_board[0] == ''
            move = 0

        elsif 
            ttt_board[2] == ''
            move = 2

        elsif 
            ttt_board[6] == ''
            move = 6
        
        elsif 
            ttt_board[8] == ''
            move = 8

        else 
            move = nil
        end
        move
    end


def get_fork_or_block(ttt_board, player)

        possible_fork_combos_on_board = [
      [ttt_board[0], ttt_board[2], ttt_board[8]],
      [ttt_board[2], ttt_board[8], ttt_board[6]],
      [ttt_board[8], ttt_board[6], ttt_board[0]],
      [ttt_board[6], ttt_board[0], ttt_board[2]],
      [ttt_board[1], ttt_board[2], ttt_board[5]],
      [ttt_board[5], ttt_board[8], ttt_board[7]],
      [ttt_board[7], ttt_board[6], ttt_board[3]],
      [ttt_board[3], ttt_board[0], ttt_board[1]]
        ]
        possible_fork_combos = fork_spaces
          
        move = nil

        possible_fork_combos_on_board.each_with_index do |winning_combo_line, index_position_of_winning_array_set|
            if winning_combo_line.count(player) == 2 && winning_combo_line.count('') == 1
                winning_empty_space = winning_combo_line.index('')
                move = possible_fork_combos[index_position_of_winning_array_set][winning_empty_space]
            else
                move
            end
        end
        move
    end


end
end