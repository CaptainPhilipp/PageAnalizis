require "./signature/signature_set"
require "./signature/signature_builder"

class PageAnalizis
  # traverse tree of node, searching relevant group of sibblings
  class SequenceFinder
    def initialize(options)
      @signature_set     = SignatureSet.new(options)
      @signature_builder = SignatureBuilder.new(options)
    end

    def search(*, in node : Parser)
      if scan(node)
        # TODO
      else
        node.each_children { |child| traverse_tree(child) }
      end
    end

    private def scan(node)
      node.each_children do |child_node|
        signature = signature_builder.build for: child_node
        return false if signature.irrelevant?

        signature_set << signature
        return false if signature_set.irrelevant?
      end

      true
    end
  end
end
