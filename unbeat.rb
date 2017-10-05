
require_relative 'console_game.rb'



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

      @edges = [1, 5, 7, 3]

      # spaces on board that will win
      @winning_spaces = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

      # spaces on board that will create a fork
      @fork_spaces = [[0, 2, 8], [2, 8, 6], [8, 6, 0], [6, 0, 2], [1, 2, 5], [5, 8, 7], [7, 6, 3], [3, 0, 1]]

      # Order in which we should check for wins/forks
      @priorities = [[0, 1, 2], [0, 2, 1], [1, 2, 0]]



      
      def next_move
        attack || block || create_fork || force_defend || block_fork || center || opposite_corner || empty_corner || empty_edge
      end

      def attack
        winning_move @marker
      end

      def block
        winning_move OPPONENT
      end

      def create_fork
        fork_move(@marker)
      end

      def block_fork
        fork_move(OPPONENT)
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

      def force_defend
        DIAGONALS.each do |position|
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

      def empty_edge
        while true
          space = EDGES[rand(4)]
          return space if @board.space_available? space
        end
      end

      def fork_move(player)
        FORK_SPACES.each do |space|
          PRIORITIES.each do |priority|
            # If player is in 2 of 3 fork spaces
            if (@board.tiles[space[priority[0]]] == player) && (@board.tiles[space[priority[1]]] == player)
              # Check if final winning space is available
              next_space = space[priority[2]]
              return next_space if @board.space_available? next_space
            end
          end
        end
        nil
      end

      def winning_move(player)
        winning_spaces.each do |space|
          priorities.each do |priority|
            # If player is in 2 of 3 winning spaces
            if (@board. == player) && (@board.tiles[space[priority[1]]] == player)
              # Check if final winning space is available
              next_space = space[priority[2]]
              return next_space if @board.space_available? next_space
            end
          end
        end
        nil
      end
    end
  end
p '#{marker}'