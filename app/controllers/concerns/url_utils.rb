
module UrlUtils
    extend ActiveSupport::Concern

    def shorten(long_url)
        return ('a'..'z').to_a.shuffle[0,8].join
    end
end