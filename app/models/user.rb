class User < ApplicationRecord
  has_many :passed_tests
  has_many :tests, through: :passed_tests
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id

  validates :email, presence: true

 def tests_by_level(level)
 #    # Test.joins('join passed_tests on passed_tests.test_id = tests.id')
 #    #     .where(passed_tests: { user_id: self.id }, level: level)
   tests.where(level: level)
 end
end
