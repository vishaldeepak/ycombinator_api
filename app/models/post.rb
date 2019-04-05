class Post < ApplicationRecord
  acts_as_votable

  validates :title, length: { minimum: 7}
  validates :url, url: { allow_nil: true }
  before_validation :strip_whitespace
  belongs_to :user

  scope :created_order, -> { order("created_at DESC")}

  private
  def strip_whitespace
    self.title = self.title.strip unless self.title.nil?
    self.url = self.url.strip unless self.url.nil?
  end
end
