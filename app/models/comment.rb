class Comment < ActiveRecord::Base
  belongs_to :article, counter_cache: true

  validates :article_id, presence: true

  def self.for_dashboard
    # order('created_at DESC').limit(5).all
    order(:id)
      .only(:order)
      .from(Comment.all.reverse_order.limit(5), 'comments')
  end

  def word_count
    body.split.count
  end

  def self.total_word_count
    @comment_word_count ||= all.pluck(:body).reduce(0) { |s, body| s += body.split(" ").count }
    # all.inject(0) {|total, a| total += a.word_count }
    # all.select(:body).map(&:word_count).flatten.count
  end
end
