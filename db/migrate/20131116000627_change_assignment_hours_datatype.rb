class ChangeAssignmentHoursDatatype < ActiveRecord::Migration
  def up
    connection.execute(%q{
      alter table assignments
      alter column hours
      type integer using cast(hours as integer)
    })
  end
end
