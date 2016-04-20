require 'rails_helper'

RSpec.describe "secrets/edit", type: :view do
  before(:each) do
    @secret = assign(:secret, Secret.create!(
      :description => "MyString",
      :user => nil
    ))
  end

  it "renders the edit secret form" do
    render

    assert_select "form[action=?][method=?]", secret_path(@secret), "post" do

      assert_select "input#secret_description[name=?]", "secret[description]"

      assert_select "input#secret_user_id[name=?]", "secret[user_id]"
    end
  end
end
