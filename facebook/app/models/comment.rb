# frozen_string_literal: true

class Comment < ApplicationRecord
  validates :commentary, presence: true
  belongs_to :user
  belongs_to :post
end
