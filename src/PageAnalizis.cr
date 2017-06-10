require "./PageAnalizis/*"

module PageAnalizis
  def self.parse(html : String, imported_options : OptionsHash | String)
    options  = OptionsContainer.parse imported_options
    doc = Parser.parse(html)
    SequenceFinder.new(options).search in: doc
  end
end
