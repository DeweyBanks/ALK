class AddConsentFieldsToKids < ActiveRecord::Migration
  def change
    add_column :kids, :behavior_consent, :boolean
    add_column :kids, :image_consent, :boolean
    add_column :kids, :late_consent, :boolean
  end
end
