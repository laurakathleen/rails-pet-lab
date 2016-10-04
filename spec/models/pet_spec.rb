require 'rails_helper'

RSpec.describe Pet, type: :model do
  let (:owner) do
    Owner.create({ first_name: "John", last_name: "Doe", email: "john@doe.com", phone: "234-567-8901"})
  end
  subject (:pet) do
    age = 37.0
    Pet.create({name: "Fluffy", breed: "gerbil", date_of_birth: (DateTime.now-age).to_date})
  end

  describe Pet do
    # TODO: test that it requires (validates the presence of) name
    # TODO: that it validates the length of the name is <= 255
    # TODO: test that it requires breed
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(255) }

    it { should validate_presence_of(:breed) }

    context "when validating an email" do
      it "contains an @ symbol" do
        owner.email = "asdf"
        expect{owner.save!}.to raise_error ActiveRecord::RecordInvalid
      end
    end
  end

end
