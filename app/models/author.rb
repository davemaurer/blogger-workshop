class Author < ActiveRecord::Base
  has_many :articles

  def self.generate_samples(count)
    count.times do |i|
      puts "generating author #{i}"
      Fabricate(:author)
      yield if block_given?
    end
  end

  def self.random
    order('RANDOM()').limit(1).first
  end

end
