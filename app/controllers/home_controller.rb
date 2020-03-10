class HomeController < ApplicationController
    def index
        @tv_shows = TvShow.includes(:channel)
        @favorite_tv_shows_ids = @tv_shows.favorite(current_user).pluck(:id)
    end

    def search
        @tv_shows = TvShow.searchable(params[:q])
        @favorite_tv_show_ids = @tv_shows.favorite(current_user).pluck(:id)
        render :index
    end
end
