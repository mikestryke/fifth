require 'rails_helper'

RSpec.describe "secrets/new", type: :view do
  before(:each) do
    assign(:secret, Secret.new(
      :description => "MyString",
      :user => nil
    ))
  end

  it "renders new secret form" do
    render

    assert_select "form[action=?][method=?]", secrets_path, "post" do

      assert_select "input#secret_description[name=?]", "secret[description]"

      assert_select "input#secret_user_id[name=?]", "secret[user_id]"
    end
  end
end
