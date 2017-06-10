module PageAnalizis
  class SequenceFinder
    def initialize(options)
      @signature_set     = SignatureSet.new(options)
      @signature_builder = SignatureBuilder.new(options)
    end

    private getter :signature_set, :signature_builder

    def scan(node) : Bool
      node.each_children do |child_node|
        signature = signature_builder.build(child_node)
        return false if signature.irrelevant?

        signature_set << signature
        return false if signature_set.irrelevant?
      end

      true
    end
  end
end
