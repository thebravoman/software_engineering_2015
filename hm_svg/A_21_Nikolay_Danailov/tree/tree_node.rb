class TreeNode
  attr_accessor :value
  attr_accessor :depth
  attr_accessor :ancestor
  attr_accessor :descendants

  def initialize(value, ancestor = nil, descendants = [])
    @value = value
    @depth = 0
    @ancestor = ancestor
    @descendants = descendants

    if ancestor != nil 
      @depth = ancestor.depth + 1

      if !ancestor.descendants.include?(self)
        ancestor.descendants << self
      end
    end

    if descendants.size > 0
      @depth = descendants.first.depth - 1
      descendants.each { |descendant| descendant.ancestor = self }
    end
  end

  def leaf?
    descendants.size == 0
  end
end