class Owner < ActiveRecord::Base
  # TODO: add validations
  validates :first_name, :last_name, :email, presence: true, length: {maximum: 255}
  validates :email, uniqueness: true, format: { with: /\A[@]+\z/, message: "email must contain @" }
  has_many :line_items, inverse_of: :order

  before_save :normalize_phone_number

  # removes leading 1 and the characters (, ), -, .
  def normalize_phone_number
    # stretch
  end

end
