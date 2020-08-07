class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :title_has_to_be_clickbait

  def title_has_to_be_clickbait
    if title
      key_words = ["Won't Believe", "Secret", "Top [number]", "Guess"]

      unless key_words.any? { |key_word| title.include? key_word }
        errors.add(:title, "has to include clichbait keywords")
      end
    end
  end
end
