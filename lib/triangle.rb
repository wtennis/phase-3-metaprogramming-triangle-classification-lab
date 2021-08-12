class Triangle
attr_reader :side1, :side2, :side3, :perim


    def initialize(side1, side2, side3)
      @side1 = side1
      @side2 = side2
      @side3 = side3
      @perim = [side1, side2, side3]
    end

    def kind
      # if @perim.inject(0, :+) != 180
      #   raise TriangleError
      if @perim.any? { |side| side <= 0 }
        raise TriangleError
      elsif @side1 + @side2 <= @side3
        raise TriangleError
      elsif @side2 + @side3 <= @side1
        raise TriangleError
      elsif @side1 + @side3 <= @side2
        raise TriangleError
      elsif @perim.detect{ |side| @perim.count(side) == 3 }
        :equilateral
      elsif @perim.detect{ |side| @perim.count(side) == 2 }
        :isosceles
      else :scalene
      end
    end
   

    class TriangleError < StandardError
      def message
        "wack triangle, yo"
      end
    end

end
