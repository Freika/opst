require 'rails_helper'

describe 'Matches' do
  let!(:first_season) { create(:season, name: 'First') }
  let!(:user) { create(:user) }
  let!(:second_season) { create(:season, name: 'Second') }
  let!(:map) { create(:map) }
  let!(:hero) { create(:hero) }

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

      fill_qualification

      expect(page).to have_content(
        "#{second_season.name} season qualification saved."
      )
    end
  end

  it 'related to current season on creating' do
    visit matches_path

    fill_qualification

    visit new_match_path

    fill_in 'Skill rating', with: 1900
    select hero.name, from: 'match_hero_ids'

    click_on 'Save match'

    expect(page).to have_content('Match created.')
    expect(page).to have_content('1900')
    expect(Match.last.season).to eq(Season.current)
  end

  def fill_qualification
    fill_in 'qualification_skill_rating', with: 1900
    fill_in 'qualification_wins', with: 4
    fill_in 'qualification_losses', with: 4
    fill_in 'qualification_draws', with: 2

    click_on 'Save qualification'
  end
end
