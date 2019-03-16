class CommentersController < ApplicationController
  def index
    time_range = (Time.now - 7.day).midnight..(Time.now)
    @commenters = User.joins(:comments).select('count(comments.id) AS comments_count', 'users.name').order('comments_count DESC').group('users.name').where(comments: { created_at: time_range }).limit(10)
  end
end
