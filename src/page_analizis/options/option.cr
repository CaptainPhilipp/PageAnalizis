module PageAnalizis
  # parse and store option params
  class Option
    getter  key             : String,
            option_name     : String,
            size_trigger    : Bool,
            diff_trigger    : Bool,
            compare_trigger : Symbol

    def initialize(@key, value : Int32)
      @size_trigger    = exarticulate trigger: "size"
      @diff_trigger    = exarticulate trigger: "diff"
      @compare_trigger = min_max_symbols[exarticulate triggers: %w(min max)]
      @option_name     = exarticulate_the_rest
    end

    private def exarticulate(*, trigger : String) : Bool
      return false unless splited_key.includes?(trigger)
      splited_key.delete(trigger)
      true
    end

    private def exarticulate(*, triggers : Strings) : String
      trigger = (splited_key & triggers).first

      exarticulate(trigger: trigger)
      trigger
    end

    private def splited_key
      @splited_key ||= key.split(' ').as Strings?
    end

    private def min_max_symbols
      { "min" => :min, "max" => :max }
    end

    private def exarticulate_the_rest
      joined = splited_key.join('_')
      splited_key.clear
      joined
    end
  end
end
