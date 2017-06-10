require "./PageAnalizis/options/options_container"
require "./PageAnalizis/parser/parser"
require "./PageAnalizis/sequence_finder"

module PageAnalizis
  def self.parse(html, imported_options)
    options = OptionsContainer.parse imported_options
    doc     = Parser.parse html
    SequenceFinder.new(options).search in: doc
  end
end
