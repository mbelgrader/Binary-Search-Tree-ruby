require 'byebug'

class BSTNode
  attr_accessor :left, :right
  attr_reader :value

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinarySearchTree
  def initialize
    @root = nil
  end

  def insert(value)
    if @root == nil
      @root = BSTNode.new(value)
    else
      BinarySearchTree.insert!(@root, value)
    end
  end

  def find(value)
    BinarySearchTree.find!(@root, value)
  end

  def inorder
    BinarySearchTree.inorder!(@root)
  end

  def postorder
    BinarySearchTree.postorder!(@root)
  end

  def preorder
    BinarySearchTree.preorder!(@root)
  end

  def height
    BinarySearchTree.height!(@root)
  end

  def min
    BinarySearchTree.min(@root)
  end

  def max
    BinarySearchTree.max(@root)
  end

  def delete(value)
    @root = BinarySearchTree.delete!(@root, value)
  end

  def self.insert!(node, value)
    return BSTNode.new(value) unless node

    if value < node.value
      node.left = self.insert!(node.left, value)
    else
      node.right = self.insert!(node.right, value)
    end

    node
  end

  def self.find!(node, value)
    return nil unless node
    return node if node.value == value

    if value < node.value
      return self.find!(node.left, value)
    else
      return self.find!(node.right, value)
    end
  end

  def self.preorder!(node)
    return [node.value] unless node

    result = [node.value]
    result += self.preorder!(node.left) if node.left
    result += self.preorder!(node.right) if node.right

    result
  end

  def self.inorder!(node)
    return [node.value] unless node

    result = []
    result += self.preorder!(node.left) if node.left
    result += [node.value]
    result += self.preorder!(node.right) if node.right

    result
  end

  def self.postorder!(node)
    return [node.value] unless node

    result = []
    result += self.postorder!(node.left) if node.left
    result += self.postorder!(node.right) if node.right
    result += [node.value]
  end

  def self.height!(node)
    return -1 unless node

    1 + [self.height!(node.left),
         self.height!(node.right)].max
  end

  def self.max(node)
    return node if node.right == nil
    self.max(node.right)
  end

  def self.min(node)
    return node if node.left == nil
    self.min(node.left)
  end

  def self.delete_min!(node)
    return nil unless node
    return node.right unless node.left

    node.left = self.delete_min!(node.left)
    node
  end

  def self.delete!(node, value)
    return nil unless node

    if value > node.value
      node.right = self.delete!(node.right, value)
    elsif value < node.value
      node.left = self.delete!(node.left, value)
    else
      return node.right if node.left == nil
      return node.left if node.right == nil

      target = node
      node = target.left.max
      node.left = self.delete_min!(target.left)
      node.right = target.right
    end

    node
  end

end
