class TvShowsController < ApplicationController
    def favorite
        @tv_show = TvShow.find(params[:id])
        @tv_show.favorite_tv_shows.create!(user: current_user)
        redirect_back fallback_location: '/'
    end
end
