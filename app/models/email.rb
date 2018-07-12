# encoding: utf-8

class Email < ApplicationRecord
  # VALIDATIONS

  validates :email, presence: true, email_pattern: true

  # ASSOCIATIONS

  belongs_to :user
end
