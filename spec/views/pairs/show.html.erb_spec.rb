require 'spec_helper'

describe "pairs/show" do
  before(:each) do
    @pair = assign(:pair, stub_model(Pair))
  end

  it "renders attributes in <p>" do
    render
  end
end
