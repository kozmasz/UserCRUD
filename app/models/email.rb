# encoding: utf-8

class Email < ApplicationRecord

  # CONSTANTS
  # = ALMA, KORTE = 0

  # INCLUDES, EXTENDS
  # = include
  # = extend

  # MODULE INITIALIZERS
  # = acts_as_paranoid

  # ATTR
  # = attr_(accessor,writer,reader)

  # VALIDATIONS
  # = validates

  validates :email, presence: true, email_pattern: true

  # ASSOCIATIONS
  # = has_many, ... (has_many :comments, [class_name: 'Comment']?, ..., dependent: [ :destroy, :nullify, :delete ])

  belongs_to :user

  # NESTED_ATTRIBUTES
  # = accepts_nested_attributes_for :comments

  # SCOPES
  # = scope ...

  # CALLBACKS
  # = def hook; end; before_save :hook

  # CFOP
  # = attr_order

  # CLASS METHODS
  # = def self.akarmi; end; (class << self)?

  # INSTANCE METHODS
  # = def akarmi; end;
end
