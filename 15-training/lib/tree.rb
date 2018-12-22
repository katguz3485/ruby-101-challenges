class Tree

  #tree

  def tree_draw(n)
    range = 1..n
    string = "*"
    range.step(2) {|x| puts (string * x).center(11)}
  end


  tree_drawer = Tree.new
  tree_drawer.tree_draw(10)


end