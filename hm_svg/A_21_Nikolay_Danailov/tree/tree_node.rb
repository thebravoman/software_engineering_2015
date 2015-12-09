# Represents a node from the tree
class TreeNode
  attr_accessor :value
  attr_accessor :depth
  attr_accessor :ancestor
  attr_accessor :descendants
  attr_accessor :index

  def initialize(value, ancestor = nil, descendants = [])
    @value = value
    @depth = 0
    @ancestor = ancestor
    @descendants = descendants
    @index = 0

    unless ancestor.nil?
      @depth = ancestor.depth + 1
      ancestor.descendants << self unless ancestor.descendants.include?(self)
      @index = Hash[ancestor.descendants.map.with_index.to_a][self]
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
