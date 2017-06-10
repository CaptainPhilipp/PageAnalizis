require "./page_analizis/options/options_container"
require "./page_analizis/parser/parser"
require "./page_analizis/sequence_finder"

class PageAnalizis
  def initialize(html, imported_options)
    options = OptionsContainer.parse imported_options
    doc     = Parser.parse html
    SequenceFinder.new(options).search in: doc
  end

  def self.parse(*args)
    new(*args)
  end
end
