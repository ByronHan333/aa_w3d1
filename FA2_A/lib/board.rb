class Board

    attr_reader :size

    def initialize(size)
        @size = size
        @grid = Array.new(@size) {Array.new(@size)}
    end


    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, mark)
        row,col = pos
        @grid[row][col] = mark
    end

    def complete_row?(mark)
        return @grid.any? do |row|
            row.all? {|el| el == mark}
        end
    end

    def complete_col?(mark)
        (0...@size).each do |idx|
            return true if @grid.all? {|row| row[idx] == mark}
        end
        false
    end

    def complete_diag?(mark)
        left = (0...@size).all?{|i| self[[i,i]]==mark}
        right = (0...@size).all?{|i| self[[i,@size-1-i]]==mark}
        left || right
    end

    def winner?(mark)
        complete_col?(mark) || complete_row?(mark) || complete_diag?(mark)

        # completed = false
        # @grid.each do |row|
        #     completed = true if row.all?{|el| el==mark}
        # end
        # (0...@size).each do |idx|
        #     completed = true if @grid.all? {|row| row[idx] == mark}
        # end
        # completed = true if (0...@size).all?{|i| self[[i,i]]==mark}
        # completed = true if (0...@size).all?{|i| self[[i,@size-1-i]]==mark}

        # if completed
        #     return boo
        # end

        # false
    end
end
