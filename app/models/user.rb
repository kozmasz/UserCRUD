# encoding: utf-8

class User < ApplicationRecord

  # VALIDATIONS
  # = validates

  validates :name,       presence: true, uniqueness: true
  validates :birth_date, presence: true

  # ASSOCIATIONS
  # = has_many, ... (has_many :comments, [class_name: 'Comment']?, ..., dependent: [ :destroy, :nullify, :delete ])

  has_many :emails, dependent: :destroy

  # NESTED_ATTRIBUTES
  # = accepts_nested_attributes_for :comments

  accepts_nested_attributes_for :emails, allow_destroy: true
end
