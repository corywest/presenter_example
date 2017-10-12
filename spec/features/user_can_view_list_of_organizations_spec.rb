
require 'rails_helper'

feature "User can view list of organizations they are a member of" do
  let(:user) { User.new(
                        uid:      '999999',
                        nickname: 'guy',
                        token:    ENV['GITHUB_TOKEN'])
                      }

  it "on their profile once they log in" do
    # binding.pry
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/dashboard'
binding.pry 
    expect(page).to have_css('.organization', count: 1)
  end
end
