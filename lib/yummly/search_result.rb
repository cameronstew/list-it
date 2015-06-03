module Yummly
  class SearchResult

    def source_display_name
      json["sourceDisplayName"]
    end
  end
end
