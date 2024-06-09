require 'rails_helper'

RSpec.describe Analytic, type: :model do
  before :each do
    @analytic = create(:analytic)
  end

  it 'is valid with valid attributes' do
    expect(@analytic).to be_valid
  end

  it 'is not valid without a query' do
    @analytic.query = nil
    expect(@analytic).to_not be_valid
  end
end
