class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  after_initialize :set_default_counters
  after_create :update_user_posts_counter

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def set_default_counters
    self.comments_counter ||= 0
    self.likes_counter ||= 0
  end

  def update_user_posts_counter
    author.with_lock do
      author.increment!(:posts_counter)
    end
  end
end
