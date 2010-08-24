class CreateEmployers < ActiveRecord::Migration

  def self.up
    create_table :employers do |t|
      t.string :name
      t.string :name
      t.string :phone
      t.string :email
      t.text :address
      t.references :job_category
      t.references :job_sub_category
      t.string :working_period
      t.text :about_job
      t.integer :position

      t.timestamps
    end

    add_index :employers, :id

    load(Rails.root.join('db', 'seeds', 'employers.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:title => "Employers"})

    Page.find_all_by_link_url("/employers").each do |page|
      page.link_url, page.menu_match = nil
      page.deletable = true
      page.destroy
    end
    Page.destroy_all({:link_url => "/employers"})

    drop_table :employers
  end

end
