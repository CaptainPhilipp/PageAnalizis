module PageAnalizis
  class Document
    def initialize(options)
      @sequence = SequenceFinder.new(options)
    end

    def parse(html : String)
      node = Parser.parse(html)
      traverse_tree(node)
    end

    private reader :sequence, :options

    private def traverse_tree(node)
      if sequence.scan(node)
        # TODO
      else
        node.each_children { |child| traverse_tree(child) }
      end
    end
  end
end
