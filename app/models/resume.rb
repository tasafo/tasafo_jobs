class Resume < ActiveRecord::Base
  belongs_to :user
  belongs_to :category, class_name: 'JobCategory'

  scope :listed, -> { where(listed: true) }
  default_scope -> { order('id DESC') }

  validates_presence_of :title, :name, :description

  validates :site_url, format: { with: URI.regexp }, allow_blank: true
  validates :facebook_url, format: { with: URI.regexp }, allow_blank: true
  validates :twitter_url, format: { with: URI.regexp }, allow_blank: true
  validates :google_plus_url, format: { with: URI.regexp }, allow_blank: true
  validates :linked_in_url, format: { with: URI.regexp }, allow_blank: true
end
