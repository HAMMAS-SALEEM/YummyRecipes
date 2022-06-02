require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before(:each) do
    @user = User.create(name: 'Tresor', email: 'tresor@dodso.fr', password: '11111111')
    expect(@user).to be_valid
    food= Food.create(name: 'Brown sugar',measurement_unit: 'g', price: 2, user: james)
  end
end