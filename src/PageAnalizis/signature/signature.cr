module PageAnalizis
  # stores signature data
  struct Signature
    property :depth, :names, :ids, :classes
    property? :irrelevant

    def initialize
      depth   = 0
      names   = [] of String
      ids     = [] of String
      classes = [] of String

      @irrelevant = false
    end
  end
end
