require "./strategy"

class PageAnalizis
  # saves only current node childrens attributes
  class ChildrenStrategy < SignatureStrategy
    def scan(node, *, save_into signature)
      node.each_children do |child|
        save_results(node, into: signature)
      end
    end
  end
end
