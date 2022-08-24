require 'rails_helper'

RSpec.describe "articles/new", type: :view do
  before(:each) do
    assign(:article, Article.new(
      title: "MyString",
      model: "MyString",
      price: 1
    ))
  end

  it "renders new article form" do
    render

    assert_select "form[action=?][method=?]", articles_path, "post" do

      assert_select "input[name=?]", "article[title]"

      assert_select "input[name=?]", "article[model]"

      assert_select "input[name=?]", "article[price]"
    end
  end
end
