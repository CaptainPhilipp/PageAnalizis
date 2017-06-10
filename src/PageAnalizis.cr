require "./PageAnalizis/*"

module PageAnalizis
  def self.parse(html : String, options : OptionsHash | String)
    options  = OptionsContainer.parse(options)
    document = Document.new(options)
    document.parse(html)
  end
end
