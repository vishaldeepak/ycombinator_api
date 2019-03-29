class Post < ApplicationRecord
  validates :title, length: { minimum: 7}
  validates :url, url: { allow_nil: true }
  before_validation :strip_whitespace
  belongs_to :user

  private
  def strip_whitespace
    self.title = self.title.strip unless self.title.nil?
    self.url = self.url.strip unless self.url.nil?
  end
end
