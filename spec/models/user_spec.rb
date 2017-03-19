require 'rails_helper'

RSpec.describe User, type: :model do
  let (:user) { User.create!(username: "blochead", email: 'blochead@bloc.com', password: "helloworld")}

  describe "attributes" do
      it "should have name and email attributes" do
        expect(user).to have_attributes(username: user.username, email: user.email)
      end

      it "responds to role" do
        expect(user).to respond_to(:role)
      end

      it "responds to admin?" do
        expect(user).to respond_to(:admin?)
      end

      it "responds to premium?" do
        expect(user).to respond_to(:premium?)
      end

      it "resonds to standard?" do
        expect(user).to respond_to(:standard?)
      end
    end
end
