require 'spec_helper'

describe "meetings/edit" do
  before(:each) do
    @meeting = assign(:meeting, stub_model(Meeting,
      :name => "MyString",
      :user => nil,
      :room => nil
    ))
  end

  it "renders the edit meeting form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", meeting_path(@meeting), "post" do
      assert_select "input#meeting_name[name=?]", "meeting[name]"
      assert_select "input#meeting_user[name=?]", "meeting[user]"
      assert_select "input#meeting_room[name=?]", "meeting[room]"
    end
  end
end
