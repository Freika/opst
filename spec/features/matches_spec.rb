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

    create_new_match(1900)

    expect(page).to have_content('Match created.')
    expect(page).to have_content('1900')
    expect(Match.last.season).to eq(Season.current)
  end

  it 'gets correct match number' do
    visit matches_path

    fill_qualification

    create_new_match(1900)
    create_new_match(1930)

    within("##{dom_id(Match.last)}") do
      within('.game-number') do
        expect(page).to have_content('2')
      end
    end
  end

  it 'must correctly calculate diff from qualification'

  def fill_qualification
    fill_in 'qualification_skill_rating', with: 1900
    fill_in 'qualification_wins', with: 4
    fill_in 'qualification_losses', with: 4
    fill_in 'qualification_draws', with: 2

    click_on 'Save qualification'
  end

  def create_new_match(rating)
    visit new_match_path

    fill_in 'Skill rating', with: rating
    select hero.name, from: 'match_hero_ids'

    click_on 'Save match'
  end
end
