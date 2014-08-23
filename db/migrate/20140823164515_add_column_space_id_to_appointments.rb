class AddColumnSpaceIdToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :space_id, :integer
  end
end
