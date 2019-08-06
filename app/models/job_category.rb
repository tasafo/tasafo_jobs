# frozen_string_literal: true

class JobCategory < ActiveRecord::Base
  has_many :jobs, foreign_key: 'category_id'
  has_many :resumes, foreign_key: 'category_id'

  scope :with_joins, -> { joins(:jobs).includes(:jobs) }

  validates_presence_of :name
end
