require 'spec_helper'

describe User do
	let!(:user) { FactoryGirl.create(:user) }

	it "must be invalid without a name" do
		user.name = ""
		user.should_not be_valid
	end

	it "must be invalid without an email" do
		user.email = ""
		user.should_not be_valid
	end

	it "must be invalid without a password and confirmation" do
		user.password = ""
		user.password_confirmation = ""
		user.should_not be_valid
	end

	it "must be invalid without password confirmation matching" do
		user.password = "one"
		user.password_confirmation = "two"
		user.should_not be_valid
	end

	it "must authenticate with a matching password" do
		user.password = "a_password"
		user.password_confirmation ="a_password"
		user.authenticate("a_password").should be_true
	end

	it "must not authenticate without password confirmation matching" do
		user.password_confirmation = "two"
		user.authenticate("one").should_not be_true
	end

	it "must not allow two users to have the same email" do
		user2 = FactoryGirl.build(:user)
		user2.should_not be_valid
	end

end
