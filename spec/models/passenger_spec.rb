require 'rails_helper'

RSpec.describe Passenger, type: :model do

  describe "validations" do
    it "should create Passenger when it contains valid data" do
      passenger = FactoryBot.build :passenger
      expect(passenger).to be_valid
    end
  end

  it "should not create passenger when first_name is blank" do
    begin
      FactoryBot.create :passenger, first_name: ''
    rescue ActiveRecord::RecordInvalid => invalid
      errors = invalid.record.errors
      expect(errors.include?(:first_name)).to be(true)
    end
  end

  it "should not create customer when last_name is blank" do
    begin
      FactoryBot.create :passenger, last_name: ''
    rescue ActiveRecord::RecordInvalid => invalid
      errors = invalid.record.errors
      expect(errors.include?(:last_name)).to be(true)
    end
  end

end
