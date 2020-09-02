# == Schema Information
#
# Table name: enquires
#
#  id         :bigint           not null, primary key
#  email      :string
#  name       :string
#  notes      :text
#  offer      :string
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  domain_id  :bigint           not null
#
# Indexes
#
#  index_enquires_on_domain_id  (domain_id)
#
# Foreign Keys
#
#  fk_rails_...  (domain_id => domains.id)
#
require 'test_helper'

class EnquireTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
