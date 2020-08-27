# == Schema Information
#
# Table name: domains
#
#  id             :bigint           not null, primary key
#  dns_linked     :boolean          default(FALSE)
#  footer_scripts :text
#  head_scripts   :text
#  name           :string           not null
#  status         :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_domains_on_name     (name) UNIQUE
#  index_domains_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class DomainTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
