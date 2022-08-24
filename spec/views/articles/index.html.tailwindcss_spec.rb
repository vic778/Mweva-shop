require 'rails_helper'

RSpec.describe "articles/index", type: :view do
  before(:each) do
    assign(:articles, [
      Article.create!(
        title: "Title",
        model: "Model",
        price: 2
      ),
      Article.create!(
        title: "Title",
        model: "Model",
        price: 2
      )
    ])
  end

  it "renders a list of articles" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "Model".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
