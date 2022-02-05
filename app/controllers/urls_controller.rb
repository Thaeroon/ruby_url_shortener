class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def show
    @url = Url.find(params[:id])
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)

    if @url.save
      redirect_to @url
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @url = Url.find(params[:id])
    @url.destroy

    redirect_to request.referrer, status: :see_other
  end

  private
    def url_params
      params[:url][:short] = shorten(params[:url][:destination])
      params.require(:url).permit(:destination, :short)
    end
    def shorten(long_url)
      return ('a'..'z').to_a.shuffle[0,8].join
    end
end