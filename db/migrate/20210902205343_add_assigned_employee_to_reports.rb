class AddAssignedEmployeeToReports < ActiveRecord::Migration[6.1]
  def change
    add_reference :reports, :employee, references: :users, null: true
  end
end
