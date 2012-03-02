require 'spec_helper'

describe "pairs/index" do
  before(:each) do
    assign(:pairs, [
      stub_model(Pair),
      stub_model(Pair)
    ])
  end

  it "renders a list of pairs" do
    render
  end
end
