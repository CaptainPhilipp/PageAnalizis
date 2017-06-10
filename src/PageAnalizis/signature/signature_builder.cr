require "./strategies/*"
require "./signature"

module PageAnalizis
  # gradually builds signature, using changing strategies
  class SignatureBuilder
    def initialize(@options : OptionsContainer) end

    def build(*, for node) : Signature?
      signature = Signature.new

      strategies.each do |strategy_klass|
        strategy = strategy_klass.new(options)
        strategy.scan node, save_into: signature

        return signature if strategy.failed? && irrelevant!(signature)
      end

      signature
    end

    private def strategies
      [ElementStrategy, ChildrenStrategy, DescendantStrategy, DataStrategy]
    end

    private def irrelevant!(signature : Signature)
      signature.irrelevant = true
    end
  end
end
