require 'rails_helper'

describe List do
    let (:attributes) do
        {
        name: "Joe",
        password_digest: "Password",
        fullname: "Joe Shmoe",
        age: 5,
        gender: "Male"
        }
    end

    joe = User.new(attributes)

    let (:attributes) do
        {
        title: "My List",
        creator: joe
        }
    end

    joes_list = List.new(attributes)
    
    it "list returns creator" do
        describe "Creator and list association works" do
            expect(joes_list.creator).to eql(joe)
        end 
    end
end