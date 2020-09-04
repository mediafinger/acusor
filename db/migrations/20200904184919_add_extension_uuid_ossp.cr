class AddExtensionUuidOssp::V20200904184919 < Avram::Migrator::Migration::V1
  def migrate
    enable_extension "uuid-ossp"
  end

  def rollback
    disable_extension "uuid-ossp"
  end
end
