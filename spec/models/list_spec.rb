require 'rails_helper'

describe List do
    let(:joe) {User.create(name: "Joe",
        password_digest: "Password",
        fullname: "Joe Shmoe",
        age: 5,
        gender: "Male"
    )}
    let(:list) {List.create(title: "My List", creator: joe)}

    it "belongs to a city" do
        expect(list.creator).to be(joe)
    end

    it "has a title" do
        expect(list.title).to eq("My List")
    end

    context "items" do
        let(:item) do
          Item.create(
            content: 'Some content',
            list_id: list.id,
            status: "In progress",
            category: "Other"
          )
        end
    
        it 'has many items' do
          expect(list.items).to eq([item])
        end
    end
end