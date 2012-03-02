require 'spec_helper'

describe "pairs/edit" do
  before(:each) do
    @pair = assign(:pair, stub_model(Pair))
  end

  it "renders the edit pair form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pairs_path(@pair), :method => "post" do
    end
  end
end
