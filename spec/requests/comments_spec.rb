require 'rails_helper'

describe "Comments", type: :request do
  describe "GET /comments" do
    it "root path" do
      get root_path
      expect(response).to have_http_status(200)
    end

  end
end

describe "Integration", js: true, type: :feature do 
  it "should see react comment" do
    comment = FactoryGirl.create :comment
    visit root_path
    expect(page).to have_content(comment.text)
    expect(page).to have_content(comment.author)
  end
end
