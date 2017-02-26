require 'rails_helper'

describe 'Matches' do
  let!(:first_season) { create(:season) }
  let!(:user) { create(:user) }
  let!(:second_season) { create(:season) }

  before(:each) do
    login_as(user, scope: :user)
  end

  context 'Qualification' do
    it 'requires to be created before matches available' do
      visit matches_path

      expect(page).to have_content('provide current season qualification data')
    end

    it 'should be successfully created when form is filled and sent' do
      visit matches_path

      fill_in 'qualification_skill_rating', with: 1900
      fill_in 'qualification_wins', with: 4
      fill_in 'qualification_losses', with: 4
      fill_in 'qualification_draws', with: 2

      click_on 'Save qualification'
save_and_open_page
      expect(page).to have_content(
        "#{second_season.name} season qualification saved."
      )
    end
  end
end
