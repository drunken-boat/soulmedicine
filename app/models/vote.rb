class Vote < ApplicationRecord
  belongs_to :user

  validates :course_slug,
    presence: true,
    uniqueness: { scope: :user_id }

  def self.get_course_vote_total(course_slug)
    @total_votes = Vote.where(course_slug: course_slug, liked: true).count
  end
end
