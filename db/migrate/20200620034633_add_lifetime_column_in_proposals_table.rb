class AddLifetimeColumnInProposalsTable < ActiveRecord::Migration[5.2]
  def change
    add_column  :proposals, :lifetime, :integer
  end
end
