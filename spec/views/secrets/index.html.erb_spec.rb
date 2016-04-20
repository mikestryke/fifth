require 'rails_helper'

RSpec.describe "secrets/index", type: :view do
  before(:each) do
    assign(:secrets, [
      Secret.create!(
        :description => "Description",
        :user => nil
      ),
      Secret.create!(
        :description => "Description",
        :user => nil
      )
    ])
  end

  it "renders a list of secrets" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
