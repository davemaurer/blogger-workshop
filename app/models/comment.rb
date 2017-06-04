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
    all.inject(0) {|total, a| total += a.word_count }
  end
end
