require 'rails_helper'

RSpec.describe Article, type: :model do
  before :each do
    @article = create(:article)
  end

  it 'is valid with valid attributes' do
    expect(@article).to be_valid
  end

  it 'is not valid without a title' do
    @article.title = nil
    expect(@article).to_not be_valid
  end

  it 'is not valid without a body' do
    @article.body = nil
    expect(@article).to_not be_valid
  end
end
