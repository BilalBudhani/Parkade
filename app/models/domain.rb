# == Schema Information
#
# Table name: domains
#
#  id             :bigint           not null, primary key
#  description    :text
#  dns_linked     :boolean          default(FALSE)
#  footer_scripts :text
#  head_scripts   :text
#  name           :string           not null
#  status         :string           not null
#  title          :string
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
class Domain < ApplicationRecord
  belongs_to :user

  validates_presence_of :name, :status
  validates_uniqueness_of :name
end
