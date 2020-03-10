class FavoriteTvShowReminderEmailWorker
    include Sidekiq::Worker
    sidekiq_options retry: false

    def perform
        favorite_tv_shows_of_today = TvShow.joins(:favorite_tv_shows).where('tv_shows.repeats_on LIKE ?', "%#{Time.now.wday}%")
        favorite_tv_shows_of_today.each do |favorite_tv_show|
            remind_at = Time.parse(favorite_tv_show.start_at) - 30.minutes
            ::FavoriteTvShowEmailWorker.perform_at(remind_at, favorite_tv_show.id)
        end
    end
end
