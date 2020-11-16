require "byebug"

require_relative "00_tree_node.rb"

class KnightPathFinder 

    attr_reader :root_node

    MOVES =[
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
        @considered_positions = [@pos]
        self.build_move_tree
    end

    def build_move_tree # remove first move position
       queue = [@root_node]
        until queue.empty?
            el = queue.shift
            new_move_positions(el.value).each do |move|
                child = PolyTreeNode.new(move)
                child.parent = el
                queue << child
            end      
        end 
    end

    def new_move_positions(pos)
        new_move_pos = []
        # debugger
        valid_move = KnightPathFinder.valid_moves(pos)
        # debugger
        valid_move.each do |move|
            # debugger
            if !@considered_positions.include?(move)
                new_move_pos << move
                @considered_positions << move  
            end
        end
        new_move_pos           
    end

    def self.valid_moves(pos)
        valid_moves = []
        x, y = pos
        MOVES.each do |move|   
            if (x + move[0]) >= 0 && (x + move[0]) <= 7
                 new_x = x + move[0]
                if (y + move[1]) >= 0 && (y + move[1]) <= 7
                    new_y = y + move[1]
                    valid_moves << [new_x, new_y] 
                end
            end
        end
        valid_moves
    end

    def find_path(end_pos)
        end_node = @root_node.dfs(end_pos)

        trace_path_back(end_node).reverse.map do |pos|
            pos.value
        end
    end

    def trace_path_back(end_node)
        queue = []
        until end_node.nil?
            queue << end_node
            end_node = end_node.parent
        end
        queue
    end
end

# first_move = KnightPathFinder.new([0,0])
# p first_move.find_path([6, 2])
# p KnightPathFinder.valid_moves([0, 0])

# p first_move.new_move_positions([0, 0])
kpf = KnightPathFinder.new([0, 0])


p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]
