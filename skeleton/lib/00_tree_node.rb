require "byebug"

class PolyTreeNode
    attr_reader :children, :value, :parent

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(dad)
        self.parent.children.delete(self) if !self.parent.nil?
        @parent = dad
        dad.children << self unless dad.nil?   
    end   

    def add_child(child)
        child.parent = self
    end 

    def remove_child(node)
       raise "error" if node.parent == nil
        node.parent = nil
    end 

    def dfs(target)
        return nil if self.value == nil
        return self if self.value == target
        

        children.each do |child|
            search_result = child.dfs(target)
            return search_result unless search_result.nil?
        end
        nil
    end

    def bfs(target)
        queue = [self] 
        until queue.empty?
            el = queue.shift
            if el.value == target
                return el
            else
                el.children.each {|child| queue << child }
            end
        end
        nil
    end
end



