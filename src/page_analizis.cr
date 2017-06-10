require "./page_analizis/options/options_container"
require "./page_analizis/parser/parser"
require "./page_analizis/sequence_finder"

module PageAnalizis
  def self.parse(html, imported_options)
    options = OptionsContainer.parse imported_options
    doc     = Parser.parse html
    SequenceFinder.new(options).search in: doc
  end
end
