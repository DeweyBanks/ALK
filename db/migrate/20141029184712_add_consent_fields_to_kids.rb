class AddConsentFieldsToKids < ActiveRecord::Migration
  def change
    add_column :kids, :behavior_consent, :string
    add_column :kids, :image_consent, :string
    add_column :kids, :late_consent, :string
  end
end
