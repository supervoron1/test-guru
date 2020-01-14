class User < ApplicationRecord
  def tests_by_level(level)
    Test.joins('join passed_tests on passed_tests.test_id = tests.id')
        .where(passed_tests: { user_id: self.id }, level: level)
  end
end