class User < ApplicationRecord
  def passed_tests(level)
    # Как бы не пробовал, не получилось вынести интерполяцию, чтобы она работала
    # Пробовал и так:
    # Test.joins("JOIN user_tests ON tests.id = user_tests.test_id AND user_tests.user_id = ?", id)
    # И так
    # Test.joins("JOIN user_tests ON tests.id = user_tests.test_id AND user_tests.user_id = :id", id: id)
    # и со словом self.

    Test.joins("JOIN user_tests ON tests.id = user_tests.test_id AND user_tests.user_id = #{id}")
    .where(level: level)
  end
end
