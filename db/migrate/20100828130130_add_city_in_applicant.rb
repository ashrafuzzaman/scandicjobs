class AddCityInApplicant < ActiveRecord::Migration
  def self.up
    change_table :applicants do |t|
      t.string :city
      t.string :country
    end

    change_table :employers do |t|
      t.string :work_address
    end
  end

  def self.down
    change_table :applicants do |t|
      t.remove :city
      t.remove :country
    end

    change_table :employers do |t|
      t.remove :work_address
    end
  end
end
