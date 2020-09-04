class CreateUsers::V20200904185000 < Avram::Migrator::Migration::V1
  def migrate
    create table_for(User) do
      primary_key id : UUID
      add active : Bool, default: false
      add email : String, unique: true
      add name : String?
      add roles : Array(String), default: [] of String
      add preferences : JSON::Any?
      add encrypted_password : String
      add_timestamps
    end
  end

  def rollback
    drop table_for(User)
  end
end
