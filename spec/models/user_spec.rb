require 'rails_helper'

describe User do
    let(:attributes) do
      {
        name: "Joe",
        password_digest: "Password",
        fullname: "Joe Shmoe",
        age: 5,
        gender: "Male"
      }
    end
   
    it "is considered valid" do
      expect(User.new(attributes)).to be_valid
    end

    let(:missing_name) { attributes.except(:name) }
 
    it "is invalid without a name" do
        expect(User.new(missing_name)).not_to be_valid
    end

    it "is invalid if name is already taken" do
        User.new(attributes)
        expect(User.new(name: "Joe ")).not_to be_valid
    end

  end