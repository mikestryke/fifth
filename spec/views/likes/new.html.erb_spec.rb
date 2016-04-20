require 'rails_helper'

RSpec.describe "likes/new", type: :view do
  before(:each) do
    assign(:like, Like.new(
      :user => nil,
      :secret => nil
    ))
  end

  it "renders new like form" do
    render

    assert_select "form[action=?][method=?]", likes_path, "post" do

      assert_select "input#like_user_id[name=?]", "like[user_id]"

      assert_select "input#like_secret_id[name=?]", "like[secret_id]"
    end
  end
end
