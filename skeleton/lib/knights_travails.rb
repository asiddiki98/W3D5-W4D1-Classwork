require_relative "00_tree_node.rb"

class KnightPathFinder 

    attr_reader :root_node

    MOVE =[
        [ 2,  1],
        [ 2, -1],
        [-2,  1],
        [-2, -1],
        [ 1,  2],
        [-1,  2],
        [ 1, -2],
        [-1, -2]
    ] # 8 possible moves
    
    def initialize(pos)
        @pos = pos
        @root_node = PolyTreeNode.new(pos)
        self.build_move_tree
        @considered_positions = [pos]
    end

    def build_move_tree
        @root_node
    end

    
    def self.valid_moves(pos)
        moves = []
        x, y = pos
        MOVES.each do |x1, y1|
            new_pos = [x + x1, y + y1]
            
            new_pos.each do |ele|  # ele = [x,y]
                #check to make sure ele is >=0 and <=7

            end
        end
    end
end

first_move = KnightPathFinder.new([5,0])
first_move.render
