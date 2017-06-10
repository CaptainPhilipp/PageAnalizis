require "./page_analizis/common/aliaces"
require "./page_analizis/options/options_container"
require "./page_analizis/parser/parser"
require "./page_analizis/sequence_finder"

class PageAnalizis
  def initialize(options)
    options = OptionsContainer.parse(options)
    @sequence_finder = SequenceFinder.new(options)
    @parser = Parser
  end

  def self.parse(html)
    document = parser.parse html
    @sequence_finder.search in: document
  end

  private getter :parser
end
