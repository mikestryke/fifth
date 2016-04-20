require 'rails_helper'

RSpec.describe "likes/edit", type: :view do
  before(:each) do
    @like = assign(:like, Like.create!(
      :user => nil,
      :secret => nil
    ))
  end

  it "renders the edit like form" do
    render

    assert_select "form[action=?][method=?]", like_path(@like), "post" do

      assert_select "input#like_user_id[name=?]", "like[user_id]"

      assert_select "input#like_secret_id[name=?]", "like[secret_id]"
    end
  end
end
