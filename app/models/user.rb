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

  # INSTANCE METHODS
  # def asd

  def email_addresses
    emails.pluck(:email).join(', ')
  end

  # SERIALIZERS
  # = as_json

  def json_for_users_app
    as_json({
      only: [ :id, :name, :birth_date ],
      methods: [ :email_addresses ]
    })
  end
end
