class PageAnalizis
  # facade for document parsing
  class Parser
    def self.parse(html : String)
      new(XML.parse html)
    end

    def initialize(@node : XML::Node) end

    def attributes
      @node.attributes
    end

    def each_children
      @node.children.each { |child| yield(self.class.new child) }
    end

    def each_descendant
      @node.descendant.each { |child| yield(self.class.new child) }
    end

    def attribute_values(attr : String)
      attributes = @node.attributes
      return [] of String unless attributes[attr]?

      attributes[attr].to_s =~ /\A\s?#{attr}="([a-z\s-0-9_]*)"\z/i
      results = $1.split(" ")
      results && results.any? ? results : [] of String
    end
  end
end
