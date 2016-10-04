class Owner < ActiveRecord::Base
  # TODO: add validations
  before_save :normalize_phone_number
  validates :first_name, :last_name, :email, presence: true, length: {maximum: 255}
  validates :email, uniqueness: true, format: { with: /\A[@]+\z/, message: "email must contain @" }
  has_many :pets

  # removes leading 1 and the characters (, ), -, .
  def normalize_phone_number
  	# if phone.present && phone[0] == 1
  	# 	phone[0].remove
  	# if phone.present?
  	# 	phone.gsub!(/^1/, "")
  	# 	phone.gsub!(/[()-.],"")
  	# end
  end

end
