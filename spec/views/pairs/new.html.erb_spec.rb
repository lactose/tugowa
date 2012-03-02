require 'spec_helper'

describe "pairs/new" do
  before(:each) do
    assign(:pair, stub_model(Pair).as_new_record)
  end

  it "renders new pair form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pairs_path, :method => "post" do
    end
  end
end
