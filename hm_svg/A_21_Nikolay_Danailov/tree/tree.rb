require_relative 'tree_node.rb'

class Tree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def generate_from_json(element, depth = 0, current_ancestor = @root, is_leaf = false)
    if element.class == Hash
      if element.values.any? { |e| e.class == Array }
        element.each do |key, value|
          current_ancestor = generate_from_json value, depth, current_ancestor
        end
      else
        generate_from_json element.values.first, depth, current_ancestor, true
      end
    elsif element.class == Array
      element.each do |e|
        generate_from_json e, depth + 1, current_ancestor
      end
    else
      if depth == 0
        @root = TreeNode.new element
        current_ancestor = @root
      else
        current_ancestor = TreeNode.new element, current_ancestor
      end
    end
  end

  def get_elements_with_depth(depth, result_elements = [], node = @root)
    result_elements << node if node.depth == depth

    node.descendants.each do |desc|
      result_elements = get_elements_with_depth(depth, result_elements, desc)
    end

    result_elements
  end

  def print_tree(node = @root)
    puts "#{' ' * node.depth}#{node.value}"

    if node.descendants.size > 0
      node.descendants.each { |descendant| print_tree descendant }
    end
  end
end