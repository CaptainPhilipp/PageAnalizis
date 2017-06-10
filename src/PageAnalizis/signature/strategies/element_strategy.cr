module PageAnalizis
  class ElementStrategy < SignatureStrategy
    def scan(node, **, save_into signature)
      save_results(node, into: signature)
    end
  end
end
