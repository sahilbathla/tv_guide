require 'test_helper'

class TvShowTest < ActiveSupport::TestCase
  test 'start time > end_time' do
    tv_show = TvShow.new(code: 123, channel: Channel.first, start_at: '08:30', end_at: '08:00', repeats_on: '0')
    assert_equal(tv_show.valid?, false)
  end

  test 'start time < end_time' do
    tv_show = TvShow.new(code: 123, channel: Channel.first, start_at: '08:30', end_at: '09:00', repeats_on: '0')
    assert_equal(tv_show.valid?, true)
  end

  test 'repeat_on in should fall in range' do
    tv_show = TvShow.new(code: 123, channel: Channel.first, start_at: '08:30', end_at: '09:00', repeats_on: '0, 1')
    assert_equal(tv_show.valid?, true)
  end

  test 'error if repeat_on not in raange' do
    tv_show = TvShow.new(code: 123, channel: Channel.first, start_at: '08:30', end_at: '09:00', repeats_on: '8,9')
    assert_equal(tv_show.valid?, false)
  end

  test 'error if code is not given' do
    tv_show = TvShow.new(code: nil, channel: Channel.first, start_at: '08:30', end_at: '09:00', repeats_on: '8,9')
    assert_equal(tv_show.valid?, false)
  end

  test 'error if channel is not given' do
    tv_show = TvShow.new(code: 123, channel: nil, start_at: '08:30', end_at: '09:00', repeats_on: '8,9')
    assert_equal(tv_show.valid?, false)
  end
end
