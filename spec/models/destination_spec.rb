# == Schema Information
#
# Table name: destinations
#
#  id         :integer          not null, primary key
#  match_id   :integer
#  map_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Destination, type: :model do
  context 'associations' do
    it { is_expected.to belong_to :match }
    it { is_expected.to belong_to :map }
  end
end
