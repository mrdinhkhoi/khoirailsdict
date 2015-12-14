class Post < ActiveRecord::Base
  belongs_to :user
  validates :title, :description, :presence => true
  validates :title, :uniqueness => true

  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :tag_list
#  validates :image_url, allow_blank: true,
#   format: { with: %r{.(gif|jpg|png)\Z}i, message: 'must be a URL for GIF, JPG or PNG image.' }
  extend FriendlyId
  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    new_record?
  end
  def self.search(search)
    if search
      where("title LIKE ?", "%#{search}%")
      #where("description LIKE ?", "%#{search}%")
    else
      scoped
    end
  end
end