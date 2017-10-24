

require "minitest/autorun"
require_relative "unbeat.rb"
require_relative 'board.rb'

class TestTicTac < Minitest::Test
      
      def test_opp
      b_v = Unbeat.new('X')
      assert_equal('O', b_v.get_opponent("X") )
      end

      def test_opp_2
      b_v = Unbeat.new('O')
      assert_equal('X', b_v.get_opponent("O") )
      end

      def test_win_block
      bv = b_v = Unbeat.new('X')
      assert_equal(2, b_v.get_win_or_block(['X','X','','','','','','',''], "X"))
      end

      def test_win_block_2
      bv = b_v = Unbeat.new('X')
      assert_equal(5, b_v.get_win_or_block(['','','','X','X','','','',''], "X"))
      end

      def test_win_block_3
      bv = b_v = Unbeat.new('X')
      assert_equal(4, b_v.get_win_or_block(['','X','','X','','X','','',''], "X"))
      end

       def test_fork_block
      bv = b_v = Unbeat.new('X')
      assert_equal(6, b_v.get_fork_or_block(['X','','X','','','','','',''], "X"))
      end

      def test_fork_block_2
      bv = b_v = Unbeat.new('X')
      assert_equal(1, b_v.get_fork_or_block(['X','','','X','','','','',''], "X"))
      end

      def test_fork_block_3
      bv = b_v = Unbeat.new('O')
      assert_equal(6, b_v.get_fork_or_block(['','','','O','','','','O',''], "O"))
      end

      def test_edge
       b_v = Unbeat.new('O')
      assert_equal(1, b_v.get_edge(['','','','','','','','','']))
      end


      def test_edge_2
       b_v = Unbeat.new('O')
      assert_equal(3, b_v.get_edge(['','X','','','','','','','']))
      end

      def test_edge_3
      b_v = Unbeat.new('O')
      assert_equal(7, b_v.get_edge(['','X','','X','','X','','','']))
      end

       def test_corn
       b_v = Unbeat.new('O')
      assert_equal(0, b_v.get_corner(['','','X','','','','','','']))
      end


      def test_corn_2
       b_v = Unbeat.new('O')
      assert_equal(6, b_v.get_corner(['O','X','O','','','','','','']))
      end

      def test_corn_3
      b_v = Unbeat.new('O')
      assert_equal(8, b_v.get_corner(['0','X','O','X','O','','O','','']))
      end

      def test_force
      b_v = Unbeat.new('X')
      assert_equal('O', b_v.get_opponent("X") )
      assert_equal(1, b_v.get_force_def(['X','','','','O','','','','O'],"X","O"))
      end


end