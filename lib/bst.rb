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
      node.left = BinarySearchTree.insert!(node.left, value)
    else
      node.right = BinarySearchTree.insert!(node.right, value)
    end

    node
  end

  def self.find!(node, value)
    return nil unless node
    return node if node.value == value

    if value < node.value
      return BinarySearchTree.find!(node.left, value)
    else
      return BinarySearchTree.find!(node.right, value)
    end
  end

  def self.preorder!(node)
    return [node.value] unless node

    result = [node.value]
    result += BinarySearchTree.preorder!(node.left) if node.left
    result += BinarySearchTree.preorder!(node.right) if node.right

    result
  end

  def self.inorder!(node)
    return [node.value] unless node

    result = []
    result += BinarySearchTree.preorder!(node.left) if node.left
    result += [node.value]
    result += BinarySearchTree.preorder!(node.right) if node.right

    result
  end

  def self.postorder!(node)
    return [node.value] unless node

    result = []
    result += BinarySearchTree.postorder!(node.left) if node.left
    result += BinarySearchTree.postorder!(node.right) if node.right
    result += [node.value]
  end

  def self.height!(node)
    return -1 unless node

    1 + [BinarySearchTree.height!(node.left),
         BinarySearchTree.height!(node.right)].max
  end

  def self.max(node)
    return node if node.right == nil
    BinarySearchTree.max(node.right)
  end

  def self.min(node)
    return node if node.left == nil
    BinarySearchTree.min(node.left)
  end

  def self.delete_min!(node)

  end

  def self.delete!(node, value)

  end
end
