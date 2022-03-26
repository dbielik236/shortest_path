class Node
    attr_accessor :location
    attr_accessor :value
    attr_accessor :parent
      
      def initialize(location)
        @location=location
        @value=0
      end
    end

class Board

    def initialize
    @grid=Hash[
      
      Node.new([1,1])=>[1,1],
      Node.new([1,2])=>[1,2],
      Node.new([1,3])=>[1,3],
      Node.new([1,4])=>[1,4],
      Node.new([1,5])=>[1,5],
      Node.new([1,6])=>[1,6],
      Node.new([1,7])=>[1,7],
      Node.new([1,8])=>[1,8],
      
      
      Node.new([2,1])=>[2,1],
      Node.new([2,2])=>[2,2],
      Node.new([2,3])=>[2,3],
      Node.new([2,4])=>[2,4],
      Node.new([2,5])=>[2,5],
      Node.new([2,6])=>[2,6],
      Node.new([2,7])=>[2,7],
      Node.new([2,8])=>[2,8],
      
      
      Node.new([3,1])=>[3,1],
      Node.new([3,2])=>[3,2],
      Node.new([3,3])=>[3,3],
      Node.new([3,4])=>[3,4],
      Node.new([3,5])=>[3,5],
      Node.new([3,6])=>[3,6],
      Node.new([3,7])=>[3,7],
      Node.new([3,8])=>[3,8],
    
      
      Node.new([4,1])=>[4,1],
      Node.new([4,2])=>[4,2],
      Node.new([4,3])=>[4,3],
      Node.new([4,4])=>[4,4],
      Node.new([4,5])=>[4,5],
      Node.new([4,6])=>[4,6],
      Node.new([4,7])=>[4,7],
      Node.new([4,8])=>[4,8],
      
      
      Node.new([5,1])=>[5,1],
      Node.new([5,2])=>[5,2],
      Node.new([5,3])=>[5,3],
      Node.new([5,4])=>[5,4],
      Node.new([5,5])=>[5,5],
      Node.new([5,6])=>[5,6],
      Node.new([5,7])=>[5,7],
      Node.new([5,8])=>[5,8],
      
      
      Node.new([6,1])=>[6,1],
      Node.new([6,2])=>[6,2],
      Node.new([6,3])=>[6,3],
      Node.new([6,4])=>[6,4],
      Node.new([6,5])=>[6,5],
      Node.new([6,6])=>[6,6],
      Node.new([6,7])=>[6,7],
      Node.new([6,8])=>[6,8],
      
      
      Node.new([7,1])=>[7,1],
      Node.new([7,2])=>[7,2],
      Node.new([7,3])=>[7,3],
      Node.new([7,4])=>[7,4],
      Node.new([7,5])=>[7,5],
      Node.new([7,6])=>[7,6],
      Node.new([7,7])=>[7,7],
      Node.new([7,8])=>[7,8],
      
      
      Node.new([8,1])=>[8,1],
      Node.new([8,2])=>[8,2],
      Node.new([8,3])=>[8,3],
      Node.new([8,4])=>[8,4],
      Node.new([8,5])=>[8,5],
      Node.new([8,6])=>[8,6],
      Node.new([8,7])=>[8,7],
      Node.new([8,8])=>[8,8]]
    end
    
    def in_bounds?(node)
      row, column=node.location 
      row>=1&&column>=1&&row<=8&&column<=8&&node.value==0
    end
  
    def possible_moves(node)
      row, column=node.location
  
      poss=[]
      if @grid.index([row+2,column+1])
      a=@grid.index([row+2,column+1])
      unless a.parent
      a.parent=node
      end
      poss<<a
      end
  
      if @grid.index([row+2,column-1])
      b=@grid.index([row+2,column-1])
      unless b.parent
      b.parent=node
      end
      poss<<b
      end
  
      if @grid.index([row+1,column+2])
      c=@grid.index([row+1,column+2])
      unless c.parent
      c.parent=node
      end
      poss<<c
      end
      
      if @grid.index([row+1,column-2])
      d=@grid.index([row+1,column-2])
      unless d.parent
      d.parent=node
      end
      poss<<d
      end
  
      if @grid.index([row-2,column+1])
      e=@grid.index([row-2,column+1])
      unless e.parent
      e.parent=node
      end
      poss<<e
      end
  
      if @grid.index([row-2,column-1])
      f=@grid.index([row-2,column-1])
      unless f.parent
      f.parent=node
      end
      poss<<f
      end
  
      if @grid.index([row-1,column+2])
      g=@grid.index([row-1,column+2])
      unless g.parent
      g.parent=node
      end
      poss<<g
      end
      
      if @grid.index([row-1,column-2])
      h=@grid.index([row-1,column-2])
      unless h.parent
      h.parent=node
      end
      poss<<h
      end
      poss
    end
  
    def search(start, target)
      queue=[]
      starting_node=@grid.index(start)
      queue.push(starting_node)
      starting_node.value=1
      until queue[0]==@grid.index(target)
        current=queue[0]
        poss=possible_moves(current)
        poss.each do |item|
          if item.value==0
            item.value=1
          queue.push(item)
          end
        end
        current.value=1
        queue.shift()
      end
      node=queue[0]
      path=[]
      until node.location==start
        path.prepend(node.location)
        node=node.parent
      end
      puts "You made it in #{path.length} moves. Here's your path!"
      puts "Starting point: #{node.location}"
      puts "Moves:"
      path.each do |location|
        p location
      end
    end  
  end
  
board=Board.new
  
board.search([3,3],[4,4])