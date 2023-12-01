class Post < ApplicationRecord
  def update_author_posts_counter
    author.update(post_counter: author.posts.count)
  end

  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end
end
