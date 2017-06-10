module PageAnalizis
  class DescendantStrategy < SignatureStrategy
    def scan(node, **, save_into signature)
      node.each_children do |child|
        child.each_descendant do |descendant|
          save_results(descendant, into: signature)
        end
      end
    end
  end
end
