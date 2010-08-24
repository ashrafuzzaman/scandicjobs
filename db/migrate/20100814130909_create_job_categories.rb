class CreateJobCategories < ActiveRecord::Migration

  def self.up
    create_table :job_categories do |t|
      t.string :title
      t.text :description
      t.integer :position

      t.timestamps
    end

    add_index :job_categories, :id

    load(Rails.root.join('db', 'seeds', 'job_categories.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:title => "Job Categories"})

#    Page.find_all_by_link_url("/job_categories").each do |page|
#      page.link_url, page.menu_match = nil
#      page.deletable = true
#      page.destroy
#    end
#    Page.destroy_all({:link_url => "/job_categories"})

    drop_table :job_categories
  end

end
