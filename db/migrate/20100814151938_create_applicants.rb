class CreateApplicants < ActiveRecord::Migration

  def self.up
    create_table :applicants do |t|
      t.string :name
      t.string :gender
      t.integer :age
      t.string :phone
      t.string :email
      t.text :address
      t.references :job_category
      t.references :job_sub_category
      t.string :free_time
      t.string :language
      t.text :about_me
      t.integer :position

      t.timestamps
    end

    add_index :applicants, :id

    load(Rails.root.join('db', 'seeds', 'applicants.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:title => "Applicants"})

    Page.find_all_by_link_url("/applicants").each do |page|
      page.link_url, page.menu_match = nil
      page.deletable = true
      page.destroy
    end
    Page.destroy_all({:link_url => "/applicants"})

    drop_table :applicants
  end

end
