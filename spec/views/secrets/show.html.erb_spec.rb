require 'rails_helper'

RSpec.describe "secrets/show", type: :view do
  before(:each) do
    @secret = assign(:secret, Secret.create!(
      :description => "Description",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
    expect(rendered).to match(//)
  end
end
