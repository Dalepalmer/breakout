class Level

  attr_reader :blocks

  PADDING = 10

  def initialize
    @blocks = []
    x = PADDING
    y = 5

    while (x + Block::WIDTH) < World::WIDTH
      @blocks << Block.new(x, y)
      x += (Block::WIDTH + PADDING)
    end
  end

  def hit?(ball)
    if ball.x <= 0
      return true
    end

    if ball.y <= 0
      return true
    end

    if ball.x >= World::WIDTH
      return true
    end

    blocks.detect do |b|
      result = b.hit?(ball)
      if result
        # block disappears
        blocks.delete(b)
      end
      result
    end
  end

  def won?
    blocks.empty?
  end

  def draw(window)
    blocks.each { |bl| bl.draw(window) }
  end

end
