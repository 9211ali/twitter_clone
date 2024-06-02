class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets, dependent: :destroy

  validates :username, uniqueness: { case_insensitive: false }, allow_blank: true

  before_save :set_name, if: -> { username.present? && name.blank? }

  def set_name
    name = username.humanize
  end
end
