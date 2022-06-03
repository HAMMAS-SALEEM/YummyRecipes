require 'rails_helper'

RSpec.describe 'login page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Tresor', email: 'test@email.com',
                        password: 'password', created_at: Time.now, updated_at: Time.now)

    @user.confirm

    5.times do |_i|
      Recipe.create(name: 'Apple Pie', preparation_time: '20 min', cooking_time: '45 min', description: 'I remember ', public: true, user: @tresor)
      Recipe.create(name: 'Apple Pie Hidden', preparation_time: '20 min', cooking_time: '45 min', description: 'I remember ', public: false, user: @tresor)
      Recipe.create(name: 'Recipe', preparation_time: '20 min', cooking_time: '45 min', description: 'I remember ', public: true, user: @tresor)
    end

    visit new_user_session_path
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end

  context 'should render the public page' do
    it 'should render text on the page' do
      visit public_recipes_path

      expect(page).to have_content('Apple Pie')
      expect(page).to have_content('Apple Pie Hidden')
      expect(page).to have_content('Recipe')
    end
  end

  # it 'I can see one recipe.' do
  #   visit public_recipes_path
  #   expect(page).to have_content 'Apple Pie'
  #   expect(page).to have_content 'Tresor'
  #   expect(page).to have_content 'Ally'
  # end

  context 'testing the add food process' do
    it 'should return error on logging in with empty fields' do
      visit new_food_path

      fill_in 'Name', with: 'Apple'
      fill_in 'Measurement unit', with: 'g'
      click_button 'Submit'
      expect(page).to have_content 'Invalid Entry'
    end

    it 'should create a new food' do
       visit new_food_path

      fill_in 'Name', with: 'Apple'
      fill_in 'Measurement unit', with: 'g'
      fill_in 'Price', with: 4
      click_button 'Submit'

      expect(page).to have_content 'Apple'
      expect(page).to have_content 'REMOVE'
    end
  end
end
