require 'spec_helper'

describe "advertisements/show" do
  before(:each) do
    @advertisement = assign(:advertisement, stub_model(Advertisement))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
