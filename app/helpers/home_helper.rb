module HomeHelper
    # @param [TvShow] tv_show: Tv Show for which you need repeating days
    def repeating_days(tv_show)
        tv_show.repeats_on.split(',').uniq.map do |wday|
            ::Constants::DAYS_MAP[wday.to_i]
        end.join(', ')
    end
end
