class ChangeNameToFirstNameLastName < ActiveRecord::Migration
  def self.up
    change_table :applicants do |t|
      t.remove :name
      t.string :first_name
      t.string :last_name
    end

    change_table :employers do |t|
      t.remove :name
      t.string :first_name
      t.string :last_name
    end
  end

  def self.down
    change_table :applicants do |t|
      t.string :name
      t.remove :first_name
      t.remove :last_name
    end

    change_table :employers do |t|
      t.string :name
      t.remove :first_name
      t.remove :last_name
    end
  end
end
