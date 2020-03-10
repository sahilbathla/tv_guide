class FavoriteTvShowEmailWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(favorite_tv_show_id)
    favorite_tv_show = FavoriteTvShow.includes(:user, tv_show: :channel).find(favorite_tv_show_id)
    return unless favorite_tv_show
    user = favorite_tv_show.user
    tv_show = favorite_tv_show.tv_show
    UserMailer.with(user: user, tv_show: tv_show).favorite_tv_show_reminder.deliver_later
  end
end