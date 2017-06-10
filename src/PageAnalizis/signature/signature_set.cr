module PageAnalizis
  # builds and store set of signatures
  class SignatureSet
    getter :set, :collection
    getter? :irrelevant

    def initialize(options)
      reviewer = SignatureSetReviewer.new(options)
      collection = [] of Signature
      set = [] of Signature
      @irrelevant = false
    end

    def <<(signature : Signature)
      if can_add?(signature)
        set << signature
        collection << signature
      elsif have_resembling?(signature)
        collection << signature
      else
        irrelevant!
      end
      set
    end

    private def can_add?(signature)
      reviewer.free_place_exists?(in: set)
    end

    private def have_resembling?(signature)
      reviewer.resembling_exists?(like: signature, in: set)
    end

    private def irrelevant!
      @irrelevant = true
    end
  end
end
