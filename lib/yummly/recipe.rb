module Yummly
  class Recipe

    def source_name
      Yummly::Source.new(json["sourceDisplayName"])
    end
  end
end
