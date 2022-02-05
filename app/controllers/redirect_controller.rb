class RedirectController < ApplicationController
    def index
        url = Url.find_by(short: params[:url])
        unless url.nil?
            redirect_to url.destination, allow_other_host: true
            return
        end
        render :file => "#{Rails.root}/public/404.html",  layout: false, status: :not_found
    end
end
