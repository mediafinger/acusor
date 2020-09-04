abstract class BaseModel < Avram::Model
  macro default_columns
    # Defines a custom primary key type
    primary_key id : UUID

    # adds the `created_at` and `updated_at` timestamps
    timestamps
  end

  def self.database : Avram::Database.class
    AppDatabase
  end
end
