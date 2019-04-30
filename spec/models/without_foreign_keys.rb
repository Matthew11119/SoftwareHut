#From https://gist.github.com/myronmarston/61380bb4500b4d85dd3f
RSpec.shared_context "without foreign key constraints", :disable_foreign_keys do
  def without_foreign_key_checks
    DB.run('SET foreign_key_checks = 0;')
    yield
  ensure
    DB.run('SET foreign_key_checks = 1;')
  end

  around(:example) { |ex| without_foreign_key_checks(&ex) }
end
