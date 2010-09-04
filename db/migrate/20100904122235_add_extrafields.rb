class AddExtrafields < ActiveRecord::Migration
  def self.up
    change_table :applicants do |t|
      t.string :serching_job_in
      t.string :postal_code
    end

    change_table :employers do |t|
      t.string :business_name
      t.string :postal_code
    end
  end

  def self.down
  end
end
