class PageAnalizis
  # parse and store option params
  class Option
    getter  key             : String,
            option_name     : String,
            size_trigger    : Bool,
            diff_trigger    : Bool,
            compare_trigger : Symbol

    def initialize(@key, value : Int32)
      @size_trigger    = exarticulate_trigger("size") && true
      @diff_trigger    = exarticulate_trigger("diff") && true
      @compare_trigger = exarticulate_compare_trigger
      @option_name     = exarticulate_the_rest
    end

    private def exarticulate_trigger(trigger : String)
      trigger if splited_key.includes? trigger
    end

    private def exarticulate_trigger(*triggers)
      (splited_key & triggers).first
    end

    private def splited_key
      @splited_key ||= key.split(' ')
    end

    private def exarticulate_compare_trigger : String?
      min_or_max = exarticulate_trigger("min", "max")
      { "min" => :min, "max" => :max }[min_or_max]
    end

    private def exarticulate_the_rest
      joined = splited_key.join('_')
      splited_key.clear
      joined
    end
  end
end
