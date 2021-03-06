require "../../reviewer/signature_reviewer"

class PageAnalizis
  # process every step of gradually signature building
  abstract class SignatureStrategy
    getter? :failed

    def initialize(options)
      @reviewer = SignatureReviewer.new(options)
      @failed = false
    end

    def scan(_node, *, save_into signature)
      raise NotImplementedError
    end

    protected def save_results(node, *, into signature) : Void
      signature.depth   += 1
      signature.names   << node.name
      signature.ids     += node.attribute_values("id")
      signature.classes += node.attribute_values("class")

      failed! if reviewer.review signature
    end

    private getter :reviewer

    private def failed!
      @failed = true
    end
  end
end
