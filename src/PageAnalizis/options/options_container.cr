module PageAnalizis
  # complex structured container for options
  class OptionsContainer
    def self.parse(hash : OptionsHash)
      raise 'TODO' # TODO
    end

    def self.parse(json : String)
      hash = JSON.parse(json).to_h
      parse(hash)
    end
  end
end
