require 'rails_helper'

RSpec.feature 'food/index.html.erb', type: :system do
  describe 'food#index' do
    before(:all) do
      # @user = User.create(name: 'James', created_at: Time.now, updated_at: Time.now,
      #   email: 'james@email.com', encrypted_password: '111111')

      # @food = Food.create(name: 'Salt', measurement_unit: 'kg', price: '10', created_at: Time.now,
      #         updated_at: Time.now, user_id: @user.id)
      # @recipe = Recipe.create(name: 'Pizza', preparation_time: '1 hour', cooking_time: '1 hour',
      #             description: 'Today we are making pizza', public: true, created_at: Time.now,
      #             updated_at: Time.now, user_id: @user.id)
      # @recipe_food = RecipeFood.create(quantity: 2, created_at: Time.now, updated_at: Time.now,
      #                      food_id: @food.id, recipe_id: @recipe.id)

      @food1 = Food.create(name: 'Broccoli', measurement_unit: 6, price: 7, user: @tresor)
      @food2 = Food.create(name: 'Blueberries', measurement_unit: 5, price: 15, user: @tresor)
      @food3 = Food.create(name: 'Sweet potatoes', measurement_unit: 15, price: 25, user: @tresor)

      visit new_user_registration_path	
      within('#new_user') do
        fill_in 'Name', with: 'Tresor'
        fill_in 'Email', with: 'tresor@test.com'
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'password'
        click_button 'Sign up'
      end
      user = User.find_by(email: 'tresor@test.com')
      user.confirm

      visit new_user_session_path

      fill_in 'user_email',	with: 'tresor@test.com'
      fill_in 'user_password',	with: 'password'
      click_button 'Log in'
    end

    # it 'should login' do
    #   visit new_user_session_path

    #   fill_in 'user_email',	with: 'tresor@test.com'
    #   fill_in 'user_password',	with: 'password'
    #   click_button 'Log in'
    # end

    # after(:each) do
    #   User.destroy_all
    # end

    scenario 'if logs in, should be able to create food' do
      visit foods_path
      expect(page).to have_content 'Broccoli'
    end

    # it 'renders sign in page' do
    #   visit new_user_session_path
  
    #   expect(page).to have_field('user_email')
    #   expect(page).to have_field('user_password')
    #   expect(page).to have_button('Log in')
    # end

    #   Food.destroy_all
    #   @food1 = Food.create(name: 'Broccoli', measurement_unit: 6, price: 7, user: @tresor)
    #   @food2 = Food.create(name: 'Blueberries', measurement_unit: 5, price: 15, user: @tresor)
    #   @food3 = Food.create(name: 'Sweet potatoes', measurement_unit: 15, price: 25, user: @tresor)

    #   visit new_user_registration_path

    #   within('#new_user') do
    #     fill_in 'Name', with: 'Tresor'
    #     fill_in 'Email', with: 'tresor@test.com'
    #     fill_in 'Password', with: 'password'
    #     fill_in 'Password confirmation', with: 'password'
    #     click_button 'Sign up'
    #   end
    #   user = User.find_by(email: 'tresor@test.com')
    #   user.confirm
    # end

    # it 'renders sign in page' do
    #   visit new_user_session_path
  
    #   expect(page).to have_field('user_email')
    #   expect(page).to have_field('user_password')
    #   expect(page).to have_button('Log in')
    # end

    # it 'should log in' do
    #   visit new_user_session_path

    #   fill_in 'user_email',	with: 'tresor@test.com'
    #   fill_in 'user_password',	with: 'password'
    #   click_button 'Log in'
    # end

    # scenario 'if logs in, should be able navbar links' do
    #   # visit foods_path

    #   expect(page).to have_current_path(public_recipes_path)

      # expect(page).to have_content 'Home'
      # expect(page).to have_content 'My Recipes'
      # expect(page).to have_content 'My Foods'
      # expect(page).to have_content 'My Shopping List'
      # expect(page).to have_content 'Add Food'
      # expect(page).to have_content 'Add Recipe'
      # expect(page).to have_content 'Sign out'
    # end

    #   @tresor = User.create!(name: 'tresor', email: 'tresor@test.com', password: 'password')

    #   # @tresor.confirm

      # Food.destroy_all
      # @food1 = Food.create(name: 'Broccoli', measurement_unit: 6, price: 7, user: @tresor)
      # @food2 = Food.create(name: 'Blueberries', measurement_unit: 5, price: 15, user: @tresor)
      # @food3 = Food.create(name: 'Sweet potatoes', measurement_unit: 15, price: 25, user: @tresor)

    #   visit new_user_session_path

    # scenario 'if logs in, should be able navbar links' do
    #   visit foods_path
    #   expect(page).to have_content 'Home'
    #   expect(page).to have_content 'My Recipes'
    #   expect(page).to have_content 'My Foods'
    #   expect(page).to have_content 'My Shopping List'
    #   expect(page).to have_content 'Add Food'
    #   expect(page).to have_content 'Add Recipe'
    #   expect(page).to have_content 'Sign out'
    # end
  end
end
