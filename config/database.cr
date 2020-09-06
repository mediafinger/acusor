database_name = "acusor_#{Lucky::Env.name}"

AppDatabase.configure do |settings|
  if Lucky::Env.production?
    settings.credentials = Avram::Credentials.parse(ENV["DATABASE_URL"])
  else
    settings.credentials = Avram::Credentials.new(
      database: database_name,
      hostname: "localhost",
      port: 5432,
      username: "postgres",
      password: "postgres"
    )
  end
end

Avram.configure do |settings|
  settings.database_to_migrate = AppDatabase

  # In production, allow lazy loading (N+1).
  # In development and test, raise an error if you forget to preload associations
  settings.lazy_load_enabled = Lucky::Env.production?
end
