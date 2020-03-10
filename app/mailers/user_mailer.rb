
class UserMailer < ApplicationMailer
    default from: 'info@tvguide.com'
   
    def favorite_tv_show_reminder
      @user = params[:user]
      @tv_show = params[:tv_show]
      mail(to: @user.email, subject: 'Favorite Tv Show Reminder', body: "#{@tv_show.name} will start in 30 minutes(#{@tv_show.start_at}-#{@tv_show.end_at} UTC) on #{@tv_show.channel.name}")
    end
end