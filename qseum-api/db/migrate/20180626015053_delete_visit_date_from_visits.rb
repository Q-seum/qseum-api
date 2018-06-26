class DeleteVisitDateFromVisits < ActiveRecord::Migration[5.2]
  def change
    remove_column :visits, :visit_date
  end
end
